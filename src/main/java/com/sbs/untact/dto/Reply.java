package com.sbs.untact.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Reply {
    private int id;
    private String regDate;
    private String updateDate;
    private int articleId;
    private int memberId;
    private String body;


}