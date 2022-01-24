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


    public void insert(Project project) {
        projectRepository.insertMarket(project);
    }

    public void delete
}
