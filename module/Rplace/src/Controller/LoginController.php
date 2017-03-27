<?php

namespace Rplace\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Rplace\Model\LoginTable;
use Rplace\Model\ProductTable;
use Zend\View\Model\JsonModel;
use Zend\Crypt\Password\Bcrypt;

class LoginController extends AbstractRestfulController
{

    private $loginTable;
    private $productTable;

    public function __construct(LoginTable $table, ProductTable $productTable)
    {
        $this->loginTable = $table;
        $this->productTable = $productTable;
    }

    public function create($userInfo)          //Login
    {
        $row = $this->loginTable->getRow($userInfo['emp_id']);

        if (!$row) {
            return new JsonModel(array(
                "success" => FALSE,
                "message" => "User Doesn't Exist",
            ));
        }

        $bcrypt = new Bcrypt();
        if (password_verify($userInfo['pin'], $row->pin)) {

            $data = array();
            $empId = $userInfo['emp_id'];
            $user = $this->productTable->getRow($empId);
            $userId = $user->id;
            $debt = $this->productTable->getAmount($userId);
            $deposit = $this->productTable->getDeposit($userId);
            $lastThreePurchases = $this->productTable->getLastPurchases($userId);

            foreach ($lastThreePurchases as $item) {
                $data[] = $item;
            }

            return new JsonModel(array(
                "success" => TRUE,
                "emp_name" => $row->name,
                "is_password_changed" => !$row->is_password_changed ? false : true,
                "is_authorised" => $row->authorised,
                "amount_owed" => $debt - $deposit,
                "last_transactions" => $data,
            ));
        }
        return new JsonModel(array(
            "success" => FALSE,
            "message" => "Password Wrong",
        ));
    }

    public function changePasswordAction()   //Update Password
    {
        $emp_id = $this->params()->fromPost('emp_id');
        $pin = $this->params()->fromPost('pin');
        $this->loginTable->updateUserInfo($emp_id, $pin);

        return new JsonModel(array(
            "success" => TRUE,
            "message" => "Password Changed",
        ));
    }

    public function backupAction()
    {
        $tableNames = ['product', 'user', 'user_buy'];

        $return = "\n\n -- Backup Time :" . date('d-m-Y H:m:s') . "  (" . time() . ") \n\n\n";
        foreach ($tableNames as $table) {
            $result = $this->productTable->getTableData($table);

            $return.= "\n\n -- " . $table . " Data \n\n";
            $arrayKeys = array_keys($result[0]);
            $num_fields = count($arrayKeys);
            foreach ($result as $row) {
                $return.= 'INSERT INTO ' . $table . ' VALUES(';

                for ($j = 0; $j < $num_fields; $j++) {
                    $row[$arrayKeys[$j]] = addslashes($row[$arrayKeys[$j]]);
                    $row[$arrayKeys[$j]] = ereg_replace("\n", "\\n", $row[$arrayKeys[$j]]);
                    if (isset($row[$arrayKeys[$j]])) {
                        $return.= '"' . $row[$arrayKeys[$j]] . '"';
                    } else {
                        $return.= '""';
                    }
                    if ($j < ($num_fields - 1)) {
                        $return.= ',';
                    }
                }
                $return.= "); \n";
            }
            $return.="\n\n\n";
        }

        //save file	
        $filePath = '/var/www/html/Rplace/data_rplace/current-db.sql';
        $handle = fopen($filePath, 'w+');
        fwrite($handle, $return);
        fclose($handle);

        echo 'success';
        return true; 
    }

}
