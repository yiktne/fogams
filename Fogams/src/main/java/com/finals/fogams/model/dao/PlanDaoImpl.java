package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.PlanDto;


@Repository
public class PlanDaoImpl implements PlanDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PlanDto> planList() {
		List<PlanDto> list = new ArrayList<PlanDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "planList");
		} catch (Exception e) {
			System.out.println("[ERROR] CompanyDto planList");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int planListInsert(PlanDto dto) {
		int i=0;
		try {
			i=sqlSession.insert(NAMESPACE+"planListInsert", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("계획 리스트 추가 에러 회원 번호:"+dto);
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int planInsert(Map<String, Object> map) {
		int i=0;
		try {
			i=sqlSession.insert(NAMESPACE+"planInsert", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("계획 저장 오류");
		}
		return i;
	}

	@Override
	public int planNowNo() {
		int no=0;
		try {
			no = Integer.parseInt(sqlSession.selectOne(NAMESPACE+"nowPlanNo"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("계획 시퀀스 번호 조회 오류");
		}
		return no;
	}

}
