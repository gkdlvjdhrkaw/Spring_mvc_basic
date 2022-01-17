package com.spring.mvc.score;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@Log4j2
public class ScoreController {

    // private final ScoreRepository scoreRepository;
    private final ScoreService scoreService;

    @Autowired
    public ScoreController(ScoreService scoreService) {
        this.scoreService = scoreService;
    }

    // 요청
    @GetMapping("/score/form")
    public String list() {
        LocalDateTime now = LocalDateTime.now();
        return "/score/score-list";
    }

    // 전체조회
    @GetMapping("/score/list")
    public String list(Model model) {
        log.info("/score/list GET !!");
        List<Score> scoreList = scoreService.findAll();
        model.addAttribute("scores", scoreList);
        return "/score/score-list";
    }

    // 등록
    @PostMapping("/score/register")
    public String register(Score score) {
        log.info("/score/register POST - " + score);
        // score.calcTotal(); // 총점, 평균 계산
        // score.changeMarkName(); //마킹 네임 저장
        scoreService.save(score);
        return "redirect:/score/list";
    }

    // 삭제
    @GetMapping("/score/delete")
    public String delete(int stuNum) {
        log.info("score/delete GET - " + stuNum);
        scoreService.remove(stuNum); // 삭제 명령 위임
        return "redirect:/score/list";
    }

    // 상세보기
    @GetMapping("/score/detail")
    public String detail(int stuNum, Model model) {
        log.info("/score/detail GET! - " + stuNum);
        Score score = scoreService.findOne(stuNum);
        model.addAttribute("s", score);
        return "score/detail";
    }
    // ㄹㅇ
}
