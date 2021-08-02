-- 공지 이벤트 모든글 출력
select * 
from boardcategory bc join board b on bc.CategoryNo =b.CategoryNo 
where bc.categoryno in(1,2);

select * from board;

select R1.*,bc.categoryName FROM(
			SELECT * FROM BOARD 
		) R1 join boardcategory bc on r1.categoryNo = bc.CategoryNo order by boardNo desc ;
		
select R1.* FROM(
			SELECT * FROM BOARD order by boardNo desc
		) R1
		
		
select R1.* FROM board R1 join boardcategory bc on r1.categoryNo = bc.CategoryNo
	where boardTitle LIKE CONCAT('%', '이', '%')
		 order by boardNo desc;
		 
	select R1.* FROM board R1 join boardcategory bc on r1.categoryNo = bc.CategoryNo
	where
					R1.categoryNo=2
					and boardTitle LIKE CONCAT('%', '벤', '%')
		 order by boardNo desc;
		 
select * from prjboard;