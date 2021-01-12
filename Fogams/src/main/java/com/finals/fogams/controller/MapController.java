package com.finals.fogams.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finals.fogams.model.biz.Company_InfoBizImpl;
import com.finals.fogams.model.biz.PlanBiz;
import com.finals.fogams.model.biz.PlanBizImpl;
import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.MemberDto;
import com.finals.fogams.model.dto.PlanDto;
import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

@Controller
public class MapController {
	
	@Autowired
	private Company_InfoBizImpl company_infobiz;
	
	@Autowired
	private PlanBizImpl planbiz;
	
	@RequestMapping("map.do")
	public String map(Model model, HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		int member_no=0;
		try {
			MemberDto member_dto=(MemberDto)session.getAttribute("memberDto");
			member_no=member_dto.getMember_no();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("all_list", company_infobiz.allList());
		model.addAttribute("rooms_list", company_infobiz.roomsList());
		model.addAttribute("food_list", company_infobiz.foodList());
		model.addAttribute("tour_list", company_infobiz.tourList());
		List<CompanyDto> tour = company_infobiz.tourList();
		System.out.println(tour);
		model.addAttribute("mark_list", company_infobiz.markList(member_no));
		
		return "map";
	}
	
	@RequestMapping("map_plan.do")
	public String map_plan(Model model) {
		model.addAttribute("list", planbiz.planList());
		
		return "map_plan";
	}
	
	@RequestMapping("map_addplan.do")
	@ResponseBody
	public int map_addplan(@RequestBody List<Map<String, Object>> list,HttpServletRequest request) {
		HttpSession session=request.getSession();
		MemberDto member_dto=(MemberDto)session.getAttribute("memberDto");
		
		int member_no=member_dto.getMember_no();
		System.out.println("회원 번호:"+member_no);
		ArrayList<PlanDto> planList = new ArrayList<PlanDto>();
		Map<String, Object> map = new HashMap<String, Object>();
			
		PlanDto planDto=new PlanDto();
		planDto.setMember_no(member_no);
		System.out.println("계획 제목:"+list.get(0).get("plan_title").toString());
		planDto.setPlan_title(list.get(0).get("plan_title").toString());
		planbiz.planListInsert(planDto);
		int plan_no=planDto.getPlan_no();
		
		for(Map<String, Object> m : list) {
			PlanDto dto = new PlanDto();
			dto.setPlan_no(plan_no);
			dto.setCompany_no(Integer.parseInt(m.get("company_no").toString()));
			dto.setPlan_price(m.get("plan_price").toString());
			dto.setPlan_time(m.get("plan_time").toString());
			planList.add(dto);
		}
		map.put("list", planList);
		planbiz.planInsert(map);
		
		return 1;
	}
	//마커 클러스터러 json파일로 건내기
	@RequestMapping("markercluster.do")
	public JSONObject marker() {
		JSONObject jsonObject = new JSONObject();
		List<CompanyDto> list=new ArrayList<CompanyDto>();
		list=company_infobiz.allList();
		System.out.println("코더 테스트 경기도 성남시 분당구"+geoCoding("경기도 성남시 분당구"));
		JSONObject data=null;
		JSONArray req_array = new JSONArray();
        
		for(int i=0; i<list.size(); i++) {
			data = new JSONObject();
			System.out.println("주소 출력 중");
			String addr=list.get(i).getCompany_addr();
			
			Float[] coords=geoCoding(addr);
	        data.put("lat", coords[1]);
	        data.put("lng", coords[2]);
	        req_array.add(data);
		}
        jsonObject.put("positions", req_array);
        System.out.println("Json 압축 성공"+req_array+"끝");
        return jsonObject;
	}
	public static Float[] geoCoding(String location) {
		if (location == null) { 
			System.out.println("주소 실패"+location);
			return null;
		}
		Geocoder geocoder = new Geocoder();
		// setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)
		// setLanguate : 인코딩 설정
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocoderResponse;
			try {
				geocoderResponse = geocoder.geocode(geocoderRequest);
				if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
					GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
					LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();			  
					Float[] coords = new Float[2];
					coords[0] = latitudeLongitude.getLat().floatValue();
					System.out.println("지오코딩 변환중");
					coords[1] = latitudeLongitude.getLng().floatValue();
					return coords;
			}
		} catch (IOException ex) {
			System.out.println("지오코딩 에러");
			ex.printStackTrace();
		}
		System.out.println("지오코딩 변환 실패");
		return null;
		}
}
