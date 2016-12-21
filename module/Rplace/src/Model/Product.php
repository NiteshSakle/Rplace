<?php
namespace Rplace\Model;

use DomainException;
use Zend\Filter\StringTrim;
use Zend\Filter\StripTags;
use Zend\Filter\ToInt;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\Validator\StringLength;

class Product implements InputFilterAwareInterface
{
    public $name;
    public $price;
    public $barcode;
    public $user_id;
    public $product_id;
    private $inputFilter;

	public function exchangeArray(array $data)
    {
        $this->name  = !empty($data['name']) ? $data['name'] : "";
        $this->price  = !empty($data['price']) ? $data['price'] : "";
        $this->barcode  = !empty($data['barcode']) ? $data['barcode'] : null;
        $this->product_id  = !empty($data['product_id']) ? $data['product_id'] : null;
        $this->user_id = !empty($data['user_id']) ? $data['user_id'] : null;      
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new DomainException(sprintf(
            '%s does not allow injection of an alternate input filter',
            __CLASS__
        ));
    }
	
    public function getArrayCopy()
    {
      
    }

    public function getInputFilter()
    {
        
    }
}
