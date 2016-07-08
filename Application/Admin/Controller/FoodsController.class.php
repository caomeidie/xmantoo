<?php
namespace Admin\Controller;
use Admin\Controller\BackendController;
class FoodsController extends BackendController {
    public function index(){
        $this->display();
    }
    
    public function addFoods(){
    	$this->display();
    }
    
    public function addCuisine(){
    	$this->display();
    }
    
    public function listCuisine(){
    	$this->display();
    }
}