[alter 문] - 테이블의 구조 수정 및 변경

1. 컬럼 추가
   형식) alter table table명 add (컬럼명 데이터타입);
   
--music 컬럼 추가

alter table sungjuk add(music int null);

select * from sungjuk;

2. 컬럼명 수정
   형식) alter table table명 rename column 원래컬럼명 to 바꿀컬럼명;
   
   alter table sungjuk rename column kor to korea;
   
3. 컬럼 데이터 타입 수정   
  형식) alter table table명 modify(컬럼명 데이터타입);
  
  alter table sungjuk modify();
  
4. 컬럼 삭제
   형식)alter table table명 drop(컬럼명);
   
   alter table sungjuk drop(music);