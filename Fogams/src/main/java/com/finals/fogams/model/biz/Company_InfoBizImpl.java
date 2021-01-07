package com.finals.fogams.model.biz;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.Company_InfoDao;
import com.finals.fogams.model.dao.Company_InfoDaoImpl;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.Company_PriceDto;

@Service
public class Company_InfoBizImpl implements Company_InfoBiz {

	@Autowired
	private Company_InfoDao dao = new Company_InfoDaoImpl();
	
	@Override
	public List<CompanyDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int insert(CompanyDto dto) {
		dto.setCompany_img(dto.getUploadfile().getOriginalFilename());
		return dao.insert(dto);
	}

	@Override
	public int updateMemberGrade(int member_no) {
		return dao.updateMemberGrade(member_no);
	}

	@Override
	public int delete(int company_no) {
		return dao.delete(company_no);
	}

	@Override
	public List<CompanyDto> allList() {
		// TODO Auto-generated method stub
		return dao.allList();
	}

	@Override
	public List<CompanyDto> roomsList() {
		// TODO Auto-generated method stub
		return dao.roomsList();
	}

	@Override
	public List<CompanyDto> foodList() {
		// TODO Auto-generated method stub
		return dao.foodList();
	}

	@Override
	public List<CompanyDto> tourList() {
		// TODO Auto-generated method stub
		return dao.tourList();
	}

	@Override
	public List<CompanyDto> markList(int member_no) {
		// TODO Auto-generated method stub
		return dao.markList(member_no);
	}
	public int insertCom_menu(List<Company_PriceDto> list) {
		return dao.insertCom_menu(list);
	}

	public List<CompanyDto> myList(int member_no) {
		return dao.myList(member_no);
	}

	
	
	


}
