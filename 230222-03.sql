�� SQL Developer������ �ڵ�Ŀ�� ������ ���� �� �ִ�
   ����->ȯ�漳��->�����ͺ��̽�->��ü���->�ڵ�Ŀ�Լ��� 
   
   
[��ɾ� �Ϸ�� ���]
- insert, update, delete ��ɾ ����ϴ� ���, ��ɾ� ��ҿ� ��ɾ� �ϷḦ ������ �� �ִ�
- commit    : ��ɾ� �Ϸ�
- rollback  : ��ɾ� ���

hello world!

[��ü �� ����]
delete from sungjuk;

[��ü �� ��ȸ]
select * from sungjuk;
commit;

insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('������',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',100,100,100);

rollback;