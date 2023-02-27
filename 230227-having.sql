[having 조건절]

group by 와 같이 사용하는 조건절
그룹화를 하고 난 후 조건절을 추가

where having on

select addr, count(*) as cnt
from sungjuk
group by addr;

--주소별 인원수를 조회하시오
select addr, count(*)
from sungjuk
group by addr;

--주소별 인원수가 3인 행을 조회하시오
select addr, count(*) as cnt
from sungjuk
group by addr
having count(*)=3;

-- 주소별 인원수가 3 이상인 행을 조회
select addr, count(*) as cnt
from sungjuk
group by addr
having count(*)>=3;

-- 주소별 국어평균값이 50이상 행 조회
-- 단 평균값은 소수점 없이 반올림
select * from sungjuk;

select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

select addr
        , round(avg(kor),0) as avg_kor
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

-- 평균이 70이상 행을 대상으로 주소별 인원수 구함
-- 인원수가 2미만 행을 인원수 순으로 조회
1) 전체 행 조회
select * from sungjuk order by aver desc;
2) 평균 값이 70이상 행 조회
select *
from sungjuk
where aver>=70;
3) 주소별 인원수를 구하시오
select addr, count(*)
from sungjuk
where aver>=70
group by addr
4) 인원수 2미만
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;
5) 인원수 순으로 조회
select addr, count(*) as cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by cnt;
