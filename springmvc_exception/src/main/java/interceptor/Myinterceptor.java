package interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author chen
 * @date 2019/5/25--11:39
 */
public class Myinterceptor implements HandlerInterceptor {
    @Override
    /*
    * 预处理 Controller方法执行之前
    *   return true 放行 执行下一个拦截器,如果没有,执行Controller方法
    *   return false 不放行
    * */
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("preHandle执行了");
        return true;
    }
    /*
    *
    * */
    /*
    * 后处理方法
    * 在Controller方法执行之后,success.jsp执行之前
    * */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }
    /*
    *在success.jsp页面执行之后,该方法会执行
    * */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
