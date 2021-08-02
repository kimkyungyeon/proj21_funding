-- 리스트에서 프로젝트를 클릭했을 때 판매자 정보와 함께 select
select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
			StartDate, EndDate,	PayDate, EndYN, u.UserId , u.UserName 
from project p 
join userinfo u on p.userno = u.UserNo		   
join prjoption o on p.PrjNo =o.PrjNo 
			where p.PrjNo =1;
		select * from project;
select * from fundinginfo f ;
select * from prjoption o ;
select * from userinfo u2 ;
select * from userinfo o where Secession is null  or Secession is false;
select * from userinfo where BankAccount is not null and BankName is not null;

update userInfo set Secession = true where userno=3;
	select * from fundinginfo;

-- 프로젝트별 인원수, 가격
select count(*),sum(optprice) 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo where f.prjno = 1;

select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
			StartDate, EndDate,	PayDate, EndYN, u.UserId , u.UserName,
			o.OptNo, o.OptPrice,o.OptContent
			from project p join userinfo u on p.userno = u.UserNo
						   join prjoption o on p.PrjNo =o.PrjNo 
			where o.prjNo = 1;



-- 80%넘은 성공임박프로젝트  
select p.prjno, p.userno, p.prjname, p.prjcontent, p.startdate, p.enddate,p.PayDate ,u.UserId , u.UserName ,
sum(optprice), p.PrjGoal,sum(optprice)/PrjGoal*100 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo 
join project p on o.prjno = p.PrjNo 
join userinfo u on u.userno = p.userno
group by o.PrjNo having sum(optprice)/PrjGoal*100>80;


-- 번호별 
select o.prjNo ,count(*),sum(optprice) 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo group by o.prjNo;

-- 성공임박프로젝트
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		 group by p.prjNo having sum(optprice)/PrjGoal*100>80;

		
-- 프로젝트명 검색
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where prjName like '%기%'
		 group by p.prjNo;

-- 제작자 검색
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where u.Nickname LIKE CONCAT('%', 'ks' , '%');
		 group by p.prjNo;


-- 옵션번호로 관련프로젝트정보
select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
				StartDate, EndDate, PayDate, EndYN, u.UserId , u.UserName,u.nickname,u.userPhone,
				o.OptNo, o.OptPrice,o.OptContent,o.optName
			from project p join userinfo u on p.userno = u.UserNo 
						   join prjoption o on p.PrjNo =o.PrjNo
			where o.optNo = 6;
			
select * from admin;

select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;

select * from prjoption o join fundinginfo f on o.optno = f.optNo;
		
select o.optno,o.prjno from prjoption o left join fundinginfo f on o.optno = f.optNo group by f.optno having o.prjno=1;

select ifnull(count(f.optno),0),o.optno,p.prjno from prjoption o join fundinginfo f on o.optno = f.optNo
                                                right join project p on f.prjno = p.prjno group by f.optno having p.prjno = 1;
                                               
                                               
select ifnull(sum(optprice),0) as totalprice, ifnull(count(fundingno),0) as totalcount , ifnull(count(distinct (p.prjNo)),0) as prjno
from project p left join fundinginfo f on p.prjno = f.prjno
			   left	join prjoption o on o.optno = f.optno; 
			  
select * from fundinginfo f join prjoption o on f.optno = o.optno where f.prjno = 2;


select f.prjNo,f.FundingNo ,p.PrjName ,o.optname, o.OptContent, 
				o.optprice,p.StartDate , p.EndDate , p.PayDate , p.EndYN ,f.PayYN
		  from fundinginfo f join project p on f.PrjNo = p.PrjNo join prjoption o on f.OptNo = o.OptNo
		 where f.userno = 2 order by f.fundingno desc;
		 
select count(*)  from fundinginfo where userno=2 and payyn=0;


select r1.prjno from (select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname,p.prjContent, p.prjgoal, u.nickname as prjManager,u.userName as managerName
			,count(fundingno) as totalCount, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		 group by p.prjNo
		 ) as r1
where rate>100;

update project set EndDate ='20210630' where PrjNo =6;
update fundinginfo set payyn =0 where prjno=6;
			
update fundinginfo f join project p on f.prjno = p.prjno 
 set f.payYn = 1
 where f.prjNo in ( select r1.prjno from (select p.prjno, p.Prjname,p.prjgoal, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		 group by p.prjNo
		 ) as r1
where rate>=100) and (payyn=0 or payyn is null) and p.endDate <now();


 select * from userinfo;
 select * from project;

