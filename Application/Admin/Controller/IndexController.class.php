<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Verify;
class IndexController extends Controller {
    public function index(){
        $this->display();
    }
    
    public function login(){
    	$admin_name = I('post.admin');
    	$password = I('post.password');
    	$verify = I('post.verify');
    	if(!$this->check_verify($verify)){
    		$this->error("亲，验证码输错了哦！",$this->site_url,3);
    	}
    }
    
    public function verify(){
    	$Verify = new Verify();
    	$Verify->fontSize = 13;
    	$Verify->useNoise = false;
    	$Verify->imageW = 80;
    	$Verify->imageH = 32;
    	$Verify->length = 4;
    	$Verify->entry();
    }
    
    public function check_verify($code){
    	$Verify = new Verify();
    	return $Verify->check($code); 
    }
}