-- 결제완료한 프로젝트 수
select count(*),userNo  from fundinginfo where payyn=0 group by userno;

select * from userinfo;
select * from fundinginfo;
-- 결제완료한 총금액,펀딩 수
select u.userno,count(fundingno) as totalCount, if(sum(optprice)>0,sum(optprice),0) as totalPrice
from userinfo u left join fundinginfo f on f.userno = u.userno 
left join prjoption o on f.optno = o.optno
group by u.userno;

-- 샘플
select if(sum(optprice)>0,sum(optprice),0) as achieve,
		prjgoal as prjgoal,
		p.userno as userno, p.prjno as prjno
		from project p 
		left join fundinginfo f on p.prjno = f.prjno 
		left join prjoption o on f.optno = o.optno group by p.prjno
		
select if(isnull(sum(optprice)),0,sum(optprice)) as achieve, prjgoal, p.userno , p.prjno 
		from project p 
		left join fundinginfo f on p.prjno = f.prjno 
		left join prjoption o on f.optno = o.optno group by p.prjno having (achieve >prjgoal or achieve <=prjgoal);

-- 회원별 성공프로젝트수
select u.userno, count(prjno) as totalCount 
from userinfo u  left join
(select if(isnull(sum(optprice)),0,sum(optprice)) as achieve, prjgoal, p.userno , p.prjno 
		from project p 
		left join fundinginfo f on p.prjno = f.prjno 
		left join prjoption o on f.optno = o.optno group by p.prjno having (achieve >prjgoal))as a 
	on u.userno = a.userno group by u.userno;

select if(isnull(sum(optprice)),0,sum(optprice)) as achieve, prjgoal, p.userno , p.prjno ,f.PayYN 
		from project p 
		left join fundinginfo f on p.prjno = f.prjno 
		left join prjoption o on f.optno = o.optno group by p.prjno having (achieve >prjgoal)

-- 제작한 프로젝트수
select count(p.prjno),u.userno
from project p right join userinfo u on p.userno = u.userno 
group by u.userno; 


-- 인라인뷰 써서 
select count(prjno),u.userno,prjgoal,achieve from 
(select if(sum(optprice)>0,sum(optprice),0) as achieve,
		prjgoal as prjgoal,
		p.userno as userno, p.prjno as prjno
		from project p 
		left join fundinginfo f on p.prjno = f.prjno 
		left join prjoption o on f.optno = o.optno group by p.prjno) a right join userinfo u 
		on a.userno = u.userno group by u.userno;