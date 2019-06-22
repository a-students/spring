package com.chen.Controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author chen
 * @date 2019/5/20--17:26
 */
@Controller
public class HelloWorld {
    /*
    * 1.使用@RequestMapping注解来映射请求的URL
    * 2.返回值会通过视图解析器解析为实际的物理视图,对于InternalResourceViewResolver视图解析器,会做如下的解析
    *       prefix+返回值+suffix得到实际的物理视图,然后做转发操作
    * */
    @RequestMapping("/hello")
    public String hello(){
        System.out.println("hello");
        return "success";
    }
}
