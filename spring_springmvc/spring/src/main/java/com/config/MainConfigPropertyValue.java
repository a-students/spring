package com.config;

import com.bean.People;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import javax.annotation.Resource;


/**
 * @author chen
 * @date 2019/5/18--23:05
 */
//使用@PropertySource读取外部配置文件中的K/v保存到运行的环境变量
@PropertySource(value = {"classpath:people.properties"},ignoreResourceNotFound = false)
/*
* @PropertySource:用于引入外部属性配置,和Environment配合使用,其中ignoreResourceNotFound表示没有找到文件是否会报错,
* 默认为false，就是会报错,设置为true相当于生吞异常,增加排查问题的复杂性
* 引入PropertySource,注入Environment,然后就能用environment获取配置文件中的value值
* */
@Configuration
public class MainConfigPropertyValue {
    //@Resource
    @Autowired
    Environment environment;
    @Bean
    public People people(){
        String name = environment.getProperty("name");
        System.out.println("name:"+name);
        String age = environment.getProperty("age");
        return new People(environment.getProperty("name"),Integer.parseInt(environment.getProperty("age")));
    }
}