select count(r1.prjno) from	(select p.endDate, p.prjno,p.prjname,u.Nickname as prjManager,c.pcategoryno
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo 
	having 1=1
			 ) as r1
			 
-- 주목할만한 프로젝트 top4	 
select p.prjno,
			 if(sum(optPrice)>0,sum(optPrice),0) as totalPrice,
			  p.Prjname,
			  p.prjgoal,
			  u.nickname as prjManager
			,count(fundingno) as totalCount,
			prjContent,
			 c.pcategoryno,
			  c.pcategoryname,
			   startDate,
			    endDate,
			     ifnull(round(sum(optprice)/prjgoal*100,2),0) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo having enddate > now() order by rate desc limit 4;

-- 성공 임박 프로젝트 탑 4
select p.prjno,
			 if(sum(optPrice)>0,sum(optPrice),0) as totalPrice,
			  p.Prjname,
			  p.prjgoal,
			  u.nickname as prjManager
			,count(fundingno) as totalCount,
			prjContent,
			 c.pcategoryno,
			  c.pcategoryname,
			   startDate,
			    endDate,
			     ifnull(round(sum(optprice)/prjgoal*100,2),0) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo having rate < 100 and enddate > now() order by rate desc limit 4;
		 
select p.prjno,
			 if(sum(optPrice)>0,sum(optPrice),0) as totalPrice,
			  p.Prjname,
			  p.prjgoal,
			  u.nickname as prjManager
			,count(fundingno) as totalCount,
			prjContent,
			 c.pcategoryno,
			  c.pcategoryname,
			   startDate,
			    endDate,
			     ifnull(round(sum(optprice)/prjgoal*100,2),0) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo having enddate > now() order by enddate asc;

		

-- 차트 
select date_format(p.EndDate,'%Y년 %m월') as period , count(fundingno) as count1, sum(o.OptPrice) as sum1 from fundinginfo f join project p on f.PrjNo = p.prjno
							join prjoption o on f.OptNo = o.OptNo group by period;
							
select * from project;

-- 프로젝트별 매출액 랭킹
select p.prjno,
			 if(sum(optPrice)>0,sum(optPrice),0) as totalPrice,
			  p.Prjname,
			  p.prjgoal,
			  u.nickname as prjManager
			,count(fundingno) as totalCount,
			prjContent,
			 c.pcategoryno,
			  c.pcategoryname,
			   startDate,
			    endDate,
			    f.payyn,
				ifnull(round(sum(optprice)/prjgoal*100,2),0) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo having rate >100 and f.payyn = 1 order by totalprice desc limit 5;
		

		 
-- 회원별 후원횟수 랭킹
select count(f.userno) as totalCount ,u.nickname as sponsor,f.payyn
  from fundinginfo f join userinfo u on f.userno = u.UserNo 
<<<<<<< HEAD
  group by f.userNo order by totalcount desc limit 5;

 
 select p.prjno,
			 if(sum(optPrice)>0,sum(optPrice),0) as totalPrice,
			  p.Prjname,
			  p.userNo,
			  p.prjgoal,
			  u.nickname as prjManager
			,count(fundingno) as totalCount,
			prjContent,
			 c.pcategoryno,
			  c.pcategoryname,
			   startDate,
			    endDate,
				ifnull(round(sum(optprice)/prjgoal*100,2),0) as rate
		  from fundinginfo f 
	      join prjoption op on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo having p.UserNo =1;
  group by f.userNo  having f.payyn = 1 order by totalcount desc limit 5;

 select date_format(p.EndDate,'%Y년 %m월') as period ,
			count(fundingno) as count1,
			sum(o.OptPrice) as sum1
		from (select * from fundinginfo where payyn = 1) f join project p on f.PrjNo = p.prjno
		join prjoption o on f.OptNo = o.OptNo
		group by period;
		

update project set enddate = '20210712' where prjno=1;


delete from project where prjno = 1;
select * from prjoption;

select count(f.userno) as totalCount , u.nickname as fundingUserName, u.userId as fundingUser
	  from (select * from fundinginfo where payyn = 1) f join userinfo u on f.userno = u.UserNo 
	  group by f.userNo order by totalcount desc limit 5;
	  
	 select date_format(p.EndDate,'%Y년 %m월') as period ,
			count(fundingno) as count1,
			sum(o.OptPrice) as sum1
		from (select * from fundinginfo where payyn = 1) f join project p on f.PrjNo = p.prjno
		join prjoption o on f.OptNo = o.OptNo
		group by period;