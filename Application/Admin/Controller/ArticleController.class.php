<?php
namespace Admin\Controller;
use Admin\Controller\BackendController;
class ArticleController extends BackendController {
    public function index(){
        $this->display();
    }
    
    public function addArticle(){
    	$this->display();
    }
    
    public function addNotice(){
    	$this->display();
    }
    
    public function listNotice(){
    	$this->display();
    }
}