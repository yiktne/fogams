package com.finals.fogams.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.PlanDao;
import com.finals.fogams.model.dao.PlanDaoImpl;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.PlanDto;
import com.finals.fogams.model.dto.PlanListDto;
import com.finals.fogams.model.dto.TestBean;

@Service
public class PlanBizImpl implements PlanBiz{

	@Autowired
	private PlanDao dao=new PlanDaoImpl();
	
	@Override
	public List<PlanDto> planList() {
		// TODO Auto-generated method stub
		return dao.planList();
	}

	@Override
	public int planListInsert(PlanDto dto) {
		// TODO Auto-generated method stub
		return dao.planListInsert(dto);
	}

	@Override
	public int planInsert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.planInsert(map);
	}

	@Override
	public int planNowNo() {
		// TODO Auto-generated method stub
		return dao.planNowNo();
	}

	@Override
	public List<PlanListDto> selectplan(int member_no) {
		// TODO Auto-generated method stub
		return dao.selectplan(member_no);
	}

	@Override
	public TestBean testBean(int plan_no) {
		// TODO Auto-generated method stub
		return dao.testBean(plan_no);
	}
	
}
