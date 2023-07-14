package com.codingrecipe.project01.controller;

import com.codingrecipe.project01.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class InsertController {

    private final BoardService boardService;

    @GetMapping("/insert")
    public String insertForm(){
        return "insertForm";
    }

    @PostMapping("/insert")
    public String insert(@RequestParam){
        return "boardList";
    }
}
