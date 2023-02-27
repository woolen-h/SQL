select * from sungjuk order by uname;

select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt  -- 칼럼명 임시 부여
from sungjuk
group by addr;

select addr, count(*) cnt -- as 생략 가능
from sungjuk
group by addr;

-- 주소별 오름차순 정렬해서 조회
select addr
from sungjuk
group by addr
order by addr; -- asc 생략 가능

-- 주소별 내림차순 정렬해서 조회
select addr
from sungjuk
group by addr
order by addr desc;

-- 주소별 인원수를 내림차순 정렬해서 조회
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt    -- 해석순서 3
from sungjuk                    -- 해석순서 1
group by addr                   -- 해석순서 2
order by cnt desc;               -- 해석순서 4

DROP table sungjuk;

commit;


[집계함수]

--문2) 주소별 국어점수에 대해서 집계하시오
select addr, count(*), max(kor), min(kor), sum(kor),  avg(kor)  --갯수, 최대값, 최소값, 합계, 평균
from sungjuk
group by addr;

-- 주소순으로 정렬
select addr, count(*), max(kor), min(kor), sum(kor),  avg(kor)  
from sungjuk
group by addr
order by addr;

--round(값, 0) ceil floor 소수점 이하 값에서 반올림을 하고 소수점은 없음
select addr, count(*), max(kor), min(kor), sum(kor),  round(avg(kor), 0)
from sungjuk
group by addr
order by addr;

-- 국어 평균을 소수점 없이 반올림하고 내림차순 정렬해서 조회
select addr, count(*), max(kor), min(kor), sum(kor),  round(avg(kor), 0)
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

-- 칼럼명 부여
select addr
, count(*) as cnt
, max(kor) as max_kor
, min(kor) as min_kor
, sum(kor) as sum_kor
,  round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

--  총점, 평균을 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
commit;
select * from sungjuk;

-- 평균이 80점 이상 행을 대상으로 주소별 인원수를 인원수 순으로 조회하시오
select * from sungjuk order by aver desc, addr;

select addr
from sungjuk
where aver>=80
group by addr;

select addr, count(*)
from sungjuk
where aver>=80
group by addr;

select addr, count(*)
from sungjuk
where aver>=80
group by addr
order by count(*);

[2차 그룹]

--주소별 순으로 조회
select addr, kor, eng, mat
from sungjuk
order by addr, kor;

--주소별 (1차) 그룹, 주소가 같다면 국어점수별(2차) 그룹
select addr, kor
from sungjuk
group by addr, kor
order by addr;

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

-- 1차 kor 2차 eng 3차 mat
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;