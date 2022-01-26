package com.spring.myself.project.repository;

import com.spring.myself.project.domain.Project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoryProjectRepository implements ProjectRepository {

    private static Map<Integer, Project> projectMap = new HashMap<>();

    static {
        projectMap.put(1, new Project("오늘까지팜","체리", "갤럭시S21 새거팔아요", "갤럭시S21" , 100000));
        projectMap.put(2, new Project("내일까지팜", "물병자리", "아이폰폰케이스 수제 제품임", "아이폰폰케이스", 15000));
        projectMap.put(3, new Project("떨이해드림", "키스톤콤비", "떨이할때 안사면 후회한다구??", "문상50000", 30000));
    }



    @Override
    public List<Project> getMarket() {
        List<Project> Market = new ArrayList<>();
        for (int titleNum : projectMap.keySet()) {
            Project project = projectMap.get(titleNum);
            Market.add(project);
        }
        return Market;
    }

    @Override
    public void insertMarket(Project Market) {
        projectMap.put(Market.getTitleNum(), Market);
    }

    @Override
    public void deleteMarket(int titleNum) {
        projectMap.remove(titleNum);
    }

    @Override
    public Project getContent(int titleNum) {
        return projectMap.get(titleNum);
    }

    @Override
    public void changeMarket(Project Market) {
        int titleNum = Market.getTitleNum();
        if (projectMap.containsKey(titleNum))
            projectMap.put(titleNum, Market);
    }

    @Override
    public void buyProduct(Project Market) {
        String product = Market.getProduct();
    }


    @Override
    public void community(String writer) {
    }


}
