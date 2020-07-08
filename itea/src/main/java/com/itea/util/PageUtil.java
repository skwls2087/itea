package com.itea.util;

import java.util.ArrayList;
import java.util.List;

import com.itea.dto.MemberDTO;

public class PageUtil {
	
	//	꼭 필요한 정보
	private	int	nowPage;		//	보고싶은 페이지
	private	int	totalCount;		//	총 데이터 개수
	private List<MemberDTO> content;	//화면에 출력할 회원 목록
	
	//	보조적으로 필요한 정보
	private	int	lineCount;		//	한페이지당 보여주고 싶은 게시물의 개수
	private	int	pageGroup;		//	페이지 이동 기능은 몇개까지 가능할지를 지정
								//	[1][2][3][4][5] 의 개수
	
	//	계산에 의해서 만들어야 하는 실제 페이지 이동 정보
	private	int	totalPage;		//	총 몇페이지짜리 게시판인지를 기억할 변수
	private	int	startPage;		//	페이지 이동 기능이 몇페이지 부터 만들지를 지정한다.
	private	int	endPage;		//	페이지 이동 기능을 몇페이지까지 만들지를 지정한다.
	
	public PageUtil(int nowPage, int totalCount) {
		this(nowPage, totalCount, 5, 5);
	}
	
	//(전체회원수, 보고싶은페이지,한페이지당 게시글수, content)
	public PageUtil(int totalCount, int nowPage, int size, ArrayList<MemberDTO> content) {
		this.totalCount = totalCount;
		this.nowPage = nowPage;
		this.content = content;
		if (totalCount == 0) { //등록된 게시글이 0건일경우
			totalPage = 0;
			startPage = 0;
			endPage = 0;
		} else { //등록된 게시글이 1건이상 존재한다면 
			totalPage = totalCount / size; // 10=109/10  9  
		    //전체 페이지수  = 전체게시물수 /한페이지당 게시글수;
			if (totalCount % size > 0) {
				totalPage++;  //나머지 게시물을 출력하기위한 페이지를 추가
			}
			
			//아래의 5값은  한번에 출력하고 싶은 페이지개수를 뜻한다
			int modVal = nowPage % 5;   //보고싶은페이지10%5  1 2 3 4
			startPage = nowPage / 5 * 5 + 1; //시작페이지=10/5*5+1
		   //시작 페이지번호=   보고싶은페이지 / 5 * 5 + 1;
			if (modVal == 0) startPage -= 5; //startPage=startPage-5
			
			endPage = startPage + 4;
		  //끝 페이지번호= 시작 페이지번호  + 4      

			//끝페이지번호가   실제총페이지수보다 크게 되면
			//끝페이지번호를  실제총페이수로 조정하여
			//비어있는 페이지가 발생되지 않도록 한다
			if (endPage > totalPage) endPage = totalPage;
		}
	}
	
	public PageUtil(int nowPage, int totalCount, int lineCount, int pageGroup) {
		this.nowPage 	= nowPage;
		this.totalCount = totalCount;
		this.lineCount 	= lineCount;
		this.pageGroup 	= pageGroup;
		calcTotalPage();
		calcStartPage();
		calcEndPage();
	}
	
	
	//	1.총 페이지수 계산
	private	void calcTotalPage() {
		//	총 페이지 수는 전체 게시물 개수를 한페이지당 보여줄 개수로 나눈 결과이다.
		//	다만	마지막 페이지는 개수가 부족해도 한페이지가 더 필요하다.
		//		예>		100			10		10		몫을 이용하면 된다.
		//				101			10		11		몫 + 1을 해주어야 한다.
		totalPage = (totalCount % lineCount == 0) ? (totalCount / lineCount) : (totalCount / lineCount + 1);
	}
	
	//2.	시작 페이지 계산
	private	void calcStartPage() {
		//	현재 페이지를 가운데 놓고 양쪽에 다음 페이지를 놓는 방식으로 만들고자 한다.
		//	[5][6][7][8][9]
		//	[7][8][9][10][11]
		
		startPage = nowPage - (pageGroup / 2);
	                   
		if(startPage <= 0) {
			startPage = 1;
		}
	}
	
	//	3.마지막 페이지 계산
	private	void calcEndPage() {
		endPage = startPage + (pageGroup - 1);
		
		//	마지막 페이지보다 더 큰 페이지가 나올 수 있다.
		if(endPage >= totalPage) {
			endPage = totalPage;
		}
	}


	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getLineCount() {
		return lineCount;
	}
	public void setLineCount(int lineCount) {
		this.lineCount = lineCount;
	}
	public int getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public List<MemberDTO> getContent() {
		return content;
	}

	public void setContent(List<MemberDTO> content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "PageUtil [nowPage=" + nowPage + ", totalCount=" + totalCount + ", lineCount=" + lineCount
				+ ", pageGroup=" + pageGroup + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

	


}