package com.controller;

import com.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author chen
 * @date 2019/5/16--10:33
 */
@Controller
public class PeopleController {
    @Autowired
    private PeopleService service;
}
