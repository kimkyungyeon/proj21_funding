-- test는 구역안에서 해주시고, 스크립트 길이가 너무 길어지면 그때 조금씩 new 만들어서 옮기는게 좋을 것 같아요


select R1.* FROM(
	SELECT qnaNo, userNo, adminNo, categoryNo, qnaTitle, qnaContent, qnaDate, qnaReply, replyDate, qnaFile FROM QNA where userNo = 2 order by qnaNo desc
) R1
LIMIT 0, 10;

-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN, DelSend, DelRecevie
from message;

select MsgNo, SendUser, ReceiveUser, MsgContent, SendDate, ReadYN, DelSend, DelRecevie
  from message
 where ReceiveUser = 'test10' and delRecevie = false;

select MsgNo, SendUser, ReceiveUser, MsgContent, SendDate, ReadYN, DelSend, DelRecevie
  from message
 where SendUser = 'test1' and delSend = false;

select count(*)
  from message
 where SendUser = 'test1' and delSend = false;


select R1.* FROM(
	SELECT * 
		FROM message 
		where SendUser = 'test1' and delSend = false
		order by MsgNo desc
	) R1
	LIMIT 0, 10;


update message 
set ReadYN = 1
where MsgNo = 10;
insert into message ( SendUser, ReceiveUser, MsgContent)
	 values ( 'test1', 'test10', '펀딩팀 화이팅1'),
	  ('test1', 'test10', '펀딩팀 화이팅2'),
	  ('test1', 'test10', '펀딩팀 화이팅3'),
	  ('test1', 'test10', '펀딩팀 화이팅4'),
	  ('test1', 'test10', '펀딩팀 화이팅5'),
	  ('test1', 'test10', '펀딩팀 화이팅6'),
	  ('test1', 'test10', '펀딩팀 화이팅7'),
	  ('test1', 'test10', '펀딩팀 화이팅8'),
	  ('test1', 'test10', '펀딩팀 화이팅9'),
	  ('test1', 'test10', '펀딩팀 화이팅10'),
	  ('test1', 'test10', '펀딩팀 화이팅11'),
	  ('test1', 'test10', '펀딩팀 화이팅12'),
	  ('test1', 'test10', '펀딩팀 화이팅13'),
	  ('test1', 'test10', '펀딩팀 화이팅14'),
	  ('test1', 'test10', '펀딩팀 화이팅15'),
	  ('test10', 'test1', '펀딩팀 화이팅1'),
	  ('test10', 'test1', '펀딩팀 화이팅2'),
	  ('test10', 'test1', '펀딩팀 화이팅3'),
	  ('test10', 'test1', '펀딩팀 화이팅4'),
	  ('test10', 'test1', '펀딩팀 화이팅5'),
	  ('test10', 'test1', '펀딩팀 화이팅6'),
	  ('test10', 'test1', '펀딩팀 화이팅7'),
	  ('test10', 'test1', '펀딩팀 화이팅8'),
	  ('test10', 'test1', '펀딩팀 화이팅9'),
	  ('test10', 'test1', '펀딩팀 화이팅10'),
	  ('test10', 'test1', '펀딩팀 화이팅11'),
	  ('test10', 'test1', '펀딩팀 화이팅12'),
	  ('test10', 'test1', '펀딩팀 화이팅13'),
	  ('test10', 'test1', '펀딩팀 화이팅14'),
	  ('test10', 'test1', '펀딩팀 화이팅15');
	
delete from message where MsgNo =6;
-- BoardCategory (글분류)-> Board(사이트게시판) 외래키
select
	CategoryNo, CategoryName 
from boardcategory;

select * from userinfo u ;

-- Board (사이트게시판)
select
	BoardNo, CategoryNo, BoardTitle, 
	BoardContent, BoardDate, BoardReadCount
from board;



-- Admin(관리자) -> QnA(Qna) 외래키
select
	AdminNo, AdminId, AdminPw, AdminName, AdminTel
from admin;




-- UserInfo(회원정보) -> QnA(QnA) 외래키
select 
	UserNo, UserId, UserPw,	UserName, Nickname, Email,
	UserPhone, ZipCode, Address, DetailAddress, 
	BankName, AccountHolder, BankAccount, Secession
from userinfo;
where UserName = 'test10' and Email = 'ttt@naver.com';
where userId = 'test10' and userPw = password('1111');
where UserName = 'test10' and UserPhone = '01012345678';

update userinfo
		   set userPw = password('1111')
		 where userId = 'test10';
		 
delete from userinfo where userNo >2;
alter table userinfo auto_increment=4;

