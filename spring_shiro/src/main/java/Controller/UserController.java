package Controller;

import Bean.User;
import Service.impl.UserServiceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author chen
 * @date 2019/7/4--10:53
 */
@Controller
public class UserController {
    @Autowired
    private UserServiceimpl service;

    @RequestMapping("/getusers")
    public String getusers(){
        List<User> list = service.getusers();
        for (User user:list) {
            System.out.println(user);
        }
        return "success";
    }
}
