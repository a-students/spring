package com.service;

import com.bean.User;
import com.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author chen
 * @date 2019/7/1--10:50
 */
@Service
public class UserServiceimpl implements UserService{
    @Autowired
    private UserDAO dao;

    @Override
    public User getuserbyid(Integer id) {
       return dao.getuserbyid(id);
    }
}
