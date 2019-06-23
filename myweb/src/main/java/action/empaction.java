package action;

import entity.emp;
import entity.page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.empservice;
import sun.java2d.pipe.SpanIterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class empaction {
    @Autowired
    private empservice service;

    public empservice getService() {
        return service;
    }

    public void setService(empservice service) {
        this.service = service;
    }

    @ResponseBody
    @RequestMapping("/test")
    public page<emp> query(String startindex, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(startindex);
        Integer pagesize = 3;
        Integer pagenum = Integer.parseInt(startindex);
        page page = service.findall(pagenum, pagesize);
        List<emp> list = page.getList();
        return page;
    }
}