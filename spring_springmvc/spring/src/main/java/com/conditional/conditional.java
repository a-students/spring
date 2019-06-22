package com.conditional;

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * @author chen
 * @date 2019/5/16--20:32
 */
public class conditional implements Condition {
    /*
    * ConditionContext:判断条件能使用的上下文(环境)
    * AnnotatedTypeMetadata 注释信息
    * */
    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        return false;
    }
}
