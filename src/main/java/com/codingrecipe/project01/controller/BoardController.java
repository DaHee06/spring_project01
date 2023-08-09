package com.codingrecipe.project01.controller;

import com.codingrecipe.project01.dto.CategoryDTO;
import com.codingrecipe.project01.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/insert")
    public String insertForm(Model model){
        List<CategoryDTO> resultList = boardService.selectCategory();
        model.addAttribute("resultList", resultList);
        return "insertForm";
    }

    @PostMapping("/insert")
    public String insert(@RequestParam() String board, Model model){


        return "boardList";
    }
}
