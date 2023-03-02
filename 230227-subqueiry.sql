<<<<<<< HEAD
[서브쿼리]
- SQL문 속 또 다른 SQL
- 테이블 내에서 쿼리문에 의해 행 조회 및 검색

--국어 점수의 평균을 조회하시오
select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk;
select round(avg(kor), 0) as avg_kor from sungjuk;


--국어 점수 평균보다 잘 한 국어 점수를 조회하시오
select round(avg(kor), 0) as avg_kor from sungjuk;
select uname, kor from sungjuk where kor >=66;
select uname, kor from sungjuk where kor >=(select round(avg(kor),0) from sungjuk);

--문2) 서울지역의 국어점수 평균보다 잘한 지역, 이름, 국어점수를 조회하시오
select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul');


--문3) 서울지역의 국어점수 평균보다 잘한 국어점수가 다른 지역에 있는지 조회하시오
select uname, addr, kor
from sungjuk
where addr 
not in('Seoul') 
and kor>(
select round(avg(kor),0) 
from sungjuk 
where addr = 'Seoul'
);

select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul')
and addr<>'Seoul';

--문4) 국어점수의 최소값보다 이하 점수가 수학 또는 영어점수에 있는지 조회하시오
select uname, mat, eng from sungjuk
where mat<=(select min(kor) from sungjuk) 
=======
[서브쿼리]
- SQL문 속 또 다른 SQL
- 테이블 내에서 쿼리문에 의해 행 조회 및 검색

--국어 점수의 평균을 조회하시오
select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk;
select round(avg(kor), 0) as avg_kor from sungjuk;


--국어 점수 평균보다 잘 한 국어 점수를 조회하시오
select round(avg(kor), 0) as avg_kor from sungjuk;
select uname, kor from sungjuk where kor >=66;
select uname, kor from sungjuk where kor >=(select round(avg(kor),0) from sungjuk);

--문2) 서울지역의 국어점수 평균보다 잘한 지역, 이름, 국어점수를 조회하시오
select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul');


--문3) 서울지역의 국어점수 평균보다 잘한 국어점수가 다른 지역에 있는지 조회하시오
select uname, addr, kor
from sungjuk
where addr 
not in('Seoul') 
and kor>(
select round(avg(kor),0) 
from sungjuk 
where addr = 'Seoul'
);

select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul')
and addr<>'Seoul';

--문4) 국어점수의 최소값보다 이하 점수가 수학 또는 영어점수에 있는지 조회하시오
select uname, mat, eng from sungjuk
where mat<=(select min(kor) from sungjuk) 
>>>>>>> 550dc26ea696050eff62c6ac29d3f96a21ee13a2
or eng<=(select min(kor) from sungjuk);