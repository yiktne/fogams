package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.Company_PriceDto;

@Repository
public class Company_InfoDaoImpl implements Company_InfoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<CompanyDto> selectList(int company_no) {

		List<CompanyDto> list = new ArrayList<CompanyDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[ERROR] CompanyDto selectList");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(CompanyDto dto) {
		//업체 정보 등록 ( + 이미지 정보)
		System.out.println(sqlSession);
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] CompanyDto Insert");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int updateMemberGrade(int member_no) {
		
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "updateMemberGrade", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] updateMemberGrade");
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	public int delete(int company_no) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", company_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Company_Info delete");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<CompanyDto> allList() {
		List<CompanyDto> list=new ArrayList<CompanyDto>();
		try {
			list=sqlSession.selectList(NAMESPACE+"allList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error [company_allList]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CompanyDto> roomsList() {
		List<CompanyDto> list=new ArrayList<CompanyDto>();
		try {
			list=sqlSession.selectList(NAMESPACE+"roomsList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error [company_roomsList]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CompanyDto> foodList() {
		List<CompanyDto> list=new ArrayList<CompanyDto>();
		try {
			list=sqlSession.selectList(NAMESPACE+"foodList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error [company_foodList]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CompanyDto> tourList() {
		List<CompanyDto> list=new ArrayList<CompanyDto>();
		try {
			list=sqlSession.selectList(NAMESPACE+"tourList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error [company_tourList]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CompanyDto> markList(int member_no) {
		List<CompanyDto> list=new ArrayList<CompanyDto>();
		try {
			list=sqlSession.selectList(NAMESPACE+"markList", member_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error [company_markList]");
			e.printStackTrace();
		}
		return list;
	}
	public int insertCom_menu(List<Company_PriceDto> list) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertCom_menu", list);
		} catch (Exception e) {
			System.out.println("[ERROR] insertCom_menu");
			e.printStackTrace();
		}
		
		return res;
	}
	public List<CompanyDto> myList(int member_no) {
		
		List<CompanyDto> list = new ArrayList<CompanyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "mylist", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Company_InfoDao  myList");
			e.printStackTrace();
		}
		
		return list;
	}

	



}
