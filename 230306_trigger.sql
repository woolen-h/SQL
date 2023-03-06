[트리거 trigger]
-- 콘솔창 출력 dbms_output.put_line 을 사용함
set serveroutput on;

////////////////////////
-- 연습 sungjuk테이블에서 국어점수의 평균
select avg(kor) from sungjuk;

-- 국어점수가 추가, 수정, 삭제 시 전체 국어평균 달라짐
-- 바뀐 국어 평균 값 출력

create or replace trigger kor_trigger
after
        insert or update or delete on sungjuk
declare
        avg_kor number;
begin
        select avg(kor) into avg_kor from sungjuk;
        dbms_output.put_line('국어평균 : ' || avg_kor);
end;

select * from sungjuk order by sno desc;

-- 행 수정
update sungjuk set kor=0 where sno=11;

-- 행 삭제
delete from sungjuk where sno=11;

-- 행 추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '이순신', 100, 100, 100, 'Seoul', sysdate);