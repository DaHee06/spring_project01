package com.codingrecipe.project01.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CommentDTO {
    private int cmt_no;
    private int board_no;
    private String cmt_id;
    private String cmt_content;
    private LocalDateTime reg_dt;
    private LocalDateTime upd_dt;
}

