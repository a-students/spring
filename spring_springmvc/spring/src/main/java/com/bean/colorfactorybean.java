package com.bean;

import org.springframework.beans.factory.FactoryBean;

/**
 * @author chen
 * @date 2019/5/17--10:26
 */
/*创建一个Spring定义的FactoryBean*/
public class colorfactorybean implements FactoryBean<color> {
    //返回一个color对象,这个对象添加到容器中
    @Override
    public color getObject() throws Exception {
        System.out.println("getbean");
        return new color();
    }

    @Override
    public Class<?> getObjectType() {
        return color.class;
    }
    //是否单例？
    /*true:这个bean是单实例,在容器中保存一份
    false:多实例,每次获取都会创建一个新的bean
    * */
    public boolean isSingleton(){
        return true;
    }
}
