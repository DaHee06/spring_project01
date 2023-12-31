package com.codingrecipe.project01.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FileDTO {
    private int file_no;
    private int board_no;
    private String org_file_nm;
    private String save_file_nm;
    private String file_path;
    private LocalDateTime reg_dt;
    private LocalDateTime upd_Dt;
}
