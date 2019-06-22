package com.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/19--14:50
 */
//默认加载在ioc容器中的组件,容器启动就会调用无参构造器创建对象,在进行初始化赋值等操作
//@Component
public class boss {

    private Car car;
    @Autowired
    public boss(Car car) {
        this.car = car;
        System.out.println("boss 有参构造器");
    }

    public Car getCar() {
        return car;
    }
    //@Autowired//标注在方法上,Spring容器创建当前对象时,就会调用方法,完成赋值
    //方法使用的参数,自定义类型的值默认从ioc容器中获取值
    public void setCar(Car car) {
        this.car = car;
    }
}
