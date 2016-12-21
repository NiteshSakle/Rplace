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
	public function generateBillAction()
   	{	
		$tot = 0;

		$empId = $this->params()->fromPost('id',0);

		$user = $this->productTable->getRow($empId);
		$userId = $user->id;

		$results = $this->productTable->getAmount($userId);
		
		foreach($results as $item)
		{
			$tot += $item->price; 
		}
		echo $tot;
		exit();
	}

	public function create($purchaseInfo)										//Adding UserPurchase
	{
		$product = $this->productTable->getProductId($purchaseInfo['barcode']);
		$productId = $product->id;

		$user = $this->productTable->getRow($purchaseInfo['emp_id']);
		$userId = $user->id;

		$this->productTable->addPurchase($productId,$userId);

        return new JsonModel(array(
			 "data" => "Added"
		));
	}
}