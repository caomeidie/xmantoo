<?php
namespace Admin\Controller;
use Admin\Controller\BackendController;
class FoodsController extends BackendController {
    public function index(){
        $this->display();
    }
    
    public function addFoods(){
        if(IS_POST){
            
        }else{
            $cuisines = M('cuisine')->where($where)->select();
            $this->assign('cuisines',$cuisines);
            $this->display();
        }
    }
    
    public function addCuisine(){
        if(IS_POST){
            $data['cname'] = I('post.cname');
            $data['cstyle'] = I('post.cstyle');
            $data['add_time'] = time();
            if(M('cuisine')->add($data)){
                $this->success('添加菜系成功！');
            }else{
                $this->error('添加菜系失败！');
            }
        }else{
            $this->display();
        }
    }
    
    public function listCuisine(){
    	$this->display();
    }
}