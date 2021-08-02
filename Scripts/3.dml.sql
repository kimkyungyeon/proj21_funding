-- 컬럼은 위에 셀렉트문으로 확인!!!!!!
-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN, DelSend, DelRecevie
from message;

insert into message
	 (SendUser, ReceiveUser, MsgContent, SendDate, ReadYN, DelSend, DelRecevie)
 values 
 ('test1', 'kykim', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.', now(), 1, 0, 0);

#default값 제외
insert into message (
	SendUser, ReceiveUser, MsgContent, ReadYN) 
values
( 'test1', 'sgkim', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'test1', 'mywns', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'test1', 'pinethx', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'test1', 'jrkim', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'test1', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'sgkim', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'mywns', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'pinethx', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'jrkim', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'sgkim', 'kykim', '"[RE:PLA] 쓰레기도 줄여주고 플라스틱 업사이클까지??"에  참여해주셔서 감사합니다.',  0),
( 'sgkim', 'test1', '"[RE:PLA] 쓰레기도 줄여주고 플라스틱 업사이클까지??"에  참여해주셔서 감사합니다.',  0),
( 'mywns', 'kykim', '"청사과와 청포도의 싱그러운 만남 <애플머스캣> 그린 퍼퓸"에  참여해주셔서 감사합니다.',  0),
( 'mywns', 'test1', '"청사과와 청포도의 싱그러운 만남 <애플머스캣> 그린 퍼퓸"에  참여해주셔서 감사합니다.',  0),
( 'pinethx', 'kykim', '"부활 프로젝트 첫번째 이야기,안중근 의사 흉상"에  참여해주셔서 감사합니다.',  0),
( 'pinethx', 'test1', '"부활 프로젝트 첫번째 이야기,안중근 의사 흉상"에  참여해주셔서 감사합니다.',  0);


-- BoardCategory (글분류)-> Board(사이트게시판) 외래키
select
	CategoryNo, CategoryName, CategoryClass 
from boardcategory;

insert into boardcategory  values
(1, '공지사항', 'board');

#default값 없이
insert into boardcategory (CategoryName, CategoryClass)
	values ('이벤트', 'board');

insert into boardcategory (CategoryName, CategoryClass)
values ('사이트 관련', 'qna'), ('창작자 관련', 'qna'), ('후원자 관련', 'qna');


	
	
	
-- Board (사이트게시판)
select
	BoardNo, CategoryNo, BoardTitle, 
	BoardContent, BoardDate
from board;

#default값 제외
insert into board ( CategoryNo, BoardTitle, BoardContent) values
(1, '[서비스 개선] 팔로우 탐색 개선 및 창작자 메시지 카카오 알림 지원 안내', '<p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">안녕하세요, 텀블벅입니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">언제나 텀블벅을 이용해 주셔서 감사합니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">2021년 6월 24일자로 개선된 기능을 안내드립니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><h3 style="box-sizing: inherit; font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; line-height: 45px; margin: 45px 0px 0px; font-weight: normal; padding: 0px; font-size: 30px; word-break: break-all; letter-spacing: -0.03em; color: rgb(61, 61, 61); background-color: rgb(255, 255, 255);">팔로우 목록 확인</h3><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">이제 다른 이용자의 프로필에서 팔로잉과 팔로워 목록을 확인할 수 있습니다. 관심 있는 이용자를 발견하고 팔로우하여 텀블벅에서의 네트워크를 확장해 보세요.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);"><img src="https://tumblbug-assets.imgix.net/cms_images/attachments/000/000/671/original/_ED_8C_94_EB_A1_9C_EC_9A_B0_20_EB_AA_A9_EB_A1_9D.png?1624596220" style="box-sizing: inherit; border: 0px; max-width: 100%; margin: 0px;"></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><h3 style="box-sizing: inherit; font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; line-height: 45px; margin: 45px 0px 0px; font-weight: normal; padding: 0px; font-size: 30px; word-break: break-all; letter-spacing: -0.03em; color: rgb(61, 61, 61); background-color: rgb(255, 255, 255);">후원자 관리 &gt; 메시지 기능 사용 시 카카오 알림톡 발송</h3><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">창작자가 후원자에게 메시지 보내기 기능을 사용하면 카카오톡 알림톡이 발송됩니다. 후원자는 알림톡의 "메시지 확인하기" 버튼을&nbsp;<span data-token-index="1" data-reactroot="" style="box-sizing: inherit;">누르면 메시지 전문을 확인할 수 있는 페이지로 이동합니다.</span></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);"><span data-token-index="1" data-reactroot="" style="box-sizing: inherit;"><img src="https://tumblbug-assets.imgix.net/cms_images/attachments/000/000/674/original/_EC_95_8C_EB_A6_BC_ED_86_A1.png?1624596531" width="346" style="box-sizing: inherit; border: 0px; max-width: 100%; margin: 0px auto; display: block;"></span></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);"><span data-token-index="1" data-reactroot="" style="box-sizing: inherit;">이 밖에도 후원 상세 페이지에 창작자에게 문의할 수 있는 버튼 추가, 프로젝트 상세 페이지 하단에 "최근 본 프로젝트" 안내 등이 추가되었습니다.</span></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255); text-align: justify;"><img src="https://tumblbug-assets.imgix.net/cms_images/attachments/000/000/675/original/_EC_B0_BD_EC_9E_91_EC_9E_90_EB_AC_B8_EC_9D_98__EC_B5_9C_EA_B7_BC_EB_B3_B8_ED_94_84_EB_A1_9C_EC_A0_9D_ED_8A_B8.png?1624602858" style="box-sizing: inherit; border: 0px; max-width: 100%; margin: 0px;"></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">앞으로도 더욱 편리하게 이용하실 수 있도록 노력하겠습니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">감사합니다.</p>'),
(2, '[파트너십 안내] CJ 대한통운 x 텀블벅 창작자 풀필먼트 서비스 지원', '<div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); margin-top: 0px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">안녕하세요. 텀블벅입니다.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">&nbsp;</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">그동안 프로젝트 마감 후 선물 배송에 고민인 창작자님이 많으셨는데요.<br style="box-sizing: inherit;">CJ 대한통운에서 텀블벅 창작자를 위해 무료 물류 상담과&nbsp;할인된 가격의 풀필먼트 서비스를 지원합니다.<br style="box-sizing: inherit;">풀필먼트 서비스란 단순 배송을 넘어 보관, 포장, CS 등 물류의 모든 과정을 제공하는 물류 일괄 대행 서비스로써,<br style="box-sizing: inherit;">이제 배송에 관한 고민은 내려놓고 프로젝트에 더욱 집중하실 수 있습니다.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">&nbsp;</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);"><strong style="box-sizing: inherit;">﹅&nbsp;제공 혜택</strong></div><ol class="p-rich_text_list p-rich_text_list__ordered" data-stringify-type="ordered-list" data-indent="0" style="box-sizing: inherit; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);"><li data-stringify-indent="0" style="box-sizing: inherit;">무료 물류 상담 서비스 : 언제라도 무료로 물류 상담을 받을 수 있습니다. 상담 이후 계약 여부를 결정하시면 되니 부담 없이 이용해주세요.</li><li data-stringify-indent="0" style="box-sizing: inherit;">풀필먼트 서비스 할인 혜택 : 텀블벅 창작자라면 CJ대한통운의 안정적인 풀필먼트 서비스를 할인된 가격에 이용하실 수 있습니다.</li></ol><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">자세한 내용과 가격표는&nbsp;<a class="c-link" href="https://www.notion.so/tumcorp/cj-abb406aa17b94a1588af5101a6a75d56?utm_source=notice&amp;utm_medium=creator&amp;utm_campaign=fullfilment_cj&amp;utm_content=noti" target="_blank" rel="noopener noreferrer" data-stringify-link="https://www.notion.so/tumcorp/CJ-abb406aa17b94a1588af5101a6a75d56" data-sk="tooltip_parent" style="box-sizing: inherit; background: transparent; color: rgb(250, 100, 98); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1);">여기</a>를 참고 해주세요.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">&nbsp;</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">많은 이용 부탁드립니다.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">감사합니다.</div>');


-- Admin(관리자) -> QnA(Qna) 외래키
select
	AdminNo, AdminId, AdminPw, AdminName, AdminTel
from admin;

insert into admin values
(00001, 'admin',password('0000'), '김경연', '010-6510-7277');
#default값제외
insert into admin (AdminId, AdminPw, AdminName, AdminTel)
values ('admin1', password('0000'),'김상건','010-3302-1972');

-- UserInfo(회원정보) -> QnA(QnA) 외래키
select 
	UserNo, UserId, UserPw,	UserName, Nickname, Email,
	UserPhone, ZipCode, Address, DetailAddress,
	BankName, AccountHolder, BankAccount, Secession
from userinfo;

insert into userinfo values(
00001, 'test1', password('0000'), '김상건', 'ksg', 'test@test.com',
'01033021972', '111222', '대구', '달서구', '국민', '김상건', 00000001, 0 
);

insert into userinfo ( UserId, UserPw, UserName, Nickname,
	email, UserPhone, ZipCode, Address, DetailAddress, BankName, AccountHolder, BankAccount, Secession)
values ('kykim', password('1111'),'김경연', '경연짱123', 'kymonk@naver.com', '01012345678', '12345', '대구광역시 북구','구암로 49길 10 702동 903호','하나은행','김경연','01065107277407',0),
		('sgkim', password('1111'),'김상건', '김상건', 'tkdrjs7@gmail.com', '01012345678', '222333', '대구', '달서구','국민은행','김상건','12346546541',0),
		('mywns', password('1111'),'임준엽', '임준엽', 'wnsduq7@gmail.com', '01012345678', '222333', '대구', '달서구','우리은행','임준엽','9687654134',0),
		('pinethx', password('1111'),'유한솔', '유한솔', 'gksthf7@gmail.com', '01012345678', '222333', '대구', '달서구','대구은행','유한솔','654321789',0),
		('chamdo2', password('1111'),'김예진', '김예진', 'chamdodari2@gmail.com', '01012345678', '222333', '대구', '달서구','카카오뱅크','김예진','1321545',0),
		('mjlee', password('1111'),'이민정', '이민정', 'alswjd7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,1),
		('mkjung', password('1111'),'정민강', '정민강', 'alsrkd7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('jrkim', password('1111'),'김재룡', '김재룡', 'wofyd7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,1),
		('bgshin', password('1111'),'신범건', '신범건', 'qjarjs7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('jylee', password('1111'),'이종윤', '이종윤', 'whddbs7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('khkim', password('1111'),'김길현', '김길현', 'rlfgus7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,1),
		('thlee', password('1111'),'이태훈', '이태훈', 'xogns7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('mhsong', password('1111'),'송명훈', '송명훈', 'audgns7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('nylee', password('1111'),'이나연', '이나연', 'skdus7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('sdfsf234', password('1111'),'김상건', '김상건', 'kjj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('asdfasdf', password('1111'),'이태훈', '이태훈', 'ksm@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('asd21z5', password('1111'),'이중환', '이중환', 'ljh@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('sdf5445', password('1111'),'송모세', '송모세', 'sms@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('s56ds', password('1111'),'김철진', '김철진', 'kcj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('sd4f5', password('1111'),'우선진', '우선진', 'wsj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('sdf456', password('1111'),'최민재', '최민재', 'cmj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('asd78qw', password('1111'),'서원호', '서원호', 'swh@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('qwzx12', password('1111'),'장원운', '장원운', 'jww@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('asd54', password('1111'),'최민준', '최민준', 'cmj2@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('zxcv74', password('1111'),'권기백', '권기백', 'kkb@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('rg4r5', password('1111'),'박준영', '박준영', 'pjy@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('6wh4we', password('1111'),'김건희', '김건희', 'kgh@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('as6d54', password('1111'),'송현석', '송현석', 'shs@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('879b98', password('1111'),'최현성', '최현성', 'chs@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('xc65v4', password('1111'),'김민지', '김민지', 'kmj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('b31sd5', password('1111'),'이명환', '이명환', 'lmh@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('zb4b5d', password('1111'),'김명환', '김명환', 'kmh@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('z5ds45a', password('1111'),'정구환', '정구환', 'jkh@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('z5cv45e', password('1111'),'이은재', '이은재', 'lej@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('c4v74t', password('1111'),'박수진', '박수진', 'psj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('d87h7h2', password('1111'),'김병철', '김병철', 'kbc@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('z4c4v87', password('1111'),'김병지', '김병지', 'kbj@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0);


-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select 
	QnaNo, UserNo, AdminNo, CategoryNo,
	QnaTitle, QnaContent,QnaDate, QnaReply,ReplyDate,QnaFile
from qna;

insert into qna  values
(1, 00001 , null, 5 , '결제는 언제 되나요?', '결제는 언제 되나요?',now(), '100펀딩에서는 후원 즉시 후원금이 결제되지 않습니다. 후원한 프로젝트가 모금에 성공하면 마감일 다음 날부터 7일 동안 결제에 성공할 때까지 출금이 시도됩니다. 결제일 오전에 카카오톡을 통해 결제에 대한 알림을 드리고 있습니다. ', now(),null),
(2, 00001 , null, 4 , '프로젝트 주요 일정이 어떻게 되나요?', '프로젝트 주요 일정이 어떻게 되나요?',now(), '100펀딩 프로젝트의 주요 일정은 크게 공개예정 기간 - 펀딩 기간 - 결제 기간 - 정산일 - 선물 전달로 진행됩니다. 아래에서 프로젝트의 주요 일정의 설정 가능 기간을 확인해 주세요. ', now(),null);

#default값 null값 제외
insert into qna (UserNo,CategoryNo,QnaTitle,QnaContent)
values
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?');


-- PrjCategory(프로젝트 카테고리)
select * from prjcategory ;

insert into prjcategory (pCategoryName) 
	values('게임'),('공연'),('디자인'),('만화'),('예술'),('공예'),('사진'),('영화(비디오)'),('푸드'),('음악'),('출판'),('테크'),('패션'),('저널리즘');




-- Project(프로젝트) - UserInfo(회원정보) 외래키 받음
select
	PrjNo, UserNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, PayDate, EndYN
from project;




insert into project values(
1, 1,1, '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”', 
'개발에 참여한 4인이 고전에서 느낀 재미 요소들이 상이할 정도로, 여러 매력을 가진 “퍼스트퀸4”의 핵심 재미요소를 충실히 담기 위해 노력하였고, 그를 계승한다는 의미로
“퍼스트”의 앞 글자를 가져왔으며, 인 게임 상 메인 스토리의 진행 요소, 4인의 개발자를 상징하는 중의적 의미를 가진 클로버를 합성해 "퍼스트 클로버" 가 탄생되었습니다.
CLOVER Logo는 뫼비우스의 띠처럼 무한(Eternity)과 공고한 결속의 의미를 가집니다.', 5000000,
'20210701', '20210712','20210712', 0
);

#default값 null값 제외
insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (2,2,'청년들이 모여 1919년 청년들을 재해석하다.',
'청년 단체 피움에서 직접 작업한 연극 <그날의 기록>은
1919년도 3.1 운동의 거점이 된 2.8 독립선언문의 내용으로,
그중에서도 많이 알려지지 못한 여성 운동가를 통해 기록되지 않은
그들의 투쟁과 누릴 수 없었던 삶을 재해석한 작품입니다.
이를 통해 그들의 의지와 열정을 기억하고자 하였고,
그 뜨거운 의지가 현시대를 살아가고 있는 청년들에게 새로운 울림이 되기를 기대합니다.
1919년 당시의 뜨거움을 관객분들에게 전달하기 위해 피움에서는
답사, 역사서적, 토론 등 다양한 방법으로 매 순간 공연의 완성도를 높이고 있습니다.
많은 기대 부탁드립니다.',650000,'20210630','20210713','20210713');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (3,3,'쓰레기도 줄여주고 플라스틱 업사이클까지??',
'버려지는 플라스틱이 쓰레기를 줄이는 제품으로 돌아오다',
1000000,'20210625','20210730','20210730');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (4,6,' <애플머스캣> 그린 퍼퓸',
'청사과는 여름철에 많은 사랑을 받는 과일인데요.
 흐르는 물에 잘 씻어 껍질을 벗기지 않은 채로 한 입 와삭 베어 물면 상큼 달달한 과즙의 향이 퍼집니다.
 일반적인 사과와 달리 청사과는 좀 더 빨리 수확을 하며 여름 제철 과일인 만큼 한여름의 향기를 품고 있습니다.',1000000,'20210630','20210712','20210712');


insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (5,5,'부활 프로젝트 첫번째 이야기,안중근 의사 흉상',
'하나는 기록된 사진이 없어 그들의 업적, 행동을 주로 된 이미지로 기억하는것.
 또 다른 하나는 영웅들의 사진자료가 남아
영웅의 모습(얼굴)을 바탕으로 그들의 업적, 행동을 기억하는 것. 우리는 흉상으로 그분들의 진실한 모습을 부활시키고자 합니다.',
2000000,'20210630','20210730','20210730');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (6,11,'실무자가 알려주는 굿즈 제조업체 500선',
'초보자부터 프로까지 누구나 바로 써먹는 실전 책ㅣ전국 제조 업체, 용어, 단가 총 정리!',
500000,'20210530','20210630','20210630');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
StartDate, EndDate, payDate)
values (1,12,'세상에서 제일 예쁜 인테리어 무선충전기 <게이즈온 포 홈>',
'투박하고 못생긴 무선충전기는 이제 끝, 세.젤.예 인테리어 무선충전기를 만나보세요.',
1500000,'20210702','20210705','20210705');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
StartDate, EndDate, payDate)
values (1,13,'영광의 순간을 위해, 나만 보는 각인링 <월계수 암시반지>',
'승리와 영광의 상징 월계수. 그 안쪽에는 나만 보는 꿈과 목표를 새기는 암시반지입니다.',
500000,'20210701','20210630','20210630');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (2,12,'장난감 같이 쉬운, 저가 국민 3D프린터, 토이프린터',
'누구나 손쉽게 만들어 사용할 수 있는, 이쁘고 귀여운 저가 국민 3D프린터, 토이프린터',
2500000,'20210501','20210530','20210530');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (3,6,'한 잔의 여유에서 피어오르다, 꽃과자기 시온유리잔',
'차가운 온도에서 색이 변하는 시온 유리잔으로 청자와 백자를 모티브로 제작되었습니다.',
1000000,'20210501','20210530','20210530');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (3,9,'사과 한 알이 통째로 퐁당 [한알가득 사과담아]',
'경북 의성의 제철 사과를 통채로 넣었어요. 사과, 깎지 말고 이제는 짜먹으세요!?.',
1000000,'20210701','20210730','20210730');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (4,1,'SF 텍스트 방탈출 게임 <A.I.>',
'인공지능이 관리하는 스마트홈을 탈출하라! 텍스트 기반 모바일 방탈출 게임 <A.I.>!',
1500000,'20210708','20210720','20210720');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (5,6,'당신의 그토록 푸르렀던 여름을 회상하며, <스머징 세트>',
'뜨거운 여름만의 추억, 환상 그리고 기쁨. 여름을 가득 담은 <스머징 세트>를 소개합니다!',
1500000,'20210708','20210725','20210725');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (1,3,'<링컷>으로 페트병 링을 잘라 해양동물을 보호해요!',
'1. 페트병 입구에 링컷의 지렛대를 고정하고 수평을 맞춰주세요.
2. 링컷 머리가 아래로 향하도록 힘을 주세요.
3. 서걱! 링이 잘립니다.',
1500000,'20210713','20210723','20210723');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (3,9,'한 여름의 꾸덕 바!',
'꾸~덕 쫀~득 꾸덕 바! 플레지르 파티쓰리와 달콤 시원한 여름 티타임을 함께 해요!',
1500000,'20210630','20210801','20210801');







-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress, PayYN, EndYN
from fundinginfo;

#default값 null값 제외
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo, ZipCode, Address, DetailAddress)
values (2, 1, 2, '12341234',12345, '대구시 북구', '아파트203호');
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 2, 3, '12341234',12345,'대구시 북구','아파트203호' );
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 1, 4, '12341234' ,12345,'대구시 북구','아파트203호');



insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(16, 1, 1, '212362904', 21661,'경북 구미시','아파트802호' ),
(16, 2, 4, '212362904', 21661,'경북 구미시','아파트802호' ),
(16, 3, 8, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(16, 4, 10, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(16, 8, 22, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(16, 9, 25, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(16, 10, 29, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(16, 11, 31, '9515863234', 98691,'경기도 성남시','모란동' ),
(16, 6, 17, '9515863234', 98691,'경기도 성남시','모란동' ),
(17, 1, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(17, 2, 1, '9515863234', 98691,'경기도 성남시','모란동' ),
(17, 3, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(17, 4, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 5, 3, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 6, 2, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 7, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 9, 3, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 10, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 7, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(18, 8, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(18, 9, 2, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(18, 10, 1,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(18, 11, 2, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(18, 5, 1, '44581243234', 33571,'충북 제천시','75길' ),
(18, 6, 1, '44581243234', 33571,'충북 제천시','75길' ),
(18, 3, 1,'44581243234', 33571,'충북 제천시','75길' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(2, 1, 2, '212362904', 21661,'경북 구미시','아파트802호' ),
(3, 1, 2, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(4, 1, 1, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(5, 1, 2, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(6, 1, 1, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(7, 1, 2, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 1, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(9, 1, 1, '9515863234', 98691,'경기도 성남시','모란동' ),
(10,1, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(11, 1, 1, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 1, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 1, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 1, 2, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 1, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 1, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 1, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 1, 2, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 1, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(20, 1, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(21, 1, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 1, 1,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(23, 1, 2, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(24, 1, 2, '44581243234', 33571,'충북 제천시','75길' ),
(25, 1, 1, '44581243234', 33571,'충북 제천시','75길' ),
(26, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(27, 1, 1,'44581243234', 33571,'충북 제천시','75길' ),
(28, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(29, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(30, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(31, 1, 1,'44581243234', 33571,'충북 제천시','75길' ),
(32, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(33, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(34, 1, 1,'44581243234', 33571,'충북 제천시','75길' ),
(35, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(36, 1, 1,'44581243234', 33571,'충북 제천시','75길' ),
(37, 1, 2,'44581243234', 33571,'충북 제천시','75길' ),
(38, 1, 1,'44581243234', 33571,'충북 제천시','75길' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(1, 2, 3, '212362904', 21661,'경북 구미시','아파트802호' ),
(3, 2, 5, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(4, 2, 3, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(5, 2, 4, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(6, 2, 5, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(7, 2, 3, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 2, 4, '9515863234', 98691,'경기도 성남시','모란동' ),
(9, 2, 5, '9515863234', 98691,'경기도 성남시','모란동' ),
(10,2, 3, '9515863234', 98691,'경기도 성남시','모란동' ),
(11, 2, 4, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 2, 5, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 2, 3, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 2, 4, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 2, 5, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 2, 3, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 2, 4, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 2, 5, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 2, 5, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(20, 3, 6, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(21, 3, 7, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 3, 8,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(23, 3, 6, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(24, 3, 7, '44581243234', 33571,'충북 제천시','75길' ),
(25, 3, 8, '44581243234', 33571,'충북 제천시','75길' ),
(26, 3, 6,'44581243234', 33571,'충북 제천시','75길' ),
(27, 3, 7,'44581243234', 33571,'충북 제천시','75길' ),
(28, 3, 8,'44581243234', 33571,'충북 제천시','75길' ),
(29, 3, 8,'44581243234', 33571,'충북 제천시','75길' ),
(30, 3, 8,'44581243234', 33571,'충북 제천시','75길' ),
(31, 3, 8,'44581243234', 33571,'충북 제천시','75길' ),
(32, 3, 8,'44581243234', 33571,'충북 제천시','75길' ),
(33, 3, 7,'44581243234', 33571,'충북 제천시','75길' ),
(34, 3, 7,'44581243234', 33571,'충북 제천시','75길' ),
(35, 3, 6,'44581243234', 33571,'충북 제천시','75길' ),
(36, 3, 6,'44581243234', 33571,'충북 제천시','75길' ),
(37, 3, 7,'44581243234', 33571,'충북 제천시','75길' ),
(38, 3, 6,'44581243234', 33571,'충북 제천시','75길' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(1, 4, 9, '212362904', 21661,'경북 구미시','아파트802호' ),
(2, 4, 10, '212362904', 21661,'경북 구미시','아파트802호' ),
(3, 4, 11, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(4, 4, 11, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(5, 4, 10, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(6, 4, 9, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(7, 4, 11, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 4, 10, '9515863234', 98691,'경기도 성남시','모란동' ),
(9, 4, 11, '9515863234', 98691,'경기도 성남시','모란동' ),
(10,4, 10, '9515863234', 98691,'경기도 성남시','모란동' ),
(11, 4, 9, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 4, 10, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 4, 11, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 4, 9, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 4, 10, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 4, 11, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 4, 10, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 4, 11, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 4, 10, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(20, 5, 12, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(21, 5, 13, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 5, 14,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(23, 5, 13, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(24, 5, 14, '44581243234', 33571,'충북 제천시','75길' ),
(25, 5, 12, '44581243234', 33571,'충북 제천시','75길' ),
(26, 5, 13,'44581243234', 33571,'충북 제천시','75길' ),
(27, 5, 14,'44581243234', 33571,'충북 제천시','75길' ),
(28, 5, 14,'44581243234', 33571,'충북 제천시','75길' ),
(29, 5, 14,'44581243234', 33571,'충북 제천시','75길' ),
(30, 5, 12,'44581243234', 33571,'충북 제천시','75길' ),
(31, 5, 13,'44581243234', 33571,'충북 제천시','75길' ),
(32, 5, 14,'44581243234', 33571,'충북 제천시','75길' ),
(33, 5, 14,'44581243234', 33571,'충북 제천시','75길' ),
(34, 5, 13,'44581243234', 33571,'충북 제천시','75길' ),
(35, 5, 13,'44581243234', 33571,'충북 제천시','75길' ),
(36, 5, 14,'44581243234', 33571,'충북 제천시','75길' ),
(37, 5, 13,'44581243234', 33571,'충북 제천시','75길' ),
(38, 5, 14,'44581243234', 33571,'충북 제천시','75길' );
insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(1, 6, 15, '212362904', 21661,'경북 구미시','아파트802호' ),
(2, 6, 16, '212362904', 21661,'경북 구미시','아파트802호' ),
(3, 6, 17, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(4, 6, 15, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(5, 6, 16, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(6, 6, 17, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(7, 6, 17, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 6, 16, '9515863234', 98691,'경기도 성남시','모란동' ),
(9, 6, 17, '9515863234', 98691,'경기도 성남시','모란동' ),
(10,6, 15, '9515863234', 98691,'경기도 성남시','모란동' ),
(11, 6, 17, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 6, 16, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 6, 17, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 6, 15, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 6, 17, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 6, 16, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 6, 15, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 6, 15, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 6, 17, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(20, 7, 18, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(21, 7, 19, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 7, 19,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(23, 7, 20, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(24, 7, 20, '44581243234', 33571,'충북 제천시','75길' ),
(25, 7, 19, '44581243234', 33571,'충북 제천시','75길' ),
(26, 7, 20,'44581243234', 33571,'충북 제천시','75길' ),
(27, 7, 18,'44581243234', 33571,'충북 제천시','75길' ),
(28, 7, 19,'44581243234', 33571,'충북 제천시','75길' ),
(29, 7, 20,'44581243234', 33571,'충북 제천시','75길' ),
(30, 7, 19,'44581243234', 33571,'충북 제천시','75길' ),
(31, 7, 20,'44581243234', 33571,'충북 제천시','75길' ),
(32, 7, 18,'44581243234', 33571,'충북 제천시','75길' ),
(33, 7, 19,'44581243234', 33571,'충북 제천시','75길' ),
(34, 7, 20,'44581243234', 33571,'충북 제천시','75길' ),
(35, 7, 19,'44581243234', 33571,'충북 제천시','75길' ),
(36, 7, 20,'44581243234', 33571,'충북 제천시','75길' ),
(37, 7, 19,'44581243234', 33571,'충북 제천시','75길' ),
(38, 7, 18,'44581243234', 33571,'충북 제천시','75길' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(1, 8, 21, '212362904', 21661,'경북 구미시','아파트802호' ),
(2, 8, 22, '212362904', 21661,'경북 구미시','아파트802호' ),
(3, 8, 23, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(4, 8, 23, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(5, 8, 22, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(6, 8, 23, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(7, 8, 21, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 8, 22, '9515863234', 98691,'경기도 성남시','모란동' ),
(9, 8, 23, '9515863234', 98691,'경기도 성남시','모란동' ),
(10,8, 21, '9515863234', 98691,'경기도 성남시','모란동' ),
(11, 8, 22, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 8, 24, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 8, 21, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 8, 23, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 8, 21, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 8, 24, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 8, 24, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 8, 23, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 8, 24, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(20, 9, 24, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(21, 9, 25, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 9, 26,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(23, 9, 27, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(24, 9, 26, '44581243234', 33571,'충북 제천시','75길' ),
(25, 9, 26, '44581243234', 33571,'충북 제천시','75길' ),
(29, 9, 27,'44581243234', 33571,'충북 제천시','75길' ),
(30, 9, 26,'44581243234', 33571,'충북 제천시','75길' ),
(32, 9, 25,'44581243234', 33571,'충북 제천시','75길' ),
(33, 9, 26,'44581243234', 33571,'충북 제천시','75길' ),
(37, 9, 27,'44581243234', 33571,'충북 제천시','75길' ),
(38, 9, 27,'44581243234', 33571,'충북 제천시','75길' );
insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(1, 10, 28, '212362904', 21661,'경북 구미시','아파트802호' ),
(2, 10, 29, '212362904', 21661,'경북 구미시','아파트802호' ),
(7, 10, 28, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 10, 29, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 10, 29, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 10, 28, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 10, 29, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 10, 30, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 10, 29, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 10, 30, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(18, 10, 28, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 10, 29, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(20, 11, 31, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(21, 11, 31, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 11, 32,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(23, 11, 32, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(24, 11, 33, '44581243234', 33571,'충북 제천시','75길' ),
(25, 11, 32, '44581243234', 33571,'충북 제천시','75길' ),
(26, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(27, 11, 32,'44581243234', 33571,'충북 제천시','75길' ),
(28, 11, 31,'44581243234', 33571,'충북 제천시','75길' ),
(29, 11, 32,'44581243234', 33571,'충북 제천시','75길' ),
(30, 11, 32,'44581243234', 33571,'충북 제천시','75길' ),
(31, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(32, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(33, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(34, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(35, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(36, 11, 33,'44581243234', 33571,'충북 제천시','75길' ),
(37, 11, 32,'44581243234', 33571,'충북 제천시','75길' ),
(6, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(10, 12, 35,'44581243234', 33571,'충북 제천시','75길' ),
(13, 12, 36,'44581243234', 33571,'충북 제천시','75길' ),
(15, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(14, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(18, 12, 36,'44581243234', 33571,'충북 제천시','75길' ),
(20, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(23, 12, 35,'44581243234', 33571,'충북 제천시','75길' ),
(24, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(26, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(28, 12, 35,'44581243234', 33571,'충북 제천시','75길' ),
(30, 12, 36,'44581243234', 33571,'충북 제천시','75길' ),
(33, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(35, 12, 34,'44581243234', 33571,'충북 제천시','75길' ),
(38, 11, 31,'44581243234', 33571,'충북 제천시','75길' );


insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(1, 13, 37, '212362904', 21661,'경북 구미시','아파트802호' ),
(2, 13, 38, '212362904', 21661,'경북 구미시','아파트802호' ),
(7, 13, 39, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(8, 13, 38, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 13, 37, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 13, 38, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 13, 37, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 13, 37, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 13, 37, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 13, 37, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(23, 13, 39, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(25, 13, 37, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(31, 13, 38, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(34, 13, 38, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(35, 13, 37,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(37, 13, 37, '8441243234', 22686,'전라북도 전주시','한옥동 89길' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(2, 14, 40, '212362904', 21661,'경북 구미시','아파트802호' ),
(4, 14, 40, '212362904', 21661,'경북 구미시','아파트802호' ),
(3, 14, 40, '212362904', 21661,'경북 구미시','아파트802호' ),
(7, 14, 40, '212362904', 21661,'경북 구미시','아파트802호' ),
(5, 14, 40, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(6, 14, 40, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 14, 41, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 14, 41, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 14, 41, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(15, 14, 41, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(16, 14, 41, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(17, 14, 41, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(23, 14, 42, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(25, 14, 42, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(31, 14, 42, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(34, 14, 42, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(35, 14, 42,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(37, 14, 42, '8441243234', 22686,'전라북도 전주시','한옥동 89길' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(2, 15, 43, '212362904', 21661,'경북 구미시','아파트802호' ),
(8, 15, 43, '212362904', 21661,'경북 구미시','아파트802호' ),
(9, 15, 43, '212362904', 21661,'경북 구미시','아파트802호' ),
(10, 15, 44, '212362904', 21661,'경북 구미시','아파트802호' ),
(11, 15, 43, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(14, 15, 43, '9515863234', 98691,'경기도 성남시','모란동' ),
(17, 15, 44, '9515863234', 98691,'경기도 성남시','모란동' ),
(18, 15, 44, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(19, 15, 44, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(20, 15, 44, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(25, 15, 45, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(26, 15, 45, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(29, 15, 45, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(30, 15, 45, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(35, 15, 45, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(37, 15, 45, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(38, 15, 45,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(22, 15, 45, '8441243234', 22686,'전라북도 전주시','한옥동 89길' );

-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
	OptNo, PrjNo, OptName, OptPrice, OptContent
from prjoption;



-- default값 null값 제외





insert into prjoption (prjno, OptName, OptPrice,OptContent)
values (1, '골드세트', 100000, '골드 50개 + 고급장비 상자');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (1,'다이아세트', 150000, '다이아 50개 + 고급장비 상자 + 한정 캐릭터 1종');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (2,'방구석 1열', 15000, 'USB로 공연영상 제공');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (2,'방구석 1열', 22000, 'USB로 공연영상 제공 / 그날의 기록 제작 이야기가 담긴 책');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (2,'방구석 1열', 35000, 'USB로 공연영상 제공/그날의기록 제작 이야기가 담긴 책/그날의기록노트');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (3,'얼리버드E', 18000, '마스크훅3개');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (3,'얼리버드F', 25000, '마스크훅3개+업사이클립2개');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (3,'얼리버드G', 51000, '마스크훅3개+업사이클립2개+뚜밴커터2개');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (4,'애플머스캣 EDP 30ml', 40000, '애플머스캣 EDP 30ml');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (4,'애플머스캣 EDP 30ml*2', 75000, '애플머스캣 EDP 30ml*2');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (4,'애플머스캣 EDP 30ml*3', 110000, '애플머스캣 EDP 30ml*3');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (5,'안중근 흉상 A세트+배송비무료', 40000, '안중근 흉상 A(1번형) + 안중근 흉상 A 전용 고급 케이스');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (5,'안중근 흉상 B세트+배송비무료', 75000, '안중근 흉상B(2번형) + 안중근 흉상 B 전용 고급 케이스');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (5,'안중근 흉상 C세트+배송비무료', 110000, '안중근 흉상 C(3번형) + 안중근 흉상 C 전용 고급 케이스');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (6,'[얼리버드] PDF 생활용품편 1권', 30000, '<제조백과 500> 생활용품편 (PDF) ( x 1 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (6,'PDF 문구편+생활용품편 SET', 35000, '<제조백과 500> 문구편 + 생활용품편 (PDF) ( x 1 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (6,'실물책 문구편+생활용품편 SET (배송비 포함)', 40000, '<제조백과 500> 문구편 + 생활용품편 (실물책) ( x 1 )');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (7,'옵션A', 30000, '게이즈온 포 홈 USB-C 골드 케이블 ');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (7,'옵션B', 50000, '게이즈온 포 홈 마블 스탠드 무선충전기');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (7,'옵션C', 100000, '게이즈온 포 홈 마블 스탠드 무선충전기 + 게이즈온 포 홈 화이트 마블 패드 무선충전기 + 게이즈온 포 홈 USB-C 골드 케이블 ');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'basic - 기본세트', 30000, '월계수 암시반지 - basic');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'bicolor - 기본세트', 50000, '월계수 암시반지 - bicolor');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'basic - 커플세트', 100000, '월계수 암시반지 - basic*2');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'bicolor - 커플세트', 100000, '월계수 암시반지 - bicolor*2');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (9,'토이프린터 조립키트  x1', 300000, '토이프린터,투명(x1) + 토이프린터,국산(x1)');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (9,'토이프린터 조립키트  x2', 550000, '토이프린터,투명(x2) + 토이프린터,국산(x2)');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (9,'토이프린터 조립키트  x3', 800000, '토이프린터,투명(x3) + 토이프린터,국산(x3)');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (10,'혼술이 최고', 30000, '꽃과 자기 시온유리잔(x1)');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (10,'나눠 마실까', 55000, '꽃과 자기 시온유리잔(x2)');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (10,'꽃받침 함께', 90000, '꽃과 자기 시온유리잔(x2) + 꽃무늬 코스터(x2)');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (11,'홀로 사과담아 (1박스) ', 30000, '사과담아 1박스 (30개입) (x1)');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (11,'커플 사과담아 (2박스)', 55000, '사과담아 1박스 (30개입) (x2)');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (11,'패밀리 사과담아 (4박스)', 90000, '사과담아 1박스 (30개입) (x4)');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (12,'A set', 30000, '<A.I>게임');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (12,'B set', 55000, '<A.I>게임 + 게임 아이템');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (12,'C set', 90000, '<A.I>게임 + 게임 아이템 + 엔딩크레딧 기재');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (13,'스머지 스틱 세트', 30000, '스머징 플레이트 + 스머지 스틱 + 메뉴얼 엽서');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (13,'스머지 차콜 세트', 50000, '스머징 플레이트 + 허브믹스 set + 스머징 숯 + 메뉴얼 엽서');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (13,'스머징 풀 세트', 80000, '스머징 플레이트 + 허브믹스 set + 스머징 숯 + 자갈 주머니 + 메뉴얼 엽서');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (14,'링컷 패키지 ( x 1 )', 30000, '링컷 패키지 ( x 1 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (14,'링컷 패키지 ( x 2 )', 50000, '링컷 패키지 ( x 2 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (14,'링컷 패키지 ( x 3 )', 80000, '링컷 패키지 ( x 3 )');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (15,'꾸덕바 ( x 1 )', 40000, '꾸덕바 5종 ( x 1 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (15,'꾸덕바 ( x 2 )', 70000, '꾸덕바 5종 ( x 2 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (15,'꾸덕바 ( x 3 )', 90000, '꾸덕바 5종 ( x 3 )');





-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
select 
	PostNo, PrjNo, UserNo,
	PostContent ,PostDate ,PostFile, FileName  	
from prjboard;

insert into prjboard values
(00001, 00001, 00003, '고생들했어요', now(), null, null );
#default값 null값 제외
insert into prjboard (PrjNo, UserNo, PostContent,PostDate ,PostFile, FileName )
values
(2, 3, '고생들했어요', now(), null, null),
(4, 3, '고생들했어요', now(), null, null),
(5, 3, '고생들했어요', now(), null, null),
(1, 2, '잘되고있어요', now(), null, null),
(3, 2, '잘되고있어요', now(), null, null),
(4, 2, '잘되고있어요', now(), null, null),
(5, 2, '잘되고있어요', now(), null, null),
(1, 4, '응원합니다. 화이팅!', now(), null, null),
(2, 4, '응원합니다. 화이팅!', now(), null, null);


-- PrjBoardReply(프로젝트게시판답글)
select * from PrjBoard;
select ReplyNo, PostNo, UserNo, ReplyContent from PrjBoardReply;
insert into PrjBoardReply(PostNo, UserNo, ReplyContent)
values
(1, 1, "안녕하세요"),
(1, 2, "안녕하세요"),
(5, 3, "안녕하세요"),
(5, 4, "안녕하세요");





