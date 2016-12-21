<?php

namespace Rplace\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Crypt\Password\Bcrypt;

class ProductTable
{
    protected $productTableGateway;
	protected $userBuyTableGateway;
	protected $userTableGateway;

    public function __construct($userTableGateway,$productTableGateway,$userBuyTableGateway)
    {
        $this->productTableGateway = $productTableGateway;
		$this->userBuyTableGateway = $userBuyTableGateway;
		$this->userTableGateway = $userTableGateway;
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
  
}