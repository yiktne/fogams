package com.finals.fogams.model.dao;

import java.util.List;
import java.util.Map;

import com.finals.fogams.model.dto.PlanDto;
import com.finals.fogams.model.dto.PlanListDto;
import com.finals.fogams.model.dto.TestBean;

public interface PlanDao {
	String NAMESPACE = "com.plan.";

	public List<PlanDto> planList();
	
	public int planListInsert(PlanDto dto);
	
	public int planInsert(Map<String, Object> map);
	
	public int planNowNo();
	
	public List<PlanListDto> selectplan(int member_no);
	
	public TestBean testBean(int plan_no);
	
}
