package com.spring.mvc.basic.controller.v2;

import lombok.*;

import java.util.List;

@Setter @Getter
@NoArgsConstructor @AllArgsConstructor
public class user {

    private String id;
    private String pw;
    private String userName;
    private List<String> hobby;
    private boolean mail;

}
