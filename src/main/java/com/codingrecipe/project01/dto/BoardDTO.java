package com.codingrecipe.project01.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
public class BoardDTO {
   private int board_no;
   private String board_title;
   private String writer_id;
   private String writer_nick;
   private String board_pwd;
   private String board_pwd2;
   private String board_content;
   private int hit;
   private int c_no;
   private LocalDateTime reg_dt;
   private LocalDateTime upd_dt;
}
