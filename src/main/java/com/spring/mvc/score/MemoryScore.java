package com.spring.mvc.score;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@Log4j2
public class MemoryScore implements ScoreRepository{

    private static Map<Integer, Score> scoreMap = new HashMap<>();


    @Override
    public boolean save(Score score) {
        scoreMap.put(score.getStuNum(), score);
        log.info("ScoreMap");
        return false;
    }

    @Override
    public List<Score> findAll() {
        List<Score> scores = new ArrayList<>();

        for (Integer n : scoreMap.keySet()) {
            scores.add(scoreMap.get(n));
        }
        return scores;
    }

    @Override
    public Score findOne(int stuNum) {
        return null;
    }

    @Override
    public boolean remove(int stuNum) {
        scoreMap.remove(stuNum);
        return false;
    }
}
