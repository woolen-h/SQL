[CSV 파일]
- 모든 데이터가 , 로 구분되어 있는 파일

[CSV 파일을 데이터베이스로 가져오기]
- 공공데이터포털 https://data.go.kr/ 활용


문1) 도로명 우편번호 테이블 구축하기

--1) zipdoro.CSV (258267행)

--2) zipdoro 테이블 생성
CREATE TABLE zipdoro (
    zipno      CHAR(5),
    zipaddress VARCHAR(1000)
);

COMMIT;

--3) 가져오기와 내보내기
- zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
- zipdoro 테이블 우클릭 - > export(내보내기)

select count(*) from zipdoro;

문2) 한국교원 ~~.csv를 변환해서 테이블에 저장하시오
create table school (
SCid           VARCHAR(20) null,
SCname VARCHAR(100) null,
SCgrade VARCHAR(20) null,
SCadd  VARCHAR(1000) null,
SCcreatedate   VARCHAR(30) null,
SCchangedate   VARCHAR(30) null,
SClati VARCHAR(30),
SClont VARCHAR(30)
);
commit;

drop table school;

select count(*) from school;

과제1) 비어있는 값 null을 찾으시오
select * from school
where scadd is null
;
과제2) 각 시도별 초등학교 중학교 갯수를 구하시오