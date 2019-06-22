package com.chen.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author chen
 * @date 2019/5/28--16:20
 */
@Controller
public class UserController {
    @RequestMapping("/hello")
    public String hello(){
        System.out.println("Hello World");
        return "success";
    }
}
