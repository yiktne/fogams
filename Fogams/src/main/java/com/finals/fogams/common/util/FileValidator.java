package com.finals.fogams.common.util;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.finals.fogams.model.dto.Company_InfoDto;

@Service
public class FileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {

		Company_InfoDto file = (Company_InfoDto) target;
		
		if(file.getUploadfile().getSize() == 0) {
			errors.rejectValue("uploadfile", "fileNPE", "Please select a file");
		}
		
	}

}
