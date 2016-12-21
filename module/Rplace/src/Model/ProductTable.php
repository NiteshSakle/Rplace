<?php

namespace Rplace\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Crypt\Password\Bcrypt;
use Zend\Db\Sql\Select;

class ProductTable
{
    protected $productTableGateway;
	protected $userBuyTableGateway;
	protected $userTableGateway;
	protected $userDepositTableGateway;

    public function __construct($userTableGateway,$productTableGateway,$userBuyTableGateway,$userDepositTableGateway)
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
		if(!$row) {
			return null;
		}
		else
			return $row;        
    }

	public function getProductId($code)
	{
        $rowset = $this->productTableGateway->select(array('barcode' => $code));
        $row = $rowset->current();
		if(!$row) {
			return null;
		}
		else
			return $row;        
	}

	public function addPurchase($pid,$uid)
	{
        $data = [
            'product_id' => $pid,
			'user_id' => $uid
        ];

        $this->userBuyTableGateway->insert($data);
		return;
	}

	public function getAmount($empId)
	{
        $select = new Select();
        $select->from(array('p' => $this->productTableGateway->getTable()))
                 ->columns(array('price'))
                ->join(array('ub' => $this->userBuyTableGateway->getTable()), 'ub.product_id= p.id')
                ->where(array('ub.user_id' => $empId));

        $resultSet = $this->productTableGateway->selectWith($select);
	
		return $resultSet;
	
	}

	public function getDeposit($empId)
	{
		$select = new Select();
        $select->from(array('p' => $this->userTableGateway->getTable()))
                ->join(array('ub' => $this->userDepositTableGateway->getTable()), 'ub.user_id= p.id')
                ->where(array('ub.user_id' => $empId));

        $resultSet = $this->userTableGateway->selectWith($select);

		return $resultSet;

	}

	public function deposit($empId,$amount)
	{
		$data = [
            'user_id' => $empId,
			'amount' => $amount
        ];

        $this->userDepositTableGateway->insert($data);
		return;

	}

	public function addProduct($barcode,$name,$price)
	{
		$data = [
            'name' => $name,
			'price' => $price,
			'barcode' => $barcode
        ];

        $this->productTableGateway->insert($data);
		return;


	}
  
}