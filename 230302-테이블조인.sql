
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
--��ü �� ����
select count(*) from tb_student;
select count(*) from tb_gwamok;
select count(*) from tb_sugang;

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
  
  
select address, count(distinct SU.hakno) || '��' as student_count
from tb_sugang SU
join tb_student ST 
on SU.hakno = ST.hakno
group by address;

��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001  HTML    2��
     d002  ���伥    1��
     d003  �Ϸ���Ʈ  1��
     p001  JAVA    4��
     p002  Oracle  2��
     p003  JSP     2��
     p004  Python  1��
     
     select GM.gcode, gname, count(*) || '��' as stu_cnt
     from (tb_gwamok GM 
     join tb_sugang SU on GM.gcode= SU.gcode
     join tb_student ST on SU.hakno = ST.hakno)
     group by GM.gcode, gname
     order by gcode;
     
     --1) �������̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�
     select * from tb_sugang order by gcode;
     
     --2) �������̺��� �����ڵ尡 ������ ���� �׷�ȭ�ϱ�
     select gcode, count(*)
     from tb_sugang
     group by gcode;
     
     --3) 2)�� ����� AA���̺�� �����ϰ�, �������̺� �����ϱ�;
     select AA.gcode, GM.gname, concat(AA.cnt, '��')
     from (
     select gcode, count(*) as CNT
     from tb_sugang SU
     group by gcode
     ) AA join tb_gwamok GM
     on AA.gcode=GM.gcode
     order by AA.gcode;
     
     
��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  12����
     g1002  ȫ�浿   8����
     g1005  ���޷�  12����
     g1006  ������   3����
     
     select SU.hakno, uname, ghakjum
     from (
     tb_student ST
     join tb_sugang SU on SU.hakno = ST.hakno
     join tb_gwamok GM on GM.gcode = SU.gcode
     );
     
     select SU.hakno, uname, sum(ghakjum) || '����' as TOTAL_hakjum
     from (
     tb_student ST
     join tb_sugang SU on SU.hakno = ST.hakno
     join tb_gwamok GM on GM.gcode = SU.gcode
     )
     group by SU.hakno, uname;
     
     -- 1) �������̺��� �й����� ��ȸ
     select hakno, gcode from tb_sugang order by hakno;
     
     -- 2) �������̺� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
     select SU.hakno, SU.gcode, GM.ghakjum
     from tb_sugang SU join tb_gwamok GM
     on SU.gcode = GM.gcode;
     
     --3) 2�� ����� AA���̺�� ����� �й����� �׷�ȭ
     select AA.hakno, sum(AA.ghakjum) as hap
     from (
     select SU.hakno, SU.gcode, GM.ghakjum
     from tb_sugang SU join tb_gwamok GM
     on SU.gcode = GM.gcode
     ) AA
     group by AA.hakno;
     
     -- 4) 3�� ����� BB ���̺�� �����
     select BB.hakno, ST.uname, concat(BB.hap, '����') as hakjum
     from (
     select AA.hakno, sum(AA.ghakjum) as hap
     from (
     select SU.hakno, SU.gcode, GM.ghakjum
     from tb_sugang SU join tb_gwamok GM
     on SU.gcode = GM.gcode
     ) AA
     group by AA.hakno
     ) BB join tb_student ST
     on BB.hakno=ST.hakno;
     
     
��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  d001  HTML
     g1001  p001  JAVA
     g1001  p002  Oracle
     g1001  p003  JSP
     g1001  p004  Python
     
     select SU.hakno, GM.gcode, gname
     from (
     tb_student ST 
     join tb_sugang SU on SU.hakno=ST.hakno
     join tb_gwamok GM on SU.gcode=GM.gcode
     )
     where SU.hakno = 'g1001'
     order by gcode;
     
     
��6) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������
     
     select SU.hakno, uname
     from tb_student ST
     join tb_sugang SU on SU.hakno=ST.hakno
     where gcode='p001';

     --1) ������û�� �� �л����� �й� ��ȸ
     select hakno from tb_sugang;
     select distinct hakno from tb_sugang;
     select hakno from tb_sugang group by hakno;
     
     --2)
     select hakno, uname
     from tb_student
     where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';
��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿
     
     select SU.hakno, uname, gcode
     from tb_student ST
     join tb_sugang SU on SU.hakno=ST.hakno
     where not gcode = 'p001'
     and not SU.hakno IN (
     select SU.hakno
     from tb_sugang
     where SU.gcode='p001');
     
     select hakno, uname
     from tb_student
     where hakno not in (select hakno from tb_sugang group by hakno);