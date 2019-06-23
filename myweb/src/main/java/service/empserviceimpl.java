package service;

import dao.Empdao;
import entity.emp;
import entity.page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("empservice")
@Transactional
public class empserviceimpl implements empservice {
    @Autowired
    private Empdao userdao;

    public Empdao getUserdao() {
        return userdao;
    }

    public void setUserdao(Empdao userdao) {
        this.userdao = userdao;
    }

    public page<emp> findall(Integer pagenum, Integer pagesize) {
        List<emp> alllist = userdao.finallemp();
        int totalrecord = alllist.size();
        page p = new page(pagenum, pagesize, totalrecord);
        Integer startindex = p.getStartindex();
        p.setList(userdao.finall(startindex, pagesize));
        System.out.println(p.getList());
        System.out.println(p);
        return p;
    }
}
