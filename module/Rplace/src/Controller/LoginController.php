<?php

namespace Rplace\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
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

    public function create($userInfo)          //Login
    {
        $row = $this->loginTable->getRow($userInfo['emp_id']);
  
        if (!$row) {
            return new JsonModel(array(
                "is_valid_user" => 404
            ));
        }

        $bcrypt = new Bcrypt();
        if (password_verify($userInfo['pin'], $row->pin)) {
            return new JsonModel(array(
                "is_valid_user" => 200,
                "emp_name" => $row->name,
                "is_authorised" => $row->authorised
            ));
        }
        return new JsonModel(array(
            "is_valid_user" => 401
        ));
    }

    public function replaceList($updateInfo)   //Update Password
    {
        $this->loginTable->updateUserInfo($updateInfo);

        return new JsonModel(array(
            "is_updated" => "200"
        ));
    }

}
