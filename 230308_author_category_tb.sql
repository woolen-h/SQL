-- �۰�/ī�װ� ���̺�

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
values ('AU00003', '������', 'K', '���а�', '���߹��а�>���信�����۰�');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00016', '�ȹΰ�', 'K', '������/�뿪��', '������/�뿪��>����');
insert into kbe_author (aucode, aukorname, dfcode, aumclass, ausclass) 
values ('AU00017', '������', 'K', '����/����/�����', '����/�ֽ�����������');

insert into kbe_category (cagroup, caname) 
values ('PS', '��ġ/��ȸ');
insert into kbe_category (cagroup, caname) 
values ('am', '����/��å');
insert into kbe_category (cagroup, caname) 
values ('PE', '��/������');
insert into kbe_category (cagroup, caname) 
values ('es', '������');
insert into kbe_category (cagroup, caname) 
values ('c5', '�ѱ�������');
insert into kbe_category (cagroup, caname) 
values ('RL', '����');
insert into kbe_category (cagroup, caname) 
values ('ch', '�⵶��');
insert into kbe_category (cagroup, caname) 
values ('c2', '�⵶���Ϲ�');

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