package service;

import Until.CodeUntil;
import Until.MailUtil;
import Until.email;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import dao.Userdao;
import entity.User;
import org.aspectj.apache.bcel.classfile.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("service")
@Transactional
public class Userviceimpl implements Userservice {
    /**
     *
     */
    @Autowired
    private Userdao userdao;

    public Userdao getDao() {
        return userdao;
    }

    public void setUserdao(Userdao userdao) {
        this.userdao = userdao;
    }

    public boolean queryall(String username) {
        Integer i = userdao.queryall(username);
        System.out.println(i);
        //System.out.println(user);
        if (i == 1) {
            return true;
        } else {
            //System.out.println("user");
            return false;
        }
    }

    public boolean query(String username, String password) {
        Integer i = userdao.query(username, password);
        if (i == 1) {
            return true;
        } else {
            return false;
        }
    }

    //用户注册
    public boolean register(User user) {
        //将数据存入数据库中

        //调用发送方法,发送激活邮件
        /*MailUtil mail=new MailUtil(user.getEmail(),user.getCode());
        boolean blog=mail.run();*/
        //System.out.println(blog);
        return false;
        //new Thread(new MailUtil(user.getEmil(),user.getCode())).start();
    }

    //根据激活码和邮箱查询用户
    public User findBycode(String email, String code) {
        //根据邮箱和激活码查询用户,确认邮箱和激活码是一一对应的
        User user = userdao.findBycode(email, code);
        return user;
    }

    public void update(User user) {
        userdao.update(user);
    }

    public boolean send(String email) {
        String code = CodeUntil.getcode();
        MailUtil mail = new MailUtil(email, code);
        System.out.println("email=" + email + "code=" + code);
        boolean blog = mail.run();
        //将email和验证码插入数据库中
        userdao.storage(email, code);
        return blog;
    }

    public boolean registerusername(String username) {
        Integer i = userdao.registerqueryusername(username);
        System.out.println(i);
        if (i == 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean registeremail(String email) {
        Integer i = userdao.registerqueryemail(email);
        if (i == 0) {
            return true;
        } else {
            return false;
        }
    }

    public void setcode(String email, String code) {
        userdao.setcode(email, code);
    }

    public String findpw(String username) {
        String password = userdao.findpw(username);
        return password;
    }

    //修改头像
    public void saveimage(String image, Integer id) {
        userdao.saveimage(image, id);
    }

    //页面加载之初获取头像信息
    public String showimage(Integer id) {
        String image = userdao.showimage(id);
        return image;
    }

    //修改用户基本信息
    public boolean setinformation(Integer id, String name, String sex, String birthday, String address) {
        Integer result = userdao.setinformation(id, name, sex, birthday, address);
        if (result == 1) {
            return true;
        } else {
            return false;
        }
    }

    //显示用户基本信息
    public User showinformation(Integer id) {
        User user = userdao.showinformation(id);
        return user;
    }

    //用户登录成功后获取用户头像
    public String getiamge(String username) {
        String image = userdao.getimage(username);
        return image;
    }

    //获取用户唯一标识符id存入session
    public User getuser(String username, String password) {
        User user = userdao.getuser(username, password);
        return user;
    }

    public User queryuser(String username) {
        User user = userdao.queryuser(username);
        return user;
    }
}
