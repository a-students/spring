package com.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/19--16:41
 */
/*@Aspect告诉spring当前类是一个切面类,而不是其他的普通的类
* */
@Aspect
//@Component
public class LogAspects {
    //1.本类引用
    //2.其他的切面引用
    //将公共的切入点表达式抽取出来
    @Pointcut("execution(public int com.aop.MathCalculator.*(..))")
    public void pointCut(){};
    //@Before在目标方法之前切入,切入点表达式(指定在哪个方法切入)
    @Before(value = "pointCut()")
    public void logStart(JoinPoint joinPoint){
        System.out.println("除法运行之前");
    }
    @After(value = "pointCut()")
    public void logEnd(){
        System.out.println("除法运行结束");
    }
    @AfterReturning("pointCut()")
    public void logReturn(){
        System.out.println("除法正常返回");
    }
    @AfterThrowing("pointCut()")
    public void logException(){
        System.out.println("除法异常返回");
    }
}
