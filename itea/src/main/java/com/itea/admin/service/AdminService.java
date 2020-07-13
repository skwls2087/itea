package com.itea.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;
import com.itea.util.Visitor;


public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
    public JSONObject getChartData() {//제이슨 오브젝트를 리턴하는 것
        // getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	ArrayList<MemberDTO> member = adminDAO.WeekMember(mdto);
        
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("week","일주일"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("weekCnt", "일주일 가입자수");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (MemberDTO mdto : member) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject name = new JSONObject(); //json오브젝트 객체를 생성
            name.put("week", mdto.getProduct_name()); //name변수에 dto에 저장된 상품의 이름을 v라고 저장한다.
            
            JSONObject money = new JSONObject(); //json오브젝트 객체를 생성
            money.put("v", mdto.getMoney()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(name); //name을 row에 저장 (테이블의 행)
            row.add(money); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//회원 목록
	public PageUtil memberList(int page) throws Exception {
		MemberDTO mdto = new MemberDTO();
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.totalCount();
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberList(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;
	}
		
	//회원 검색
	public PageUtil memberSearchMnick(int page,MemberDTO mdto) throws Exception {
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.mCntMnick(mdto);
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberSearchMnick(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;		
	}
	
	//회원 검색
	public PageUtil memberSearchMmail(int page,MemberDTO mdto) throws Exception {
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.mCntMmail(mdto);
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberSearchMmail(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;		
	}
	
	
	//강제탈퇴
	public void deleteMember(String mnick) throws Exception {
		adminDAO.deleteMember(mnick);
	}
		
	
}











