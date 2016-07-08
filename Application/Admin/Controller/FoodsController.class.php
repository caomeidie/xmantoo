<?php
namespace Admin\Controller;
use Admin\Controller\BackendController;
class FoodsController extends BackendController {
    public function index(){
        $this->display();
    }
}