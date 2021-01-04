package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.Company_InfoDao;
import com.finals.fogams.model.dao.Company_InfoDaoImpl;
import com.finals.fogams.model.dto.CompanyDto;

@Service
public class Company_InfoBizImpl implements Company_InfoBiz {

	@Autowired
	private Company_InfoDao dao = new Company_InfoDaoImpl();
	
	@Override
	public List<CompanyDto> selectList(int company_no) {
		return dao.selectList(company_no);
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
	public List<CompanyDto> myList(int member_no) {
		return dao.myList(member_no);
	}

<<<<<<< HEAD
	@Override
	public List<CompanyDto> selectaddr() {
		// TODO Auto-generated method stub
		return dao.selectaddr();
	}
	
	


=======
>>>>>>> ca641d7352034e65a3ca734234fbea6643c96e8d
}
