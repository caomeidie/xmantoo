<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Verify;
class IndexController extends Controller {
	public function __construct(){
		if(session('admin')){
			$this->redirect('Foods/index');
		}
	}
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
    	if($adminInfo = M('Admin')->where(array('admin_name'=>$admin_name, 'password'=>sha1($password)))->find()){
    		session('admin', $adminInfo);
    		$this->redirect('Foods/index');
    	}else{
    		$this->error("登录失败！");
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