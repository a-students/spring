package controller;

import bean.user;
import com.sun.deploy.util.SessionState;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

/**
 * @author chen
 * @date 2019/5/22--20:25
 */
/*
* @ModelAttribute
* 作用:该注解出现在方法上,表示当前方法会在控制器的方法执行之前,先执行
*       出现在参数上,获取指定的数据给参数赋值
*   可以修饰没有返回值的方法,也可以修饰有具体返回值的方法
* */
@Controller
public class hello {
    private static String SUCCESS="success";
    @RequestMapping("/filter")
    public String hello(user user){
        System.out.println(user);
        return SUCCESS;
    }
    @RequestMapping("/hello")
    public String hello(){
        System.out.println("Hello World");
        return SUCCESS;
    }
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String upload(MultipartFile upload) throws Exception {
        System.out.println("跨服务器文件上传。。。");
        //定义上传文件服务器路径
        String path="http://localhost:8888/upload/";
        //http://localhost:8888/upload/
        //说明上传文件项
        //获取上传文件路径
        String filename=upload.getOriginalFilename();
        //把文件的名称设置唯一值  uuid
        String uuid= UUID.randomUUID().toString().replace("-","");
        filename=uuid+"_"+filename;
        //创建客户端对象
        Client client = Client.create();
        //和图片服务器进行连接
        WebResource webResource = client.resource(path+filename);
        //上传文件 跨服务器上传
        webResource.put(upload.getBytes());
        return SUCCESS;
    }
}
