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
		echo "Get With Id";
		exit();
	}

	public function create($userInfo)										//Adding UserPurchase
	{
		$product = $this->productTable->getProductId($userInfo['barcode']);
		$productId = $product->id;

		$user = $this->productTable->getRow($userInfo['emp_id']);
		$userId = $user->id;

		$this->productTable->addPurchase($productId,$userId);

        return new JsonModel(array(
			 "data" => "Added"
		));
	}

	public function replaceList($todo)
	{
	}

	public function delete($task)
	{
	}
}