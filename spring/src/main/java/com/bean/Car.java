package com.bean;

import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/18--17:14
 */
/*
* @Bean注解提供initMethod和destroyMethod来指定bean的初始化和销毁方法
* */
@Component
public class Car {
    public Car() {
        System.out.println("car constructor");
    }
    public void init(){
        System.out.println("car init");
    }
    public void destroy(){
        System.out.println("car destroy");
    }
}
