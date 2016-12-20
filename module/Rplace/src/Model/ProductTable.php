<?php

namespace Rplace\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Crypt\Password\Bcrypt;

class ProductTable
{
    protected $productTableGateway;
	protected $userBuyTableGateway;

    public function __construct($productTableGateway,$userBuyTableGateway)
    {
        $this->productTableGateway = $productTableGateway;
		$this->userBuyTableGateway = $userBuyTableGateway;
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
    
    public function register($name,$email,$phone,$password)
    {
        $bcrypt = new Bcrypt();
        $cpwd = password_hash($password, PASSWORD_BCRYPT);
        $data = [
           'password' => $cpwd,
           'email'  => $email,
		   'name'   =>$name,
		   'phone' => $phone,
        ];
        
       $this->userTableGateway->insert($data);
    }

	public function getRowByEmail($email)
	{
        $rowset = $this->userTableGateway->select(array('email' => $email));
        $row = $rowset->current();
		if(!$row) {
			return null;
		}
		else
			return $row;        

	}
}