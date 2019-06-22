package Controller;

import exception.sysexception;
import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;
import org.omg.CORBA.SystemException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author chen
 * @date 2019/5/25--9:45
 */
@Controller
public class UserController {
    private String SUCCESS="success";

    @RequestMapping("/exception")
    public String exception() throws sysexception {
        System.out.println("exception执行了。。。");

        try {
            int i=10/0;
        } catch (Exception e) {
            //控制台打印异常信息
            e.printStackTrace();
            //向上抛出自定义异常信息
            throw new sysexception("自定义异常");
        }
        return SUCCESS;
    }

}
