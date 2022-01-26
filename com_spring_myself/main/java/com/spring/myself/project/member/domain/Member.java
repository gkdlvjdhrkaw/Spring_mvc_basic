package com.spring.myself.project.member.domain;

import lombok.*;
import java.sql.Timestamp;

@Setter @Getter @ToString
@NoArgsConstructor @AllArgsConstructor
public class Member {

    // 회원정보
    private String ID; // 계정명
    private String PW; // 비밀번호
    private boolean gender; // 이름
    private String address; // 주소
    private int phoneNum; // 전화번호
    private Timestamp regDate; // 가입날짜
    private Auth auth; // 권한 (관리자, 일반)

}
