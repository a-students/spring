package exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author chen
 * @date 2019/5/25--10:31
 */
public class HandlerException implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                         Object o, Exception e) {
        sysexception sysexception=null;
        System.out.println(e instanceof sysexception);
        if (e instanceof sysexception){
            sysexception= (sysexception) e;
        }else {
            sysexception=new sysexception("未知错误");
        }
        String message=sysexception.getMessage();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message",message);
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
