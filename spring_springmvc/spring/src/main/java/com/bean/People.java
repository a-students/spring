package com.bean;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/16--11:19
 */
@Component
@PropertySource("classpath:people.properties")
public class People {
    //使用 @Value赋值
    /*
    * 1.基本数值
    * 2.spEL,#{}
    * 3.${},取出配置文件的值
    *   加载外部配置文件的值
    *       1).在xml文件中是使用
    *           <context:property-placeholder location="classpath:people.properties"/>
    *           先导入外部配置文件,之后使用${}取出配置文件中的值
    *       2).在使用注解的情况下:
    * */
    @Value("${name}")
    private String name;
    @Value("${age}")
    private Integer age;

    public People() {
        super();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "People{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public People(String name, Integer age) {
        this.name = name;
        this.age = age;
    }
}