-- 계좌 등록 여부 확인
select BankName, BankAccount 
from userinfo 
where UserNo = 1;

select * from userinfo u ;

update userinfo 
set BankName = '', BankAccount = '', AccountHolder = ''
where UserNo = 4;

-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select 
	QnaNo, UserNo, AdminNo, CategoryNo,
	QnaTitle, QnaContent, QnaReply, QnaFile
from qna;




-- Project(프로젝트) - UserInfo(회원정보) 외래키 받음
select
			PrjNo, UserNo, pCategoryNo, 
			PrjName, PrjContent, PrjGoal,
			StartDate, EndDate, PayDate, EndYN
from project;
-- 수정 프로젝트
select 
PrjNo, pCategoryNo, PrjName, PrjContent, PrjGoal, 
StartDate, EndDate, PayDate 
from project;

-- Join 프로젝트 + 프로젝트옵션 Update 프로젝트 수정
update project as p inner join prjoption as op
on p.PrjNo = op.PrjNo 
	set 
	 	p.pCategoryNo = '1',
		p.PrjName = '업데이트너무1힘들었음', p.PrjContent ='dto하나1로 다받는게 쉬움', p.PrjGoal = 333333333,
		p.EndDate = '2022-06-13',
		op.OptName = '1주일쨰 파일1올리기,수정', op.OptPrice =30330000, op.OptContent ='화이팅하자'
where p.PrjNo =22;
select * from project;
select * from prjoption p 
where PrjNo =225;
select  * from prjoption p ;

update project as p inner join prjoption as op
on p.PrjNo = op.PrjNo 
	set 
		p.PrjName = '업데이트너무힘들었음', p.PrjContent ='dto하나로 다받는게 쉬움',
		op.OptName = '1주일쨰 파일올리23123기,수정', op.OptContent ='화이팅하자'
where op.PrjNo = 4;

select * from project p2 ;
-- Project + userInfo + prjOption 조인 by prjNo
select p.prjNo,p.UserNo, p.pCategoryNo, pc.pCategoryName,  PrjName, PrjContent, PrjGoal,
				StartDate, EndDate, PayDate, EndYN, u.UserId , u.UserName,
				o.OptNo, o.OptPrice,o.OptContent,o.optName
			from project p join userinfo u on p.userno = u.UserNo 
						   join prjoption o on p.PrjNo =o.PrjNo
						   join prjcategory pc on p.pCategoryNo = pc.pCategoryNo 
			where o.prjNo = 8;
	
		
-- 		카테고리 join 리스트
select 
		p.PrjNo, p.UserNo, pc.pCategoryNo, pc.pCategoryName, 
		p.PrjName, p.PrjContent, p.PrjGoal, p.EndDate, p.PayDate
from project p join prjcategory pc on p.pCategoryNo = pc.pCategoryNo 
	where  p.PrjNo =21;

-- 업데이트 프로젝트
update project 
	set 
	pCategoryNo = 3,
	PrjName = '업데이트', PrjContent ='성공', PrjGoal = 200000, 
	EndDate = '2021-06-13'
	where prjno = 21;

select * from prjoption p2 ;
select * from project;
where PrjNo  = 27;




-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo, PayYN, EndYN
from fundinginfo;



-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
		OptNo, PrjNo, OptName, OptPrice, OptContent
from prjoption;

-- 옵션 프로젝트 업데이트
update prjoption 
	set OptName ='문방사우', OptPrice = 2200000, OptContent = '먹'
where OptNo =22;

-- 프로젝트옵션  프로젝트번호로 검색
select OptNo, PrjNo, OptName, OptPrice, OptContent
		from prjoption
where PrjNo =57;

-- 추가 2개
insert into prjoption(PrjNo , OptName, OptPrice,OptContent) values
(3, 'test2', 20000, 'test2'),
(3, 'test3', 30000, 'test3');

-- 업데이트 2개
update prjoption as op1 inner join prjoption as op2
on op1.PrjNo = op2.PrjNo 
	set 
		op1.OptName ='test성공하자', op1.OptPrice =20000, op1.OptContent ='제발',
		op2.OptName = '업데이트', op2.OptPrice = 30000, op2.OptContent = '하자'
where op1.OptNo =286  and op2.OptNo  =287;

--  업데이트 3개
update prjoption as op1 inner join prjoption as op2 inner join prjoption  as op3
on op1.PrjNo = op2.PrjNo =op3.PrjNo 
	set 
		op1.OptName ='test성공하23자', op1.OptPrice =204000, op1.OptContent ='제발',
		op2.OptName = '업데이2트', op2.OptPrice = 300400, op2.OptContent = '하자',
		op3.OptName = '업데이2트', op3.OptPrice = 300400, op3.OptContent = '하자'
