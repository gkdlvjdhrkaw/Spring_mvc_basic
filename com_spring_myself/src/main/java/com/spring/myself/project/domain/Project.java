package com.spring.myself.project.domain;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

@Setter @Getter @AllArgsConstructor @ToString
public class Project {

    private static int sequence;

    // 회원정보
    private String ID;
    private String PW;
    private boolean gender;
    private String address;
    private int phoneNum;

    // 게시판
    private int titleNum; // 게시판 번호
    private String title; // 글 제목
    private String writer; // 작성자
    private String content; // 글 내용
    private String product; // 물건 이름
    private String condition; // 상태
    private int price; // 가격
    private int viewCount; // 조회수
    private Timestamp regDate; // 글작성 일자시간


    public Project() {
        System.out.println("titleNum of title plus up");
        this.titleNum = ++sequence;
    }

    public Project(String title, String writer, String content, String product, int price) {
        this();
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.product = product;
        this.price = price;
    }


    public Project(ResultSet rs) throws SQLException {
        this.ID = rs.getString("id");
        this.PW = rs.getString("pw");
        this.gender = rs.getBoolean("gender");
        this.address = rs.getString("address");
        this.phoneNum = rs.getInt("phone_num");

        this.titleNum = rs.getInt("title_num");
        this.title = rs.getString("title");
        this.writer = rs.getString("writer");
        this.content = rs.getString("content");
        this.product = rs.getString("product");
        this.condition = rs.getString("condition");
        this.price = rs.getInt("price");
        this.viewCount = rs.getInt("view_count");
        this.regDate = rs.getTimestamp("reg_date");
    }

}
