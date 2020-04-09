package com.system.service;

import java.util.List;

import com.system.po.CourseCustom;
import com.system.po.Goods;

public interface GoodsService {
	 //根据id更新课程信息
    void upadteById(Integer string, Goods courseCustom) throws Exception;

    //根据id删除课程信息
    Boolean removeById(Integer id) throws Exception;

    //获取分页查询课程信息
    List<Goods> findByPaging(Integer toPageNo) throws Exception;

    //插入课程信息
    Boolean save(Goods couseCustom) throws Exception;

    //获取课程总数
    int getCountCouse() throws Exception;

    //根据id查询
    Goods findById(Integer id) throws Exception;

    //根据名字查询
    List<Goods> findByName(String name) throws Exception;


}
