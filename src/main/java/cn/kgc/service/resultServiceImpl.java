package cn.kgc.service;

import cn.kgc.domain.PageUtil;
import cn.kgc.domain.result;
import cn.kgc.domain.totalist;
import cn.kgc.mapper.resultMapper;
import cn.kgc.mapper.totalistMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class resultServiceImpl implements resultService {
    @Autowired
    private resultMapper result;
     @Autowired
     private totalistMapper totalMapper;
    @Override
    public int addResult(result res) {
        return result.insert(res);
    }
    @Override
    public PageInfo<result> findAllresult(PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPageNumber(),pageUtil.getPageSize());
        List<result> list=result.selectAll();
        return new PageInfo<result>(list);
    }

    @Override
    public int insertTotalist(totalist total) {
        return   totalMapper.insertTo(total);
    }

    @Override
    public PageInfo<totalist> FindAlltatal(Integer userid, PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPageNumber(),pageUtil.getPageSize());
        List<totalist> list=totalMapper.selectallbyId(userid);
        return new PageInfo<totalist>(list);
    }
}
