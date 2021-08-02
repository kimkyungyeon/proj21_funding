select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;

		
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname, endDate, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;
		
-- 프로젝트별 후원자 리스트
select fundingno,prjName,f.optNo,optPrice, u.username ,u.nickname
	from userinfo u left join fundinginfo f on u.userno = f.userno
					join project p on p.prjno = f.PrjNo 
					join prjoption o on o.optno= f.optno where p.prjNo= 1;
				
				
				
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager,u.userName as managerName
			,count(fundingno) as totalCount, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where p.prjNo =1
		 group by p.prjNo;

-- 
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount,prjContent, c.pcategoryno, c.pcategoryname, startDate, endDate, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		  group by p.prjNo having rate>100;

select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount,prjContent, c.pcategoryno, c.pcategoryname, startDate, endDate, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;
		 
select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
				StartDate, EndDate, PayDate, EndYN, u.UserId , u.UserName,u.nickname,
				o.OptNo, o.OptPrice,o.OptContent,o.optName
			from project p join userinfo u on p.userno = u.UserNo 
						   join prjoption o on p.PrjNo =o.PrjNo
			where p.prjNO = 1

			
		
select * from prjoption  where prjno =4;

select count(R1.prjno) from (select p.prjno as prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount,prjContent, c.pcategoryno, c.pcategoryname, startDate, endDate, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo having (rate >= 100))as r1;