drop table sungjuk;

create table sungjuk (
 uname VARCHAR(50)  not null    -- 빈 값을 허용하지 않음
                                           -- 영문자 50글자 이내에서 입력
                                           -- 2바이트 3바이트
                                           -- 한글 16글자 이내 입력
 ,kor       int              not null    -- 정수형
 ,eng       int              not null    
 ,mat        int              not null    
 ,tot       int              null           -- 빈 값 허용
 ,aver        int                           -- null 생략 가능
);

/////////////////////////////////////////////////////////////////////////////

[샘플 데이터 행 추가]
insert into sungjuk(uname,kor,eng,mat) values ('홍길동', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);

[전체 레코드 조회]

select uname, kor, eng, mat, tot, aver
from sungjuk;

[전체 행 갯수 조회]

select count(*) from sungjuk;

[select 조회 및 검색]

select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk;

[as] --칼럼명을 임시 변경

select kor as korea, eng as english, mat as math
from sungjuk;

-- as 생략 가능

select kor korea, eng english, mat mate
from sungjuk;

--임시 한글 칼럼명은 일시적으로 분석해야 하는 경우에만 추천
select uname 이름, kor 국어, eng 영어, mat 수학, tot 총점, aver 평균
from sungjuk;

--칼럼의 순서는 의미가 없다
select uname, kor, eng, mat from sungjuk;
select kor, eng, mat from sungjuk;

[count 함수] - 행 갯수 조회

select count(uname) from sungjuk;
select count(kor) from sungjuk;
select count(eng) from sungjuk;
select count(mat) from sungjuk;

select count(tot) from sungjuk;
select count(aver) from sungjuk;

select count(eng) as cnt_eng from sungjuk;
select count(mat) as 수학갯수 from sungjuk;


-- sungjuk 테이블의 전체 행의 갯수
select count(*) from sungjuk;
select count(*) as 전체행갯수 from sungjuk;
select count(*) 전체 행 갯수 from sungjuk;