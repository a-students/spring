package Controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author chen
 * @date 2019/7/8--13:20
 */
@Controller
@RequestMapping("/shiro")
public class ShiroController {


    @RequestMapping("/login")
    public String hello(@RequestParam("username") String username,@RequestParam("password") String password){
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()){
            //将用户名和密码封装为一个UsernamePasswordToken对象
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            //RememberMe  记住我
            token.setRememberMe(true);
            try {
                //执行登录
                subject.login(token);
                return "success";
            }catch (AuthenticationException e){

            }
        }
        return "fail";
    }
}
