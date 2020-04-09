package com.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.mapper.CollegeMapper;
import com.system.mapper.CourseMapper;
import com.system.mapper.CourseMapperCustom;
import com.system.mapper.GoodsMapper;
import com.system.mapper.SelectedcourseMapper;
import com.system.po.College;
import com.system.po.Course;
import com.system.po.CourseCustom;
import com.system.po.CourseExample;
import com.system.po.Goods;
import com.system.po.PagingVO;
import com.system.po.Selectedcourse;
import com.system.po.SelectedcourseExample;
import com.system.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper courseMapper;


    public void upadteById(Integer id, Goods courseCustom){
    	try{
    		courseMapper.updateByPrimaryKey(courseCustom);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
        
    }

    public Boolean removeById(Integer id) throws Exception {

   
            courseMapper.deleteByPrimaryKey(id);


        return true;
    }

    public List<Goods> findByPaging(Integer toPageNo) throws Exception {
        PagingVO pagingVO = new PagingVO();
        pagingVO.setToPageNo(toPageNo);

        List<Goods> list = courseMapper.findByPaging(pagingVO);
        return list;
    }

    public Boolean save(Goods couseCustom) throws Exception {
        Goods course = courseMapper.selectByCourseId(couseCustom.getCourseid());
        if (course == null) {
            courseMapper.insert(couseCustom);
            return true;
        }
        return false;
    }


    public Goods findById(Integer id) throws Exception {
        Goods course = courseMapper.selectByPrimaryKey(id);
        

        return course;
    }

    public List<Goods> findByName(String name) throws Exception {
  


        List<Goods> list = courseMapper.selectByExample(name);

       
        return list;
    }

	@Override
	public int getCountCouse() throws Exception {
		
		return courseMapper.getCountCourse();
	}


}
