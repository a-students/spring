package com.aop;

import org.springframework.stereotype.Component;

/**
 * @author chen
 * @date 2019/5/19--16:36
 */
//@Component
public class MathCalculator {
    public int division(int i,int j){
        System.out.println("MathCalculator调用了division方法");
        return i/j;
    }
}
