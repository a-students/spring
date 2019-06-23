package com.service;

import com.dao.PeopleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.inject.Inject;

/**
 * @author chen
 * @date 2019/5/16--10:33
 */
@Service
public class PeopleService {
    //@Qualifier("")
    //@Autowired(required = false)
    // @Resource
    @Inject
    private PeopleDao dao;

    @Override
    public String toString() {
        return "PeopleService{" +
                "dao=" + dao +
                '}';
    }
}