where op1.OptNo =518  and op2.OptNo  =519 and op3.OptNo = 520;


select *from prjoption p 
where PrjNo =222;




-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
select 
	PostNo, PrjNo, UserNo, PostContent, PostDate, PostFile, FileName 
from prjboard
order by PostNo desc;

insert into prjboard (PrjNo, UserNo, PostContent )
values (2, 2, '잘되고있어요'), (2, 2, '잘되고있어요'), (2, 2, '잘되고있어요');

delete from prjboard
where PostNo = 1;

update prjboard
	set  PrjNo, UserNo, PostContent
	where PostNo;

-- addresses(주소)
select 
	addr_id, street, city, state, zip, country 
from addresses ;


-- prjcategory(카테고리)
select 	*from prjcategory;
-- Project + PrjOption insert 트렌젝션
desc project;
select  * from project; 
SELECT * FROM prjoption;
select * from userinfo;

delete from project 
where PrjNo  = 10;

delete from prjoption 
where PrjNo = 10;
	
		
insert into project(
		UserNo, pCategoryNo, PrjName, PrjContent, PrjGoal, 
		StartDate, EndDate, PayDate) 
values(
		00001, 2, '클라우드펀딩 올리기', '후원받아 제품 구매할수있게 만들기', 1000000,
		now(), now(), now());
/*insert할 때 autoincrease하면 번호 정확하게 찾지  못해서 사용하는 select*/
	SELECT last_insert_id();


delete from member where id >91;

delete
from project
where prjno > 6;

delete
from prjoption 
where optno > 4;


-- 프로젝트 올린거 조회 고객번호로, totalPrice까지 옵션 +  페이징
	select 
				p.prjNo, p.UserNo,  p.pCategoryNo, pc.pCategoryName ,PrjName, PrjContent, PrjGoal,
				p.StartDate, p.EndDate, p.PayDate, p.EndYN, u.UserId , u.UserName,u.nickname,
				op.OptNo, op.optName,  op.OptPrice, op.OptContent,
				if(sum(op.optPrice)>0,sum(op.optPrice),0) as totalPrice
		from fundinginfo f 
	   			join prjoption op on op.optno= f.OptNo 
				right join project p on p.prjno = f.PrjNo 
				join userinfo u on p.UserNo = u.UserNo 
				join prjcategory pc on p.pCategoryNo = pc.pCategoryNo
	group by prjno
	having p.userno = 1;

select * from userinfo u ;
select * from prjoption p ;



-- 프로젝트 no로 검색 detail 프로젝트리스트
select 
		p.prjNo, p.UserNo,  p.pCategoryNo, pc.pCategoryName, p.PrjName, p.PrjContent, p.PrjGoal,
		p.StartDate, p.EndDate, p.PayDate, p.EndYN, u.UserId , u.UserName,u.nickname,
		op.OptNo, op.optName,  op.OptPrice, op.OptContent,
		if(sum(optPrice)>0,sum(optPrice),0) as totalPrice
from project p
	join prjoption op  on p.PrjNo = op.PrjNo 
	join userinfo u on p.UserNo = u.UserNo 
	join prjcategory pc on p.pCategoryNo = pc.pCategoryNo
 	where p.PrjNo =4;
 
 
 select * from prjoption p ;
select * from project p ;
 
 
 select 
		p.prjNo, p.UserNo,  p.pCategoryNo, pc.pCategoryNo, PrjName, PrjContent, PrjGoal,
		p.StartDate, p.EndDate, p.PayDate, p.EndYN, u.UserId , u.UserName,u.nickname,
		o.OptNo, o.optName,  o.OptPrice, o.OptContent,
	if(sum(optPrice)>0,sum(optPrice),0) as totalPrice
from fundinginfo f 
		 join prjoption o on o.optno= f.OptNo 
		 right join project p on p.prjno = f.PrjNo 
		 join userinfo u on p.userno = u.userno
		 join prjcategory pc on p.pCategoryNo =pc.pCategoryNo 
 where o.prjno = 2;	
 
 
-- qna test	
	
insert into qna(userNo, categoryNo, qnaTitle, qnaContent, qnaFile)
values (3, 3, "오늘의 질문", "질문", null);

select * from qna;

update QNA
   set qnaReply = "이제 해결했음!", replyDate = now(), adminNo = "1"
 where qnaNo = "3";

delete from qna where qnaNo=4;
 

-- admin test

