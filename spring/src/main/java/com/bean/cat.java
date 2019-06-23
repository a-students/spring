package com.bean;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/18--22:06
 */
//@Component
    /*
    * 通过让bean实现InitializingBean接口定义初始化,实现DisposableBean定义销毁
    * */
public class cat implements DisposableBean, InitializingBean {
    public cat() {
        System.out.println("cat construct");
    }
    //销毁方法
    @Override
    public void destroy() throws Exception {
        System.out.println("cat 销毁");
    }
    //初始化方法
    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("cat 初始化");
    }
}
