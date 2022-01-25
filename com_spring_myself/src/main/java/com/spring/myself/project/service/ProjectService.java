package com.spring.myself.project.service;

import com.spring.myself.project.domain.Project;
import com.spring.myself.project.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    private final ProjectRepository projectRepository;

    @Autowired
    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    public List<Project> getMarket() {
        List<Project> projectList = projectRepository.getMarket();
        return projectList;
    }


    //새 글 등록 중간처리
    public void insert(Project project) {
        projectRepository.insertMarket(project);
    }

    public void deleteMarket(int titleNum) {
        projectRepository.deleteMarket(titleNum);
    }

    public Project getContent(int titleNum) {
        // projectRepository.upViewCount(titleNum);
        return projectRepository.getContent((titleNum));
    }

    public void changeMarket(Project project) {
        projectRepository.changeMarket(project);
    }



}
