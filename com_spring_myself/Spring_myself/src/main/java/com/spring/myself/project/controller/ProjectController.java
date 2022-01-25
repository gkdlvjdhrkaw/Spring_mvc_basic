package com.spring.myself.project.controller;

import com.spring.myself.project.domain.Project;
import com.spring.myself.project.service.ProjectService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Log4j2
public class ProjectController {

    private final ProjectService projectService;

    @Autowired
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping("/project/write")
    public String write() {
        return "project/write";
    }

    @PostMapping("/project/write")
    public String write(Project Market) {
        projectService.insert(Market)
    }



}
