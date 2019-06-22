package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author chen
 * @date 2019/5/25--11:32
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private String SUCCESS="success";
    @RequestMapping("/testinterceptor")
    public String testinterceptor(){
        System.out.println("testinterceptor...");
        return SUCCESS;
    }
}
