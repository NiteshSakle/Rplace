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

    public function __construct(LoginTable $table,  ProductTable $productTable)
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
        $this->loginTable->updateUserInfo($emp_id,$pin);

        return new JsonModel(array(
            "success" => TRUE,
            "message" => "Password Changed",  
       ));
    }
}
