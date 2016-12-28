<?php

namespace Rplace\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Crypt\Password\Bcrypt;

class LoginTable
{

    protected $userTableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->userTableGateway = $tableGateway;
    }

    public function getRow($empId)
    {
        $rowset = $this->userTableGateway->select(array('employee_id' => $empId));
        $row = $rowset->current();
        if (!$row) {
            return null;
        } else
            return $row;
    }

    public function updateUserInfo($emp_id,$pin)
    {
        $bcrypt = new Bcrypt();
        $cpwd = password_hash($pin, PASSWORD_BCRYPT);

        $data = [
            'pin' => $cpwd
        ];
        $this->userTableGateway->update($data, ['employee_id' => $emp_id]);

        return;
    }

}
