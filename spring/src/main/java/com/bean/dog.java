package com.bean;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

/**
 * @author chen
 * @date 2019/5/18--22:22
 */
@Component
/*
* 使用JSR250的@PostConstruct注解标注在方法上,当bean创建完成并且赋值完成来初始化,
* @PreDestroy当bean从容器中移除之前,通知进行销毁
* */
public class dog {
    public dog() {
        System.out.println("dog constructor");
    }
    //对象创建并赋值之后被调用
    @PostConstruct
    public void init(){
        System.out.println("dog @PostConstruct");
    }
    //在容器移除对象之前
    @PreDestroy
    public void destroy(){
        System.out.println("dog destroy");
    }
}
