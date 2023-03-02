1. ���̺� ����
---------------------- �л����̺�
create table tb_student(
   hakno    char(5)     not null         --�й�
  ,uname    varchar(20) not null         --�̸�
  ,email    varchar(20) unique           --�̸���
  ,address  varchar(20) not null         --�ּ�
  ,phone    varchar(20)                  --��ȭ��ȣ
  ,regdt    date        default sysdate  --�����
  ,primary key(hakno)                    --�⺻Ű
);

---------------------- �������̺�
create table tb_gwamok(
   gcode    char(4)      not null        --�����ڵ� (p:���α׷�������, d:�����α�����)
  ,gname    varchar(20)  not null        --�����̸�
  ,ghakjum  number(2)    default 1       --����
  ,regdt    date         default sysdate --�����
  ,primary key(gcode)                    --�⺻Ű
);

create table tb_sugang(
   sno    number     not null   --�Ϸù�ȣ
  ,hakno  char(5)    not null   --�й�
  ,gcode  char(4)    not null   --�����ڵ�
  ,primary key(sno)             --�⺻Ű
);
2. �������̺� ������ ����
create sequence sugang_seq;

3. �� �߰�
----------------------------- tb_student���̺� �� �߰��ϱ�
insert into tb_student(hakno,uname,address,phone,email)
values('g1001','ȫ�浿','����','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','ȫ�浿','����','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','������','����','554-9632','77@naver.com');
insert into tb_student(hakno,uname,address,phone,email)
values('g1004','ȫ�浿','�λ�','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','���޷�','����','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','������','����','777-1000','66@naver.com');

----------------------------- tb_gwamok���̺� �� �߰��ϱ�
insert into tb_gwamok(gcode,gname,ghakjum) values('p001','JAVA',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p002','Oracle',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p003','JSP',2);
insert into tb_gwamok(gcode,gname,ghakjum) values('d001','HTML',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('d002','���伥',5);
insert into tb_gwamok(gcode,gname,ghakjum) values('d003','�Ϸ���Ʈ',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('d004','CSS',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('p004','Python',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p005','AJAX',2);

----------------------------- tb_sugang���̺� �� �߰��ϱ�
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p004');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1006','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');

commit;

��1)�л����̺��� ������ �ο����� �ο��������� ��ȸ�Ͻÿ�;
select address, count(*) from TB_STUDENT group by address order by count(*) desc;
��2)�л����̺��� ���������� �� ������� ��ȸ�Ͻÿ�
select uname, count(*) from tb_student group by uname;
��3)�л����̺��� �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ� (�ּҴ� �������� ���)
select hakno, uname, CASE address
WHEN '����' THEN 'Seoul'
WHEN '����' THEN 'Jeju'
WHEN '�λ�' THEN 'Busan'
END AS address from tb_student;
��4)�л����̺��� �ּҺ� �ο����� 3��̸� ���� ��ȸ�Ͻÿ�
select * from tb_student
WHERE address IN (
    SELECT address
    FROM tb_student
    GROUP BY address
    HAVING COUNT(*) < 3
)
order by address;
��5)�������̺��� ���α׷� ������ ��ȸ�Ͻÿ�
select gname from tb_gwamok;
��6)�������̺��� ������ �������߿��� 3������ ��ȸ�Ͻÿ�
select gname, ghakjum, gcode from tb_gwamok
WHERE ghakjum = 3 AND gcode LIKE 'd%';
��7)�������̺��� ���α׷� �������� ���� ��պ��� ���� ���α׷� �������� ��ȸ�Ͻÿ�
SELECT gname, ghakjum
FROM tb_gwamok
GROUP BY ghakjum
HAVING ghakjum < AVG(ghakjum);

SELECT gname, AVG(ghakjum) as avg_ghakjum
FROM tb_gwamok
GROUP BY gname
HAVING AVG(ghakjum) < 3;