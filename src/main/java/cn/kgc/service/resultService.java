package cn.kgc.service;

import cn.kgc.domain.PageUtil;
import cn.kgc.domain.result;
import cn.kgc.domain.totalist;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface resultService {
     int addResult(result res);

     PageInfo<result>  findAllresult(PageUtil pageUtil);

     int insertTotalist(totalist total);

     PageInfo<totalist> FindAlltatal(@Param("userid")Integer userid,PageUtil pageUtil);

}
