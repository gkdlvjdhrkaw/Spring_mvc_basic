package com.spring.myself.project.repository;

import com.spring.myself.project.domain.Project;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjectMapper {

    // 메인
    // 1. 로그인  | 2. 회원가입  |  3. 종료


    // 로그인 이후 메인
    // 1. 공지사항  |  2. 제품판매  | 3. 제품구매  |  4. 회원정보  |  5. 종료


    // 로그인인

    // 회원가입

    // 회원 정보 수정

    // 회원 탈퇴


    // 게시글 목록
    List<Project> getMarket();

    // 게시글 등록 (판매)
    void insertMarket(Project Market);

    // 게시글 삭제
    void deleteMarket(int titleNum);

    // 게시글 내용보기
    Project getContent(int titleNum);

    // 게시글 수정
    void changeMarket(Project Market);

    // 조회수 상승
    default void upViewCount(int titleNum) {}

    // 제품 구매
    void buyProduct(Project Market);

    // 대화 or 쪽지
    void community(String writer);

}
