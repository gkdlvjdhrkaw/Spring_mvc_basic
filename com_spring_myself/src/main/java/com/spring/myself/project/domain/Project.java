package com.spring.myself.project.domain;

import lombok.*;

@Setter @Getter @AllArgsConstructor @ToString
public class Project {

    // 회원정보
    private String ID;
    private String PW;
    private boolean gender;
    private String address;
    private int phoneNum;

    // 게시판
    private int titleNum; // 게시판 번호
    private String title; // 글 제목
    private String product; // 물건 이름
    private String writer; // 작성자
    private String condition; // 상태
    private int price; // 가격





}
