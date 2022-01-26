package com.spring.myself.project.controller;

import com.spring.myself.project.domain.ChangeProject;
import com.spring.myself.project.domain.Project;
import com.spring.myself.project.service.ProjectService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Log4j2
public class ProjectController {

    private final ProjectService projectService;

    @Autowired
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    // 글 작성 화면
    @GetMapping("/project/write")
    public String write() {
        return "project/write";
    }

    // 글 작성
    @PostMapping("/project/write")
    public String write(Project Market) {
        projectService.insert(Market);
        return "redirect:/project/list";
    }

    // 글 목록
    @GetMapping("/project/list")
    public String list(Model model) {
        List<Project> Market = projectService.getMarket();
        model.addAttribute("Market", Market);
        return "project/list";
    }

    // 글 보기
    @GetMapping("/project/content")
    public String content(int titleNum, Model model) {
        model.addAttribute("", projectService.getContent(titleNum));
        return "project/content";
    }

    // 글 삭제
    @GetMapping("/project/delete")
        public String delete(int titleNum) {
            projectService.deleteMarket(titleNum);
            return "redirect:/project/list";
    }

    // 글 수정
    @PostMapping("/project/change")
    public String change(ChangeProject changeMarket) {
        Project project = projectService.getContent((changeMarket.getTitleNum()));
        project.setTitle(changeMarket.getTitle());
        project.setWriter(changeMarket.getWriter());
        project.setCondition(changeMarket.getCondition());
        project.setProduct(changeMarket.getProduct());
        project.setContent(changeMarket.getContent());
        project.setPrice(changeMarket.getPrice());
        projectService.changeMarket(project);
        return "redirect:/project/content?titleNum="+changeMarket.getTitleNum();
    }



}