select * from admin;

delete from admin where adminNo = 5;

insert into boardcategory(CategoryName)
values ('창작자'), ('후원자'), ('사이트 이용');

select * from boardcategory;

-- 페이징
select R1.* FROM(
SELECT * FROM QNA where userno = 3 order by qnaNo desc
) R1
LIMIT 0, 10
;

SELECT count(*) FROM qna;
SELECT count(*) FROM qna where userno = 3;

insert Board(categoryNo, boardTitle, boardContent)
values (1, "210618 업데이트 내용", "안내하는 중"),
(1, "210618 서버 안정화", "안내하는 중"),
(2, "210618", "안내하는 중"),
(1, "로그인 오류 관련 보상", "안내하는 중"),
(2, "해당 이벤트 종료 일정 안내", "안내하는 중"),
(1, "여름 업데이트", "안내하는 중"),
(2, "210618 이벤트 사전안내1", "안내하는 중"),
(2, "210618 이벤트 사전안내2", "안내하는 중"),
(1, "210618 업데이트 내용1", "안내하는 중"),
(1, "210618 업데이트 내용2", "안내하는 중"),
(1, "210618 업데이트 내용3", "안내하는 중"),
(2, "210618 후원금 페이백 이벤트", "안내하는 중"),
(1, "210618 업데이트 내용4", "안내하는 중"),
(1, "210618 업데이트 내용5", "안내하는 중"),
(1, "210618 업데이트 내용6", "안내하는 중"),
(2, "210618 이벤트 사전안내3", "안내하는 중"),
(2, "210618 이벤트 사전안내4", "안내하는 중"),
(1, "210618 업데이트 내용7", "안내하는 중"),
(1, "210618 업데이트 내용8", "안내하는 중"),
(1, "210618 업데이트 내용9", "안내하는 중"),
(2, "210618 이벤트 사전안내5", "안내하는 중"),
(1, "210618 업데이트 내용10", "안내하는 중"),
(1, "210618 업데이트 내용11", "안내하는 중"),
(2, "210618 이벤트 사전안내6", "안내하는 중"),
(1, "210618 업데이트 내용12", "안내하는 중"),
(2, "210618 이벤트 사전안내3", "안내하는 중"),
(2, "210618 이벤트 사전안내4", "안내하는 중"),
(1, "210618 업데이트 내용7", "안내하는 중"),
(1, "210618 업데이트 내용8", "안내하는 중"),
(1, "210618 업데이트 내용9", "안내하는 중"),
(2, "210618 이벤트 사전안내5", "안내하는 중"),
(1, "210618 업데이트 내용10", "안내하는 중"),
(1, "210618 업데이트 내용11", "안내하는 중"),
(2, "210618 이벤트 사전안내6", "안내하는 중"),
(1, "210618 업데이트 내용12", "안내하는 중");

  SELECT *
        FROM (
        SELECT @rownum:=@rownum+1, b.* OVER(ORDER by boardNo DESC) AS
        row_num
        ,boardNo
        ,boardTitle
        FROM board
        );
        
--   상건_페이징
 select 
		p.prjNo, p.UserNo,  p.pCategoryNo, pc.pCategoryName ,PrjName, PrjContent, PrjGoal,
		p.StartDate, p.EndDate, p.PayDate, p.EndYN, u.UserId , u.UserName,u.nickname,
		op.OptNo, op.optName,  op.OptPrice, op.OptContent,
		if(sum(optPrice)>0,sum(optPrice),0) as totalPrice
	from project p
			join prjoption op  on p.PrjNo = op.PrjNo 
			join userinfo u on p.UserNo = u.UserNo 
			join prjcategory pc on p.pCategoryNo = pc.pCategoryNo
	where u.userno = 1		 	
	group by prjno
	order by p.PrjNo  desc limit 1, 5;
			
select count(*)  from project p where userno=1;
select * from project p ;

-- PrjBoardReply(프로젝트게시판답글)
select ReplyNo, PostNo, UserNo, ReplyContent from PrjBoardReply;

update PrjBoardReply
   set ReplyContent = "화이팅"
 where ReplyNo = 1;

delete 
  from PrjBoardReply
 where ReplyNo = 1;

select *from fundinginfo f2 ;
 select  * from project p ;
 select * from prjoption p ;
delete from project where PrjNo =4;
-- 	계좌 수정	
select * from userinfo u ;
update userinfo 
	set BankName =null, AccountHolder =null, BankAccount = null
where UserNo = 53;
		
		select * from project p2 ;
	select * from prjoption p3 ;
		select * from project p2 ;
			