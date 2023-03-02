
-inner join �� ���̺� �������� �����ϴ� Į���� �̿��ϴ� ���
>>>> inner ���� ����, �⺻

[���̺� ����]

- ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
  - �ΰ��̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
  - �����̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����
  
  ����
  select Į����
       from ���̺�1 join ���̺�2
       on ������;                --ANSI(ǥ��) SQL��
       
       select Į����
       from ���̺�1, ���̺�2
       on ������;                       --Oracle DB SQL��
       
       from T1 inner join T2
       on T1.x=T2.x;                --���̺��.Į����;
       
       select T1.*, T2.*, T3.*
       from T1 join T2
       on T1.x=T2.x join T3
       on T1.y=T3.y;                -- 3�� ���̺� ����
       
       select T1.*, T2.*, T3.*
       from T1 join T2
       on T1.x=T2.x join T3
       on T1.y=T3.y join T4
       on T1.z=T4.z;                -- 4�� ���̺� ����
       
       
       ������ : where having on
       
       ������ ���̺� == ���� ���̺�
       
    -- ������ ���̺� : ���� create
    -- ���� ���̺� : SQL ���� ���̺�
    
    
[inner join ����]

select * from tb_sugang;

-- �й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- �� ���̺� ���� ������ ����/inner ��������
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- ������û�� �л����� �й�, �����ڵ�, �̸�, �̸����� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno=tb_student.hakno;

select * from tb_sugang;

-- ���� �ڵ带 �������� ����-���� ���̺� ����

 select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
 from tb_sugang join tb_gwamok
 on tb_sugang.gcode=tb_gwamok.gcode;
 
 -- 3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student
on tb_sugang.hakno=tb_student.hakno
join tb_gwamok on tb_sugang.gcode=tb_gwamok.gcode;

-- ���̺��� alias(��Ī)�� �����ϴ�
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

select *
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

-- ��ȸ�� ���̺� �ߺ����� ����Į���� ���̺�� ����
select SU.*, uname, email
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

--�ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ�
--ORA-00918: ���� ���ǰ� �ָ��մϴ�
select SU.*, uname, email, gname, ghakjum, gcode
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno join tb_gwamok GW
on SU.gcode=GW.gcode;

[���̺� ���� ��������]
��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�.
select address from tb_student;
-- ������û�� �л��� ���
select * from tb_sugang;

--�������̺� + �л����̺�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno;

--'����'�� ��ȸ�ϱ�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
where address='����';

select address, count(*)
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;

-------------------------------------------------

--������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�.
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
select SU.hakno, SU.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
) AA
where AA.address='����';

--email Į�� �������� ����
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
select SU.hakno, SU.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
) AA
where AA.address='����';

--AA��Ī ��������
select hakno, gcode, uname, address
from (
select SU.hakno, SU.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
) AA
where address='����';

--AA ���̺��� ��� Į��
select *
from (
select SU.hakno, SU.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
) AA
where address='����';


��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
���� 2��
���� 2��
select * from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;

select BB.hakno, BB.address, count(*)
from (
select SU.hakno, address
from tb_sugang SU 
join tb_student ST on SU.hakno=ST.hakno
) BB
group by address
order by count(*) DESC;

SELECT SU.hakno, address
FROM tb_sugang SU 
  JOIN tb_student ST ON SU.hakno = ST.hakno
  group by SU.hakno
  having SU.hakno in (select hakno from tb_sugang group by hakno);
  
  
select address, count(distinct SU.hakno) as student_count
from tb_sugang SU
join tb_student ST 
on SU.hakno = ST.hakno
group by address;