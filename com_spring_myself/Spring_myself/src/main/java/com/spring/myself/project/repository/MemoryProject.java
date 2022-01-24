package com.spring.myself.project.repository;

import com.spring.myself.project.domain.Project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoryProject implements ProjectRepository {

    private static Map<Integer, Project> projectMap = new HashMap<>();

    static {
        projectMap.put(1, new Project());
        projectMap.put(2, new Project());
        projectMap.put(3, new Project());
    }

    /*
    this.writer = writer;
        this.title = title;
        this.content = content;
        this.product = product;
        this.price = price;
     */


    @Override
    public List<Project> getMarket() {
        return null;
    }

    @Override
    public void insertMarket(Project Market) {

    }

    @Override
    public void deleteMarket(int titleNum) {

    }

    @Override
    public Project getContent(int titleNum) {
        return null;
    }

    @Override
    public void changeMarket(Project Market) {

    }

    @Override
    public void buyProduct(Project Market) {

    }

    @Override
    public void community(String writer) {

    }
}
