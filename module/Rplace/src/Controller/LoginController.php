<?php

namespace Rplace\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Rplace\Model\LoginTable;
use Zend\View\Model\JsonModel;
use Zend\Crypt\Password\Bcrypt;

class LoginController extends AbstractRestfulController
{
	private $loginTable;

	public function __construct(LoginTable $table)
	{
		$this->loginTable = $table;
	}
	
	public function create($userInfo)										//Login
	{
			$row = $this->loginTable->getRow($userInfo['emp_id']);
		   
	        if (!$row) {
	            return new JsonModel(array(
					 "data" => "No User"
				));
			}

			$bcrypt = new Bcrypt();
			if (password_verify($userInfo['pin'], $row->pin)) {
				return new JsonModel(array(
					 "data" => "Success"
				));
			}
			return new JsonModel(array(
				 "data" => "Failed"
			));
	 }

	public function replaceList($updateInfo)			//Update Password
	{
		$this->loginTable->updateUserInfo($updateInfo);

		return new JsonModel(array(
				"data" => "Updated"
		));
	}

}
