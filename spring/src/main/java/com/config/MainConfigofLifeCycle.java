package com.config;

import com.bean.Car;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

/**
 * @author chen
 * @date 2019/5/18--17:10
 * bean的生命周期:
 *  bean创建---初始化---销毁的过程
 *  容器帮助我们管理bean的生命周期
 *  我们可以自定义初始化和销毁方法,容器在bean进行到当前生命周期的时候
 *  来调用我们自定义的初始化和销毁的方法
 *
 *      构造(对象创建)
 *          单实例:在容器启动时创建对象
 *          多实例:在每次获取时创建对象
 *      初始化:
 *          对象创建完成,并赋值,然后调用初始化方法
 *      销毁:
 *          单实例bean在容器关闭时销毁
 *          多实例；容器不会管理这个bean,需要自己手动调用销毁方法
 *      1).指定初始化和销毁方法
 *            在xml文件中是<context:component-scan/>中指定init-method和destroy-method
 *            通过@Bean注解指定initMethod和destroyMethod来指定初始化方法和销毁方法
 *      2).通过让Bean实现InitializingBean(定义初始化逻辑)
 *                      DisposableBean(定义销毁逻辑)
 *      3).可以使用JSR250
 *          @PostConstruct:在bean创建完成并且属性赋值完成,来执行初始化方法
 *          @PreDestroy:在容器销毁bean之前,通知我们进行清理工作
 *      4).BeanPostProcessor:bean的后置处理器
 *          在bean初始化前后进行一些处理工作
 *              postProcessBeforeInitialization:在初始化之前工作
 *              postProcessAfterInitialization:在初始化之后工作
 */
@Configuration
@ComponentScan("com.bean")
public class MainConfigofLifeCycle{
    @Bean(initMethod = "init",destroyMethod = "destroy")
    @Scope("prototype")
    public Car car(){
        return new Car();
    }
}
