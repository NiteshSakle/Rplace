<?php

namespace Rplace\Model;

use Zend\Db\Sql\Expression;
use Zend\Db\Sql\Select;

class ProductTable
{

    protected $productTableGateway;
    protected $userBuyTableGateway;
    protected $userTableGateway;
    protected $userDepositTableGateway;

    public function __construct($userTableGateway, $productTableGateway, $userBuyTableGateway, $userDepositTableGateway)
    {
        $this->productTableGateway = $productTableGateway;
        $this->userBuyTableGateway = $userBuyTableGateway;
        $this->userTableGateway = $userTableGateway;
        $this->userDepositTableGateway = $userDepositTableGateway;
    }

    public function getRow($empId)
    {
        $rowset = $this->userTableGateway->select(array('employee_id' => $empId));
        $row = $rowset->current();
        if (!$row) {
            return null;
        } else {
            return $row;
        }
    }

    public function getProductId($code)
    {
        $rowset = $this->productTableGateway->select(array('barcode' => $code));
        $row = $rowset->current();
        if (!$row) {
            return null;
        } else {
            return $row;
        }
    }

    public function addPurchase($pid, $uid, $price)    //Adding User  Transacation
    {
        $data = [
            'product_id' => $pid,
            'user_id' => $uid,
            'price' => $price
        ];

        try {
            $this->userBuyTableGateway->insert($data);   
        } catch (\Exception $exc) {
            return FALSE;
        }
        return TRUE;
    }

    public function getAmount($empId)
    {
        $select = new Select();
        $select->from(array('p' => $this->productTableGateway->getTable()))
                ->join(array('ub' => $this->userBuyTableGateway->getTable()), 'ub.product_id= p.id', array('sum' => new Expression('SUM(ub.price)')))
                ->where(array('ub.user_id' => $empId));

        $resultSet = $this->productTableGateway->selectWith($select);

        foreach ($resultSet as $item) {
            $debt = $item->sum;
        }

        return $debt;
    }

    public function getLastPurchases($empId)
    {
        $select = new Select();
        $select->from(array('p' => $this->productTableGateway->getTable()))
                ->join(array('ub' => $this->userBuyTableGateway->getTable()), 'ub.product_id= p.id')
                ->where(array('ub.user_id' => $empId))
                ->order('ub.id DESC')
                ->limit(3);

        $resultSet = $this->productTableGateway->selectWith($select);

        return $resultSet;
    }

    public function getDeposit($empId)
    {
        $select = new Select();
        $select->from(array('p' => $this->userTableGateway->getTable()))
                ->join(array('ub' => $this->userDepositTableGateway->getTable()), 'ub.user_id= p.id', array('sum' => new Expression('SUM(ub.amount)')))
                ->where(array('ub.user_id' => $empId));

        $resultSet = $this->userTableGateway->selectWith($select);
         
        foreach ($resultSet as $depo) {
            $deposit = $depo->sum;
        }
        return $deposit;
    }

    public function deposit($empId, $amount)   //User Deposit Money
    {
        $data = [
            'user_id' => $empId,
            'amount' => $amount
        ];

        try {
             $this->userDepositTableGateway->insert($data);
        } catch (Exception $ex) {
                return FALSE;
        }

        return TRUE;
    }

    public function addProduct($barcode, $name, $price)  //New Product Add
    {
        $data = [
            'name' => $name,
            'price' => $price,
            'barcode' => $barcode
        ];

        try {
            $this->productTableGateway->insert($data);            
        } catch (Exception $ex) {
               return FALSE;
        }
        
        return TRUE;
    }

}
