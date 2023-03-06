[index 색인]

● [인덱스 생성]   
- 형식) create index 인덱스명 on 테이블명(칼럼명)
  create table emp2(
  id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);
  --행추가 
insert into emp2(id,name) values (10,'kim');
insert into emp2(id,name) values (20,'park');
insert into emp2(id,name) values (30,'hong');
commit;

-- 인덱스 생성 전
select * from emp2 where name='hong'; -- 커서 여기에 놓고 F10

-- 인덱스 생성 후(색인 페이지 별도 생성)
create index emp2_name_idx on emp2(name);

-- 인덱스 삭제
drop index emp2_name_idx;

select * from emp2 where name='kim';
-- f10 계획설명 보기 -> full scan cost 2

● [인덱스 삭제]  
- 형식) drop index 인덱스명

[pk가 있는 테이블]

-- pk는 인덱스가 자동으로 생성되면서 정렬된다
create table emp3 (
   no    number       primary key
  ,name varchar2(10)
  ,sal  number
);

select * from emp3 where no=3;
-- f10 계획설명 -> unique scan, cost1
//////////////////////////////////////////
연습 3) 100만건의 행을 대상으로 cost 비교

create table emp4(
   no     number
  ,name   varchar2(10)
  ,sal    number
);

프로시저를 이용해서 100만행 추가하기 ########################################
declare  
    i     number      := 1;     
    name  varchar(20) := 'kim';
    sal   number      := 0;
begin
    while i<1000000 loop
        if i mod 2 = 0 then
            name := 'kim'  || to_char(i);
            sal  := 300;
        elsif i mod 3 = 0 then
            name := 'park' || to_char(i);
            sal  := 400;
        elsif i mod 5 = 0 then
            name := 'hong' || to_char(i);
            sal  := 500;
        else
            name := 'shin' || to_char(i);
            sal  := 250;
        end if;
        insert into emp4(no, name, sal) values (i, name, sal); --행추가
        i := i+1;
    end loop;
end;
################################################################################
select count(*) from emp4;
commit;
select * from emp4;


select * from emp4 where name='kim466';

select * from emp4 where sal>300;

create index emp4_name_idx on emp4(name);
select * from emp4 where name='kim466'; -- range scan, cost3

create index emp4_name_sal_idx on emp4(name, sal);

select * from emp4 where name='kim466' and sal>200;

select * from user_indexes;
select * from user_indexes where index_name like 'EMP4%';