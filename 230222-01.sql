-- 테이블 생성
create table sungjuk (
uname varchar(20),
kor int,
eng int,
mat int,
aver int
);
-- 테이블 삭제
drop table sungjuk;

-- 행 추가
1. 행 추가
insert into sungjuk (uname, kor, eng, mat)
values('무궁화', 80, 85, 100);

insert into sungjuk (uname, kor, eng, mat)
values('홍길동', 90, 100, 50);
2. 조회 및 검색
select uname, kor, eng, mat, aver
from sungjuk;

3. 행 수정
update sungjuk
set aver=(kor+eng+mat)/3;
4. 행 삭제
delete from sungjuk;



-- 조회