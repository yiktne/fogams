package com.finals.fogams.model.dao;

import java.util.List;
import java.util.Map;

import com.finals.fogams.model.dto.PlanDto;

public interface PlanDao {
	String NAMESPACE = "com.plan.";

	public List<PlanDto> planList();
	
	public int planListInsert(PlanDto dto);
	
	public int planInsert(Map<String, Object> map);
	
	public int planNowNo();
}
