package com.example.demo.controller;

import com.example.demo.domain.Member;
import com.example.demo.dto.MessageDTO;
import com.example.demo.service.BookService;
import com.example.demo.service.MemberService;
import com.example.demo.service.MypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/mypage")
@RequiredArgsConstructor
@CrossOrigin("*")
public class MypageController {

    private final MypageService mypageService;
    private final BookService bookService;



    // 도서 삭제
    @DeleteMapping("/{bookId}")
    public ResponseEntity<Void> delete(@PathVariable Long bookId) {
        bookService.delete(bookId);
        return ResponseEntity.noContent().build(); // 204 No Content
    }

}

