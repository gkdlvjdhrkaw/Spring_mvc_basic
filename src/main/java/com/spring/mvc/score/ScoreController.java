package com.spring.mvc.score;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;

@Log4j2
public class ScoreController {

    private final ScoreRepository scoreRepository;

    @Autowired
    public ScoreController(ScoreRepository scoreRepository) {
        this.scoreRepository = scoreRepository;
    }

    // 요청
    @GetMapping("/score/list")
    public String list() {
        LocalDateTime now = LocalDateTime.now();
        log.info("/score/list 요청을 GET 했슴돠 !");
        return "/score/score-list";
    }

    // 전체조회
    @GetMapping("/score/register")
    public String register(Score score) {
        log.info("/score/register Post - " + score);
        MemoryScore.save(score);
        return "/score/score-list";
    }

    // 저장
    @GetMapping("/score/delete")
    public String delete(int stuNum) {
        log.info("emp/delete GET !!");
        scoreRepository.remove(stuNum);
        return "redirect:/score/list";
    }

}
