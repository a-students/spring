package com.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author chen
 * @date 2019/5/19--8:30
 * 自动装配:
 *   Spring利用依赖注入(DI):完成对IOC容器中各个组件的依赖关系赋值,
 *      1).@Autowired:自动注入(Spring定义)
 *          1.默认优先按照类型去容器中找到对应的组件applicationContext.getBean(PeopleService.class);
 *          2.如果找到了多个相同类型的组件,再将属性的名称作为组件的id去容器中查找applicationContext.getBean("peopleDao");
 *          3.使用@Qualifier("")指定需要装配的组件的id,而不是默认使用属性名
 *          4.默认一定将属性赋值,如果没有找到就报错
 *          可以使用@Autowired(required = false)让必须装配变成不必须装配
 *          5.@Primary,让Spring进行默认装配时,默认使用首选的bean
 *              也可以使用@Qualifier指定需要装配的bean的名字
 *      2).spring还支持使用@Resource(JSR250)和@Inject(JSR330)[java规范注解]
 *          @Resource:
 *                 可以和@Autowired一样实现自动装配功能,默认是按照组件名称进行装配的
 *                  没有能支持@Primary功能及其他功能
 *          @Inject:
 *              需要导入java.inject的包,和@Autowired的功能一样
 *      3).@Autowired:构造器,参数,方法,属性,都是从容器中获取参数组件的值
 *          1.标注在方法位置上
 *          2.标注在构造器上,如果组件只有一个有参构造器,这个有参构造器的@Autowired可以省略,
 *              参数位置的组件还是可以自动从容器中获取
 *          3.放在 参数位置
 *      4).自定义组件想要使用Spring容器底层的一些组件(ApplicationContext,BeanFactory,xxx)
 *          自定义组件实现xxxAware,在创建兑现时,会调用接口规定的方法注入相关组件:Aware
 *
 */
/*
    xml注入:
        * 属性注入:
        *       属性注入即通过setXxx()方法注入Bean的属性值或依赖对象，
        *       由于属性注入方式具有可选择性和灵活性高的优点，因此属性注入是实际应用中最常采用的注入方式。
                    属性注入要求Bean提供一个默认的构造函数，并为需要注入的属性提供对应的Setter方法。
        *       Spring先调用Bean的默认构造函数实例化Bean对象，然后通过反射的方式调用Setter方法注入属性值
        *  构造方法注入:
        *       使用构造方法注入前提是Bean必须提供带参数的构造方法
        * 工厂方法注入:
        *       非静态工厂方法:
        *           有些工厂方法时非静态的,即必须实例化工厂类后才能调用工厂方法
    注解注入:
        1.使用@Autowired进行自动注入
*
* */
@Configuration
@ComponentScan({"com.dao","com.service","com.controller","com.bean"})
public class MainConfigAutowired {

}
