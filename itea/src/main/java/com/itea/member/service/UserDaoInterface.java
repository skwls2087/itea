package com.itea.member.service;

public class UserDaoInterface {
	String searchId(@Param("user_name")String user_name, @Param("user_phone")String user_phone); // 유저 ID 찾기
}
