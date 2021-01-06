package com.finals.fogams.model.biz;

import java.util.List;
import java.util.Map;

import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.PlanDto;

public interface PlanBiz {
	public List<PlanDto> planList();
	
	public int planListInsert(PlanDto dto);
	
	public int planInsert(Map<String, Object> map);
	
	public int planNowNo();
}
