[오라클 함수]

-- 가상테이블 : dual

1. 문자열
select lower('Hello World') from dual; --소문자
select upper('Hello World') from dual; --대문자
select length('Hello World') from dual; --글자갯수
select substr('Hello World',1,5) from dual; --문자열 자르기

select instr('Hello World','W') from dual; --글자 순서위치
select lpad('SKY',5,'*') from dual;  -- 왼쪽에 문자 추가
select rpad('SKY',5,'*') from dual;  -- 오른쪽에 문자 추가
select replace('happy','p','k') from dual; --특정문자 변경

select chr(65) from dual; --A
select chr(66) from dual; --B
select chr(97) from dual; --a
select chr(98) from dual; --b

-- 문자열 연결하기
select concat('로미오', '줄리엣') from dual;

--concat (칼럼명, '문자열')
select concat(uname, '의 평균은'), concat(aver, '입니다') from sungjuk;
select concat(uname, '의 평균은') as 이름, concat(aver, '입니다') as 평균 from sungjuk;

select uname || '의 평균은 ' || aver || '입니다' from sungjuk;

2. 숫자
select abs(-7) from dual; --절대값
select mod(5,3) from dual; --나머지함수
select ceil(12.546) from dual; --올림함수
select trunc(13.543, 1) from dual; --내림함수

select avg(kor) from sungjuk;  
select ceil(avg(kor)) from sungjuk;
select trunc(avg(kor), 2) from sungjuk;
select round(avg(kor), 1) from sungjuk;


select to_number('123')+1 from dual;
select '123'+1 from dual;

3. 날짜
select sysdate from dual;

select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate) from dual;

select sysdate+100 from dual;
select sysdate-100 from dual;

select months_between('2025-01-05', '2021-01-06') from dual;

-- 문자열을 날짜형으로 변환
select to_date('2023-02-27') from dual;
select to_date('2023-02-27') - to_date('2023-05-30') from dual;

-- 주소가 'Incheon'인 행의 국어점수 최대값, 인원수를 조회하시오.
select max(kor), count(*)
from sungjuk
where addr = 'Incheon';


select count(*)+1     --0+1=1
from sungjuk
where addr='Inchoen';

select max(kor) + 1  -- null 값과 1의 값은 연산이 불가능하다
from sungjuk
where addr='Incheon';

select nvl(max(kor),0) + 1
from sungjuk
where addr='Incheon';

select nvl(max(kor),0) + 1 as max_kor
from sungjuk
where addr='Incheon';

select * from sungjuk order by sno;

문제) sungjuk테이블에 아래 데이터를 행추가 하시오
sno   : max(sno)+1
        단, max()값이 null이면 0으로 바꾼후 계산한다
uname : 손흥민
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate;

select nvl(max(sno),0)+1 from sungjuk;

insert into sungjuk (sno, uname, kor, eng, mat, addr, wdate)
values (
(select nvl(max(sno),0)+1 from sungjuk), 
'손흥민'
, 100
, 100
, 100
, 'Seoul'
, sysdate);

delete from sungjuk where sno=12;

commit;
