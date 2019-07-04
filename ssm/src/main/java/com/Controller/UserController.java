package com.Controller;

import com.bean.User;
import com.service.UserServiceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author chen
 * @date 2019/7/1--9:54
 */
@Controller
public class UserController {
    @Autowired
    private UserServiceimpl service;

    @RequestMapping("/get")
    public String getuserbyid(Integer id){
        User user = service.getuserbyid(1);
        System.out.println(user);
        return "success";
    }
}
