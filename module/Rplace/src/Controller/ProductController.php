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

    public function generateBillAction()       //Bill_Amount
    {
        $data = array();
        $empId = $this->params()->fromPost('id', 0);
        $user = $this->productTable->getRow($empId);
        $userId = $user->id;

        $debt = $this->productTable->getAmount($userId);
        $deposit = $this->productTable->getDeposit($userId);
        $lastThreePurchases = $this->productTable->getLastPurchases($userId);

        foreach ($lastThreePurchases as $item) {
            $data[] = $item;
        }

        return new JsonModel(array(
            "Result" => $debt - $deposit,
            "last_transactions" => $data
        ));
    }

    public function create($purchaseInfo)          //Adding UserPurchase
    {
        $product = $this->productTable->getProductId($purchaseInfo['barcode']);

        $productId = $product->id;

        $user = $this->productTable->getRow($purchaseInfo['emp_id']);
        $userId = $user->id;

        $this->productTable->addPurchase($productId, $userId);
        
        return new JsonModel(array(
            "product_name" => $product->name,
            "product_price" => $product->price
        ));
    }

    public function depositAction()
    {
        $empId = $this->params()->fromPost('id', 0);
        $amount = $this->params()->fromPost('amount', 0);

        $user = $this->productTable->getRow($empId);
        $userId = $user->id;

        $this->productTable->deposit($userId, $amount);

        return new JsonModel(array(
            "is_deposited" => "200"
        ));
    }

    public function addProductAction()
    {
        $barcode = $this->params()->fromPost('barcode', 0);
        $name = $this->params()->fromPost('name', 0);
        $price = $this->params()->fromPost('price', 0);

        $description = $this->productTable->getProductId($barcode);
        if($description) {
            return new JsonModel(array(
                "is_added" => "403"
            ));
        }
            
        $this->productTable->addProduct($barcode, $name, $price);

        return new JsonModel(array(
            "is_added" => "200"
        ));
    }
    
    public function verifyProductAction()
    {
        $barcode = $this->params()->fromRoute('id',0);
        $description = $this->productTable->getProductId($barcode);
        
        return new JsonModel(array(
            "product_name" => $description->name,
            "product_price" => $description->price
        ));
    }
}
