<?php
namespace Admin\Controller;
use Admin\Controller\BackendController;
class FoodsController extends BackendController {
    public function index(){
        $list = M('Foods')->query('Call p_get_foods_details(0)');
        $this->assign('list',$list);
        $this->display();
    }
    
    public function addFoods(){
        if(IS_POST){
            $data['title'] = I('post.title');
            $data['foods_name'] = I('post.foods_name');
            $data['cuisines_id'] = I('post.cuisines_id');
            $data['status'] = I('post.status');
            $data['content'] = I('post.content');
            $data['store_condition'] = I('post.store_condition');
            $data['store_time'] = I('post.store_time');
            $data['add_time'] = time();
            
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     3145728 ;// 设置附件上传大小
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            $upload->rootPath  =      './Upload/images/foods/cover/'; // 设置附件上传根目录
            $upload->subName   =     array('date', 'Ymd');
            
            // 上传主图
            $info   =   $upload->uploadOne($_FILES['cover']);
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
            }else{// 上传成功 获取上传文件信息
                 $data['cover'] = $info['savepath'].$info['savename'];
            }
            
            $foods_id = M('foods')->add($data);
            
            if(!$foods_id){
                $this->error("添加菜品失败！");
            }else{
                $data_ext['foods_id'] = $foods_id;
                $data_ext['tools'] = json_encode(I('post.tools'));
                $data_ext['ingredient'] = json_encode(I('post.ingredient'));
                $data_ext['accessory'] = json_encode(I('post.accessory'));
                $data_ext['pretreatment'] = I('post.pretreatment');
                $steps_time = I('post.steps_time');
                $steps = I('post.steps');
                
                //上传步骤图
                $upload->rootPath  =      './Upload/images/foods/steps/'; // 设置附件上传根目录
                if(!empty($_FILES['steps_cover']['name'])){
                    foreach ($_FILES['steps_cover']['name'] as $key=>$val){
                        $step_files[$key]['name'] = $val;
                        $step_files[$key]['type'] = $_FILES['steps_cover']['type'][$key];
                        $step_files[$key]['tmp_name'] = $_FILES['steps_cover']['tmp_name'][$key];
                        $step_files[$key]['error'] = $_FILES['steps_cover']['error'][$key];
                        $step_files[$key]['size'] = $_FILES['steps_cover']['size'][$key];
                    }
                }
                
                $steps_cover   =   $upload->upload($step_files);
                
                if(!$steps_cover) {// 上传错误提示错误信息
                    $this->error($upload->getError());
                }else{// 上传成功 获取上传文件信息
                    foreach($steps_time as $key=>$val){
                        $steps_arr[$key]['time'] = $val;
                        $steps_arr[$key]['step'] = $steps[$key];
                        $steps_arr[$key]['step_cover'] = $steps_cover[$key]['savepath'].$steps_cover[$key]['savename'];
                    }
                }
                
                $data_ext['steps'] = json_encode($steps_arr);
                $foods_id = M('foods_ext')->add($data_ext);
                
                $this->success('添加菜品成功！');
            }
        }else{
            $cuisines = M('cuisine')->select();
            $this->assign('cuisines',$cuisines);
            $this->display();
        }
    }
    
    public function editFoods(){
        $id = I('get.id',0,'intval');
        if(IS_POST){
            $data['title'] = I('post.title');
            $data['foods_name'] = I('post.foods_name');
            $data['cuisines_id'] = I('post.cuisines_id');
            $data['status'] = I('post.status');
            $data['content'] = I('post.content');
            $data['store_condition'] = I('post.store_condition');
            $data['store_time'] = I('post.store_time');
            $data['add_time'] = time();
    
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     3145728 ;// 设置附件上传大小
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            $upload->rootPath  =      './Upload/images/foods/cover/'; // 设置附件上传根目录
            $upload->subName   =     array('date', 'Ymd');
    
            // 上传主图
            $info   =   $upload->uploadOne($_FILES['cover']);
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
            }else{// 上传成功 获取上传文件信息
                $data['cover'] = $info['savepath'].$info['savename'];
            }
    
            $foods_id = M('foods')->add($data);
    
            if(!$foods_id){
                $this->error("编辑菜品失败！");
            }else{
                $data_ext['foods_id'] = $foods_id;
                $data_ext['tools'] = json_encode(I('post.tools'));
                $data_ext['ingredient'] = json_encode(I('post.ingredient'));
                $data_ext['accessory'] = json_encode(I('post.accessory'));
                $data_ext['pretreatment'] = I('post.pretreatment');
                $steps_time = I('post.steps_time');
                $steps = I('post.steps');
    
                //上传步骤图
                $upload->rootPath  =      './Upload/images/foods/steps/'; // 设置附件上传根目录
                if(!empty($_FILES['steps_cover']['name'])){
                    foreach ($_FILES['steps_cover']['name'] as $key=>$val){
                        $step_files[$key]['name'] = $val;
                        $step_files[$key]['type'] = $_FILES['steps_cover']['type'][$key];
                        $step_files[$key]['tmp_name'] = $_FILES['steps_cover']['tmp_name'][$key];
                        $step_files[$key]['error'] = $_FILES['steps_cover']['error'][$key];
                        $step_files[$key]['size'] = $_FILES['steps_cover']['size'][$key];
                    }
                }
    
                $steps_cover   =   $upload->upload($step_files);
    
                if(!$steps_cover) {// 上传错误提示错误信息
                    $this->error($upload->getError());
                }else{// 上传成功 获取上传文件信息
                    foreach($steps_time as $key=>$val){
                        $steps_arr[$key]['time'] = $val;
                        $steps_arr[$key]['step'] = $steps[$key];
                        $steps_arr[$key]['step_cover'] = $steps_cover[$key]['savepath'].$steps_cover[$key]['savename'];
                    }
                }
    
                $data_ext['steps'] = json_encode($steps_arr);
                $foods_id = M('foods_ext')->add($data_ext);
    
                $this->success('编辑菜品成功！');
            }
        }else{
            $foods_info = M('Foods')->query('Call p_get_foods_details('.$id.')');
            $foods_info[0]['content'] = htmlspecialchars_decode($foods_info[0]['content']);
            $foods_info[0]['tools'] = json_decode($foods_info[0]['tools']);
            $foods_info[0]['ingredient'] = json_decode($foods_info[0]['ingredient']);
            $foods_info[0]['accessory'] = json_decode($foods_info[0]['accessory']);
            $foods_info[0]['steps'] = json_decode($foods_info[0]['steps']);
            $this->assign('info',$foods_info[0]);
            
            $cuisines = M('cuisine')->select();
            $this->assign('cuisines',$cuisines);
            $this->display();
        }
    }

    //菜系列表
    public function listCuisine(){
        $cuisine_list = M('Cuisine')->select();
        $this->assign('cuisine_list',$cuisine_list);
        $this->display();
    }
    
    //添加菜系
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

}