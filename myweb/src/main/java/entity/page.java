package entity;

import java.io.Serializable;
import java.util.List;

public class page<object> implements Serializable {
    /*当前页数*/
    private Integer pagenum;
    /*每页显示的记录数*/
    private Integer pagesize;
    /*总记录数*/
    private Integer totalrecord;
    /*总页数*/
    /*需计算得来*/
    private Integer totalpage;
    /*开始索引*/
    private Integer startindex;
    /*每页显示的数据*/
    private List<object> list;
    /*分页显示的页数*/
    private Integer start;
    private Integer end;

    public page() {
        super();
    }

    public page(Integer pagenum, Integer pagesize, Integer totalrecord) {
        this.pagenum = pagenum;
        this.pagesize = pagesize;
        this.totalrecord = totalrecord;
        if (totalrecord % pagesize == 0) {
            this.totalpage = totalrecord / pagesize;
        } else {
            this.totalpage = totalrecord / pagesize + 1;
        }
        /*开始索引*/
        this.startindex = (pagenum - 1) * pagesize;
        //this.start=1;
        //this.end=5;
/*        if (totalpage<=5){
            this.end=this.totalpage;
        }else {
            this.start=pagenum-2;
            this.end=pagenum+2;
            if (start<0){
                this.start=1;
                this.end=5;
            }
            if (end>this.totalpage){
                this.end=totalpage;
                this.start=end-5;
            }
        }*/
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }

    public Integer getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(Integer totalpage) {
        this.totalpage = totalpage;
    }

    public List<object> getList() {
        return list;
    }

    public void setList(List<object> list) {
        this.list = list;
    }

    public Integer getPagenum() {
        return pagenum;
    }

    public void setPagenum(Integer pagenum) {
        this.pagenum = pagenum;
    }

    public Integer getTotalrecord() {
        return totalrecord;
    }

    public void setTotalrecord(Integer totalrecord) {
        this.totalrecord = totalrecord;
    }

    public Integer getStartindex() {
        return startindex;
    }

    public void setStartindex(Integer startindex) {
        this.startindex = startindex;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "page{" +
                "pagenum=" + pagenum +
                ", pagesize=" + pagesize +
                ", totalrecord=" + totalrecord +
                ", totalpage=" + totalpage +
                ", startindex=" + startindex +
                ", list=" + list +
                ", start=" + start +
                ", end=" + end +
                '}';
    }
}
