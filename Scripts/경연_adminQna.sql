select * from boardcategory b ;
select * from admin;
select * from qna; 

select * from qna q join boardcategory bc on q.categoryno = bc.categoryno;

select R1.*,bc.*,u.*,a.* FROM(
			SELECT * FROM QNA 
		) R1 join boardcategory bc on R1.categoryno = bc.categoryno 
			 join userinfo u on R1.userNo = u.userno 
			 left join admin a on r1.Adminno = a.AdminNo
			 where qnareply is null
			 order by qnaNo desc
		
select R1.* FROM(
			SELECT * FROM QNA where userNo = #{userNo} order by qnaNo desc
		) R1
		LIMIT #{pageSearch}, #{cntPerPage };
		
select count(qnaNo) FROM(
			SELECT * FROM QNA 
		) R1 join boardcategory bc on R1.categoryno = bc.categoryno 
			 join userinfo u on R1.userNo = u.userno 
			 left join admin a on r1.Adminno = a.AdminNo  
			 
select qnano FROM(
			SELECT * FROM QNA 
		) R1 join boardcategory bc on R1.categoryno = bc.categoryno 
			 join userinfo u on R1.userNo = u.userno 
			 left join admin a on r1.Adminno = a.AdminNo  
			 where qnareply is null;
			 