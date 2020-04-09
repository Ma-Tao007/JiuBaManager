package com.system.controller;

import com.system.exception.CustomException;
import com.system.mapper.GoodsMapper;
import com.system.mapper.SysuserMapper;
import com.system.mapper.UserloginMapper;
import com.system.po.Sysuser;
import com.system.po.Userlogin;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Jacey on 2017/6/30.
 */
@Controller
public class LoginController {
	@Autowired
    private UserloginMapper userloginMapper;
	@Autowired
	private SysuserMapper sysuserMapper;
    //鐧诲綍璺宠浆
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "../../login";
    }

    //鐧诲綍琛ㄥ崟澶勭悊
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(Userlogin userlogin) throws Exception {
	        //Shiro瀹炵幇鐧诲綍
	        UsernamePasswordToken token = new UsernamePasswordToken(userlogin.getUsername(),
	                userlogin.getPassword());
	        Subject subject = SecurityUtils.getSubject();
	
	        //濡傛灉鑾峰彇涓嶅埌鐢ㄦ埛鍚嶅氨鏄櫥褰曞け璐ワ紝浣嗙櫥褰曞け璐ョ殑璇濓紝浼氱洿鎺ユ姏鍑哄紓甯�
	        subject.login(token);
	
	        if (subject.hasRole("admin")) {
	            return "redirect:/admin/showCourse";
	        } else if (subject.hasRole("teacher")) {
	            return "redirect:/teacher/showCourse";
	        } else if (subject.hasRole("student")) {
	            return "redirect:/student/showCourse";
	        }
    
        return "/login";
    }
    
  //鐧诲綍琛ㄥ崟澶勭悊
    @RequestMapping(value = "/regist", method = {RequestMethod.POST})
    public String regist(Userlogin userlogin) throws Exception {
	       //注册  查看用户名是否已经存在
    	Userlogin user = userloginMapper.selectByUsername(userlogin.getUsername());
    	  if (user == null) {
    		
        	  userlogin.setRole(2);
        	  userloginMapper.insert(userlogin);
        	  Sysuser sysuser = new Sysuser();
        	  sysuser.setUsername(userlogin.getUsername());
        	  sysuser.setIsvip(0);
        	  sysuser.setMoney("0");
        	  sysuserMapper.insert(sysuser);
        	  throw new CustomException("注册成功");
    		 
          } else {
        	  throw new CustomException("用户名已存在");
          }
    }
    
  //鐧诲綍琛ㄥ崟澶勭悊
    @RequestMapping(value = "/openVip", method = {RequestMethod.GET})
    public String openVip() throws Exception {
	    //开通会员
    	//获取当前用户名
        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();
        int num = sysuserMapper.updateIsVipByUsername(username);
        if(num>0) {
        	throw new CustomException("开通成功");
        }else {
        	throw new CustomException("开通失败");
        }
    }
    
    //鐧诲綍琛ㄥ崟澶勭悊
    @RequestMapping(value = "/addMoney", method = {RequestMethod.GET})
    public String addMoneyUi() throws Exception {
	    return "student/addMoney";
    }
    
    //鐧诲綍琛ㄥ崟澶勭悊
    @RequestMapping(value = "/addMoney", method = {RequestMethod.POST})
    public String addMoney(String money) throws Exception {
    	Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();
        int num = sysuserMapper.updateMoneyByUsername(money,username);
        if(num>0) {
        	throw new CustomException("充值成功");
        }else {
        	throw new CustomException("充值失败");
        }
    }

}
