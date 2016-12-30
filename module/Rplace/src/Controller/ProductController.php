<?php

namespace Rplace\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Rplace\Model\ProductTable;
use Zend\View\Model\JsonModel;

class ProductController extends AbstractRestfulController
{

    private $productTable;

    public function __construct(ProductTable $productTable)
    {
        $this->productTable = $productTable;
    }

    public function purchaseProductAction()          //Adding UserPurchase
    {
        $barcode = $this->params()->fromPost('barcode');
        $product = $this->productTable->getProductId($barcode);

        $productId = $product->id;

        $emp_id = $this->params()->fromPost('emp_id');
        $user = $this->productTable->getRow($emp_id);
        if(!$user) {
            return new JsonModel(array(
                "success" => FALSE,
                "message" => "No User."
            )); 
        }

        $userId = $user->id;

        $resposnse = $this->productTable->addPurchase($productId, $userId , $product->price);
        if($resposnse == FALSE) {
            return new JsonModel (array(
                "success" => FALSE,
                "message" => "Parameters Missing"
            ));
        }
        
        return new JsonModel(array(
            "success" => TRUE,
            "message" => "Purachase Recorded Successfully",
            "product_name" => $product->name,
            "product_price" => $product->price
        ));
    }

    public function depositAction()
    {
        $empId = $this->params()->fromPost('emp_id');
        $amount = $this->params()->fromPost('price',0);
        if($amount == 0) {
            return new JsonModel(array(
                "success" => FALSE,
                "message" => "Enter Amount"
        )); 
        }
        $user = $this->productTable->getRow($empId);
        if(!$user) {
            return new JsonModel(array(
                "success" => FALSE,
                "message" => "No User."
        )); 
        }
        $userId = $user->id;

        $response = $this->productTable->deposit($userId, $amount);
        if($response == FALSE) {
            return new JsonModel (array(
                "success" => FALSE,
                "message" => "Parameters Missing"
            ));
        }
        return new JsonModel(array(
                "success" => TRUE,
                "message" => "Money Deposited."
        ));
    }

    public function addProductAction()
    {
        $barcode = $this->params()->fromPost('barcode');
        $name = $this->params()->fromPost('name');
        $price = $this->params()->fromPost('price');

        $description = $this->productTable->getProductId($barcode);
        if($description) {                                               //duplicate Product 
            return new JsonModel(array(
                "success" => FALSE,
                "message" => "Already In Record"
            ));
        }
            
        $response = $this->productTable->addProduct($barcode, $name, $price);   // failed
        if($response == 0) {
            return new JsonModel(array(
                "success" => FALSE,
        ));
        }
        return new JsonModel(array(
                "success" => TRUE,
                "message" => "Added Successfully"
        ));
    }
    
    public function verifyProductAction()
    {
        $barcode = $this->params()->fromPost('barcode');
        $description = $this->productTable->getProductId($barcode);
        if(!$description) {
            return new JsonModel(array(
            "success" => FALSE,
            "message" => "No Product With This Code"
        ));
        }
            
        return new JsonModel(array(
            "success" => TRUE,
            "product_name" => $description->name,
            "product_price" => $description->price
        ));
    }
    
    public function getAmountByIdAction()
    {
        $empId = $this->params()->fromPost('emp_id');
        $user = $this->productTable->getRow($empId);
        if(!$user) {
            return new JsonModel(array(
                "success" => FALSE,
                "message" => "No User."
            )); 
        }
        $userId = $user->id;
        $debt = $this->productTable->getAmount($userId);
        $deposit = $this->productTable->getDeposit($userId);
        
        return new JsonModel(array(
            "success" => TRUE,
            "amount_owed" => $debt-$deposit
        ));
        
    }
}
