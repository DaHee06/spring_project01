package com.codingrecipe.project01.service;

import com.codingrecipe.project01.dto.BoardDTO;
import com.codingrecipe.project01.dto.CategoryDTO;
import com.codingrecipe.project01.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;

    public int insertBoard(BoardDTO boardDTO){
        return boardRepository.insertBoard(boardDTO);
    }

    public List<CategoryDTO> selectCategory(){
        return boardRepository.selectCategory();
    }
}
