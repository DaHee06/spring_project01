package com.codingrecipe.project01.repository;

import com.codingrecipe.project01.dto.BoardDTO;
import com.codingrecipe.project01.dto.CategoryDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BoardRepository {
    private final SqlSessionTemplate sql;
    public int insertBoard(BoardDTO boardDTO){
        return sql.insert("BoardMapper.insertboard", boardDTO);
    }

    public List<CategoryDTO> selectCategory(){
        return sql.selectList("BoardMapper.selectCategory");
    }

}
