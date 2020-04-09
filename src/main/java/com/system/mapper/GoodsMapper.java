package com.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.system.po.Course;
import com.system.po.CourseExample;
import com.system.po.Goods;
import com.system.po.PagingVO;

public interface GoodsMapper {
	int getCountCourse();

    int deleteByExample(Goods example);

    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    List<Goods> selectByExample(String name);

    Goods selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Course record, @Param("example") Goods example);

    int updateByExample(@Param("record") Course record, @Param("example") Goods example);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

	List<Goods> findByPaging(PagingVO pagingVO);
	
	Goods selectByCourseId(String courseid);
}
