package com.spring.myself.project.repository;

import com.spring.myself.project.domain.Project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DbProjectRepository implements ProjectRepository{

    //DB접속정보 설정
    private String uid = "java01";
    private String upw = "1234";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe"; //데이터베이스가 어디있는지 주소
    private String driverName = "oracle.jdbc.driver.OracleDriver";

    @Override
    public List<Project> getMarket() {
        List<Project> projectList = new ArrayList<>();

        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, uid, upw);

            String sql = "SELECT * FROM project" +
                    "OREDER BY title_num DESC";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                projectList.add(new Project(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

            return projectList;
    }

    @Override
    public void insertMarket(Project Market) {

        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, uid, upw);

            String sql = "INSERT INTO project" +
                    "(title_num, title, writer, condition, product, content, price)" +
                    "VALUES " +
                    "(seq_project.nextval, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, Market.getTitle());
            pstmt.setString(2, Market.getWriter());
            pstmt.setString(4, Market.getCondition());
            pstmt.setString(4, Market.getProduct());
            pstmt.setString(3, Market.getContent());
            pstmt.setInt(5, Market.getPrice());

            int result = pstmt.executeUpdate();
            if (result == 1 )
                System.out.println("입력 완료 !!!!!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMarket(int titleNum) {

        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, uid, upw);

            String sql = "DELETE FROM project WHERE title_num = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, titleNum);

            int result = pstmt.executeUpdate();
            if (result == 1 )
                System.out.println("삭제 완료 !!!!!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Project getContent(int titleNum) {

        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, uid, upw);

            String sql = "SELECT * FROM project WHERE title_num = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, titleNum);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) { //마우스 커서 이동 (행 커서)
                return new Project(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void changeMarket(Project Market) {

        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, uid, upw);

            String sql = "UPDATE project " +
                    "SET title=?, writer=?, condition=?, product=?, content=?, price=?" +
                    "WHERE title_num=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, Market.getTitle());
            pstmt.setString(2, Market.getWriter());
            pstmt.setString(2, Market.getCondition());
            pstmt.setString(4, Market.getProduct());
            pstmt.setString(3, Market.getContent());
            pstmt.setInt(5, Market.getPrice());

            int result = pstmt.executeUpdate(); // 성공한 쿼리의 수 리턴
            if (result == 1) System.out.println("수정 완료 !!!!!");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void upViewCount(int titleNum) {
        //ProjectRepository.super.upViewCount(titleNum);

        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(url, uid, upw);

            String sql = "UPDATE project " +
                    "SET view_count = view_count + 1 " +
                    "WHERE title_num=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, titleNum);

            int result = pstmt.executeUpdate(); // 성공한 쿼리의 수 리턴
            if (result == 1) System.out.println("조회수 상승 +1 !!!!!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void buyProduct(Project Market) {

    }

    @Override
    public void community(String writer) {

    }
}
