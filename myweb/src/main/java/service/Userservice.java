package service;

import Until.email;
import entity.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

public interface Userservice {
    public boolean queryall(String username);

    public boolean query(String username, String password);

    //注册用户的操作,将用户信息存入数据库中
    public boolean register(User user);

    //查找激活码,返回用户名
    public User findBycode(String email, String code);

    //查找到激活码,更新数据库中数据
    public void update(User user);

    //获取激活码
    public boolean send(String email);

    //注册时校验用户名是否重复
    public boolean registerusername(String username);

    //注册时校验邮箱是否重复
    public boolean registeremail(String email);

    //找回密码
    public void setcode(String email, String code);

    public String findpw(String username);

    //修改头像
    public void saveimage(String image, Integer id);

    //页面加载之初获取头像信息
    public String showimage(Integer id);

    //修改用户基本信息
    public boolean setinformation(Integer id, String name, String sex, String birthday, String address);

    //显示用户基本信息
    public User showinformation(Integer id);

    //用户登录成功后获取用户头像
    public String getiamge(String username);

    //获取用户信息存入session
    public User getuser(String username, String password);

    public User queryuser(String username);
}
