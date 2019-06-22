package com.bean;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/18--22:32
 */
/*后置处理器:初始化前后进行处理工作
*将后置处理器加入到容器中
*
* */
/*
* 通过BeanPostProcessor后置处理器,在bean初始化前后进行处理工作,
* postProcessBeforeInitialization()在初始化之前调用,
* postProcessAfterInitialization()在初始化之后调用
* */
@Component
public class MybeanPostProcessor implements BeanPostProcessor {

    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("postProcessBeforeInitialization...."+beanName);
        return bean;
    }


    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("postProcessAfterInitialization..."+beanName);
        return bean;
    }
}
