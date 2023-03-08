-- 작가/카테고리 테이블

create table kbe_author (
aucode          varchar2(7) not null,
aukorname      varchar2(30),
auengname      varchar2(1000),
dfcode      varchar2(1) not null,
aumclass      varchar2(50),
ausclass      varchar2(50)
);

create table kbe_category (
cagroup varchar2(4000) not null,
caname varchar2(20) not NULL
);

insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00003', '김지영', 'K', '문학가', '대중문학가>포토에세이작가');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00016', '안민경', 'K', '번역가/통역사', '번역가/통역사>영어');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00017', '신현덕', 'K', '경제/금융/기업인', '증권/주식투자전문가');

insert into kbe_category (cagroup, caname) 
values ('PS', '정치/사회');
insert into kbe_category (cagroup, caname) 
values ('am', '행정/정책');
insert into kbe_category (cagroup, caname) 
values ('PE', '시/에세이');
insert into kbe_category (cagroup, caname) 
values ('es', '에세이');
insert into kbe_category (cagroup, caname) 
values ('c5', '한국에세이');
insert into kbe_category (cagroup, caname) 
values ('RL', '종교');
insert into kbe_category (cagroup, caname) 
values ('ch', '기독교');
insert into kbe_category (cagroup, caname) 
values ('c2', '기독교일반');

select * from kbe_author;
select * from kbe_category;

alter table kbe_category add cacode varchar2(4);

update kbe_category set cacode='D01'
where cagroup='PS';
update kbe_category set cacode='J01'
where cagroup='am';
update kbe_category set cacode='D02'
where cagroup='PE';
update kbe_category set cacode='J02'
where cagroup='es';
update kbe_category set cacode='S01'
where cagroup='c5';
update kbe_category set cacode='D03'
where cagroup='RL';
update kbe_category set cacode='J03'
where cagroup='ch';
update kbe_category set cacode='S02'
where cagroup='c2';

alter table kbe_category modify (cacode not null);