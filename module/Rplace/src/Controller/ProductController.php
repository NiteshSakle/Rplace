<?php

namespace Rplace\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Rplace\Model\LoginTable;
use Rplace\Model\ProductTable;
use Zend\View\Model\JsonModel;
use Zend\Crypt\Password\Bcrypt;

class ProductController extends AbstractRestfulController
{
	private $productTable;

	public function __construct(ProductTable $productTable)
	{
		$this->productTable = $productTable;
	}
	
	public function getList()
	{
	}
	public function get($id)
   	{	
		echo "Ohho";
		exit();
	}

	public function create($userInfo)										//Login
	{

		echo "cool";
		exit();

	}


	
    public function registerAction()
    {

	}

	public function replaceList($todo)
	{
	}

	public function delete($task)
	{
	}
}
