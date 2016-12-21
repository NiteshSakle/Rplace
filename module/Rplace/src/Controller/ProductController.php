<?php

namespace Rplace\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\Mvc\Controller\AbstractActionController;
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

	public function generateBillAction()
   	{	
		$debt = 0;
		$deposit = 0;
		
		$empId = $this->params()->fromPost('id',0);
		$user = $this->productTable->getRow($empId);
		$userId = $user->id;

		$results = $this->productTable->getAmount($userId);
		$deposits = $this->productTable->getDeposit($userId);
		
		foreach($results as $item)
			$debt += $item->price; 
		foreach($deposits as $depo)
			$deposit += $depo->amount; 

		  return new JsonModel(array(
			 "Paid Amount" => $deposit,
			 "Purchase Amount"   => $debt,
			 "Result" => $debt-$deposit
		));
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

	public function depositAction()
	{
		$empId = $this->params()->fromPost('id',0);
		$amount = $this->params()->fromPost('amount',0);

		$user = $this->productTable->getRow($empId);
		$userId = $user->id;

		$this->productTable->deposit($userId,$amount);

		return new JsonModel(array(
			"data" =>"Deposited"
		));
	}

	public function addProductAction()
	{
		$barcode = $this->params()->fromPost('barcode',0);
		$name = $this->params()->fromPost('name',0);
		$price = $this->params()->fromPost('price',0);

		$this->productTable->addProduct($barcode,$name,$price);

		return new JsonModel(array(
			"data" =>"Added"
		));
	}


}