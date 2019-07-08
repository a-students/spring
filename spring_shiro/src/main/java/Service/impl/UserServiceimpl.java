package Service.impl;

import Bean.User;
import Dao.UserDao;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chen
 * @date 2019/7/4--10:57
 */
@Service
public class UserServiceimpl implements UserService {
    @Autowired
    private UserDao dao;

    @Override
    public List<User> getusers() {
        List<User> list = dao.getusers();
        return list;
    }
}
