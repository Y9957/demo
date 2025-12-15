package com.example.demo.repository;

import com.example.demo.domain.Book;
import com.example.demo.domain.Likes;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LikeRepository extends JpaRepository<Likes,Long> {

    @Modifying
    @Transactional
    @Query("UPDATE Likes l " +
            "SET l.likeYn = CASE WHEN l.likeYn = true THEN false ELSE true END " +
            "WHERE l.member.id = :memberId AND l.book.bookId = :bookId")
    void likeToggle(@Param("bookId") Long bookId,
                    @Param("memberId") Long memberId);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO likes (member_id, book_id, like_yn) " +
            "VALUES (:memberId, :bookId, TRUE)",
            nativeQuery = true)
    void insertLike(@Param("bookId") Long bookId,
                    @Param("memberId") Long memberId);

    @Query("""
SELECT l.likeYn FROM Likes l
WHERE l.member.id = :memberId
AND l.book.bookId = :bookId
ORDER BY l.id DESC
""")
    Boolean findLikeYn(Long bookId, Long memberId);


    boolean existsByMember_IdAndBook_BookIdAndLikeYnTrue(Long memberId, Long bookId);


    @Query("SELECT l.book FROM Likes l WHERE l.member.id = :memberId AND l.likeYn = true")
    List<Book> findLikedBooksByMemberId(@Param("memberId") Long memberId);
}
