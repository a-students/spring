package com.config;

import com.aop.LogAspects;
import com.aop.MathCalculator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * @author chen
 * @date 2019/5/19--16:31
 */
/*
* AOP:[动态代理]
*   指在程序运行期间动态的将某段代码切入到指定方法指定位置进行运行的编程方式
*  1.导入AOP模块：Spring AOP(spring-aspects)
*  2.定义一个业务逻辑类MathCalculator,在业务逻辑类运行的时候将日志进行打印(方法之前,方法之后,方法出现异常)
*  3.定义一个日志切面类(LogAspects),切面类里面的方法需要动态感知MathCalculator运行到哪里,然后执行
*       通知方法:
*               前置通知(@Before):logStart,在目标方法运行之前运行
*               后置通知(@After):logEnd,在目标方法运行结束之后通知，无论方法是正常结束还是异常结束
*               返回通知():logReturn,在目标方法正常返回之后运行
*               异常通知():logException,在目标方法出现异常后运行
*               环绕通知():动态代理,手动推进目标方法运行
*
*   4.给切面类的目标方法标注何时何地运行(通知注释)
*   5、将切面类和业务逻辑类(目标方法所在类)都加入到容器中
*   6.必需告诉spring那个类是切面类(给切面类加一个注解@Aspect)
*   7.      在xml文件中是使用<aop:aspectj-autoproxy/>开启基于注解版的切面功能
*           给配置类中加入@EnableAspectJAutoProxy[开启基于注解的aop模式]
*   步骤看着比较多,其实可以大致分为三步
*       1).将业务逻辑组件和切面类都加入到容器中,告诉spring哪个是切面类
*       2).在切面类上的每一个通知方法上标注通知注解,告诉spring何时何地运行(切入点表达式)
*       3).开启基于注解的aop模式,@EnableAspectJAutoProxy
* */
/*
*   AOP原理:@EnableAspectJAutoProxy
*       1.@EnableAspectJAutoProxy是什么?
*
*
* */
@Configuration
@EnableAspectJAutoProxy
public class MainConfigOfAOP {
    //将业务逻辑类加入到逻辑类
    @Bean
    public MathCalculator mathCalculator(){
        return new MathCalculator();
    }
    //将切面类加入到容器中
    @Bean
    public LogAspects logAspects(){
        return new LogAspects();
    }
}
