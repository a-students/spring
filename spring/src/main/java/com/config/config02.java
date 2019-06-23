package com.config;

import com.bean.People;
import com.bean.colorfactorybean;
import com.bean.red;
import com.conditional.MyImportBeanDefinitionRegistrar;
import com.conditional.Myimportselector;
import com.sun.prism.paint.Color;
import org.springframework.context.annotation.*;
import sun.misc.Contended;

import java.awt.*;

/**
 * @author chen
 * @date 2019/5/16--13:39
 */
@ComponentScan()
@Configuration
@Import({MyImportBeanDefinitionRegistrar.class,Myimportselector.class})
public class config02 {
    /*
    @Scope
        prototype:多实例的:ioc容器启动并不会去调用方法创建对象放在容器中,
                            每次获取的时候才会调用方法创建对象
        singleton:单实例的(默认值),ioc容器启动时就会调用方法创建对象放到ioc容器中
                                    以后每次获取就是直接从容器中拿
        request:同一次请求创建一个实例(web环境)
        session:同一个session创建一个实例(web环境)
    * */
    /*懒加载(针对单实例bean):
    *       单实例bean:默认在容器启动时创建对象
    *       懒加载:容器启动时不创建对象,第一次使用时(获取)Bean创建对象,并初始化
    * */
    //@Scope("prototype")
    //默认是单实例的
    //@Lazy   //懒加载
    @Bean
    public People people(){
        return new People("张三",15);
    }
    /*
    * @Conditional({Conditional})  按照一定的条件进行判断,满足该条件给容器中注解bean
    *
    * */
    @Bean("bill")
    public People people1(){
        return new People("李四",16);
    }
    @Bean({"people2"})
    public People people2(){
        return new People("王五",20);
    }
    /*给容器中注册组件:
    * 1.包扫描+组件标注注解(@Controller/@Service/@Repository/@Component) 局限于自己写的
    * 2.使用@Bean(导入的第三方包里面的组件)
    * 3.@Import[快速给容器中导入一个组件]
    *       1.@Import(要导入到容器中的组件),容器中就会自动注册这个组件
    *       2.ImportSelector:返回需要导入的组件的全类名数组
    *           ImportSelector是一个接口,使用ImportSelector实现类实现这个接口,并用@Import注册在ioc容器中,
    *           这个实现类会将返回的Class类名都定义为bean,返回值为string数组
    *       3.@ImportBeanDefinitionRegistrar:
    * 4.使用spring提供的FactoryBean(工厂Bean)
    *       1).默认获取到的是工厂bean调用getBean创建的对象
    *       2）要获取工厂Bean本身,需要在获取时在id前加上&标识
    * */
    @Bean
    public colorfactorybean colorfactorybean(){
        return new colorfactorybean();
    }
}
