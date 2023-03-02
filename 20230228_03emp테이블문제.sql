
I:\java202301\database\20230228_03emp���̺���.sql
////////////////////////////////////////////////////////////////////////////////


��1) emp ������̺��� �����Ͻÿ�
create table emp(
  empno       number(4)     primary key --���(-9999~9999)
  ,ename      varchar2(50)              --�̸�
  ,job        varchar2(10)              --����
  ,mgr        number(4)                 --�Ŵ�������
  ,hiredate   date                      --�Ի���
  ,sal        number(7,2)               --�޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)               --Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                 --�μ��ڵ�(-99~99)
);


��2) emp������̺� ���� �߰��Ͻÿ�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////
commit;

��3) ��ü ���� ������ ��ȸ�Ͻÿ�
select count(*)
from emp;
��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�
select *
from emp;
��5) ����̸���(��������) �����Ͻÿ�
select ename
from emp
order by ename;

��6) ����̸���(��������) �����Ͻÿ�
select ename
from emp
order by ename desc;

��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp
order by sal desc;

��8) �μ��ڵ� ��������, �޿� ������������
     ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp
order by deptno, sal desc;

��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
order by deptno, hiredate;

��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
select distinct job, ename
from emp
order by job;
????????????????

select distinct(joB) from emp;
select job from emp group by job;


��11) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
select job as ����, sal as �޿�, ename as �̸�
from emp
order by job, sal desc;

��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
select sal, ename
from emp
where 100<=sal and sal<=400
order by sal desc;

��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
select sal, ename
from emp
where 100>=sal or sal>=400
order by sal desc;

��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�
select ename, job
from emp
where job='����' or job='����'
order by ename;

��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
select ename, deptno
from emp
where deptno=30
order by ename;

��16) �ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�
select ename, deptno
from emp
where deptno==deptno;

select distinct(deptno) from emp;
select deptno from emp group by deptno;

��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
      (or, in������ ���� Ȱ���ؼ� ��ȸ);
      
select ename, deptno
from emp
where deptno=10 or deptno=20 or deptno=30
order by deptno;

select ename, deptno
from emp
where deptno in (10,20,30)
order by ename;

��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
      (and, between������ ���� Ȱ���ؼ� ��ȸ);
select ename, sal
from emp
where sal between 300 and 500
order by sal;

��19) �̸��� ����ȭ ��ȸ�Ͻÿ�
select *
from emp
where ename='����ȭ';

��20) �达���� ��ȸ�Ͻÿ�
select ename
from emp
where ename like '��%';

��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�
select *
from emp
where ename like '%ȭ%';

��22) �μ��ڵ尡 20�� �࿡ ���ؼ� �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
update emp
set comm=sal/100*1
where deptno=20;
select * from emp;

��23) ������ �Ʒ��� ���� ������ �̸�, �μ�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
select ename, deptno, sal, comm, sal*12+comm as ysal
from emp;

��24) Ŀ�̼��� null�̸� 0���� �ٲ��� ������ �ٽ� ����ؼ�
      �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
select ename, deptno, sal, coalesce(comm,0), sal*12+coalesce(comm,0) as ysal
from emp;

-- ������ �� �ø��ؼ� �Ҽ��� ���� ��ȸ�Ͻÿ�.
select ename, deptno, sal, coalesce(comm,0), round(sal*12+coalesce(comm,0)) as ysal
from emp;

��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
      (|| ���տ�����);
select ename || '�� �޿��� ' || sal || ' �Դϴ�.'
from emp;

-- ������ �켱����
() ��ȣ : ������ �켱�������� �켱��
1���� : �񱳿�����, SQL������, ���������
2���� : not
3���� : and
4���� : or
5���� : ���տ�����   

��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
      ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�;
select ename, hiredate, deptno
from emp
where hiredate < '2005-01-01'
order by hiredate;

��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
     ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
     (or, in������ ���� Ȱ���ؼ� ��� ��ȸ);
select ename, job, deptno
from emp
where deptno in(20,30)
order by ename;

select ename, job, deptno
from emp
where deptno=20 or deptno=30
order by ename;

��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
      (��, �μ��ڵ尡 10�̸� ������
                      20�̸� ������
                      30�̸� �����η� �ٲ㼭 ���);
select empno, ename, case deptno
when 10 then '������'
when 20 then '������'
when 30 then '������'
end as �μ�
from emp;

��29) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not(sal>200 and sal<300)
      order by sal;
      
      -- �޿��� 200�ʰ� ���� �ʴ� ���  300 �̸��� �ƴ� ���� �޿� ������������ ����

��30) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not sal>200 and sal<300
      order by sal;
      
      -- �޿��� 200�ʰ� 300�̸��� �ƴ� ���� �޿� ���� �������� ����


//////////////////////////////////////////////////////////////////////////////////////////////////////

[emp���̺� ���� ��������]


��31) �μ��ڵ庰 �޿��հ踦 ���Ͻÿ�
select deptno, sum(sal) as tot_sal
from emp
group by deptno
order by deptno;


��32) �μ��ڵ庰 �޿��հ踦 ���ؼ�  �� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�;
select deptno, sum(sal)
from emp
group by deptno
having sum(sal) >= 1500
order by sum(sal);


��33) �μ��� �޿������ 300�̻� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 300;

select deptno, avg(sal) from emp group by deptno;

��34) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ ���ؼ� �޿���ռ����� ��ȸ�Ͻÿ�
select * from emp where sal>=300;

select deptno, avg(sal)
from emp
where sal >= 300
group by deptno;

select deptno, avg(sal)
from emp
where sal >= 300
group by deptno
order by avg(sal);

��35) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ 400�̻��� �޿������� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
where sal >= 300
group by deptno
having avg(sal)>=400
order by avg(sal);

��36) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�
--��ȯ�Լ� : to_char()

--�Ի��� ��ȸ
select hiredate from emp order by hiredate;

--�Ի��Ͽ��� �� ��������
select to_char(hiredate, 'mm') from emp;
select to_char(hiredate, 'mm') as �� from emp;
select to_char(hiredate, 'dd') from emp;
select to_char(hiredate, 'dd') as �� from emp;
select to_char(hiredate, 'yy') from emp;
select to_char(hiredate, 'yy') as �Ի�⵵ from emp;

--�Ի���� �����ؼ� ��ȸ�ϱ�
select to_char(hiredate, 'mm')
from emp
order by to_char(hiredate, 'mm')

--�Ի������ �׷�ȭ�ϱ�
select to_char(hiredate, 'mm')
from emp
group by to_char(hiredate, 'mm');

--�Ի������ �׷�ȭ�ϰ� �� ���� ���ϱ�
select to_char(hiredate, 'mm') as �Ի��, count(*) as �ο���
from emp
group by to_char(hiredate, 'mm')
order by to_char(hiredate, 'mm');


��37) �Ŵ����� ����ο����� ��ȸ�Ͻÿ�(mgr : �μ� ����� �����ȣ)
select mgr from emp order by mgr;

select mgr, count(*)
from emp
group by mgr;


��38) �����ȣ 7654�� �޿����� ���� ���� ��ȸ�Ͻÿ�
select * from emp;
select empno, ename, sal
from emp
where sal < (select sal from emp where empno = 7654)
order by sal;


��39) �μ����� �޿�+Ŀ�̼Ǹ� ��������  
�ִ밪, �ּҰ�, ��հ�(�ݿø� �ؼ�)�� �μ������� ��ȸ�Ͻÿ�
select deptno, sal+comm as tot_sal from emp;

select deptno, sal+nvl(comm,0) as tot_sal
from emp
order by deptno, sal;

group by deptno;

select deptno, sal, comm from emp order by deptno;
select deptno, sal, comm, sal+comm from emp order by deptno;
select deptno, sal, comm, sal+nvl(comm, 0) from emp order by deptno;

select deptno, 
max(sal+nvl(comm, 0)) as max, 
min(sal+nvl(comm, 0)) as min, 
round(avg(sal+nvl(comm, 0))) as avg
from emp
group by deptno
order by deptno;


��40) �� �����鿡 ���ؼ� ������ �̸��� �ټӳ���� ���Ͻÿ�
      ��, �ټӳ���� �������� �����Ͽ� ��Ÿ���ÿ�
      select ename, hiredate from emp;
      
      --�̸�, �Ի����� �Ի��� ������ ��ȸ�Ͻÿ�
      select ename, hiredate from emp order by hiredate;
      
      --�ټ��� : ���糯¥ - �Ի�����
      select ename, hiredate, sysdate -hiredate from emp;
      
      --���糯¥-�Ի��� /365
      select ename, hiredate, round((sysdate -hiredate)/365) from emp;
      
      select ename as �̸�, hiredate as �Ի���, trunc((sysdate -hiredate)/365) as �ټӳ�� from emp;
      
      select ename as �̸�, 
      hiredate as �Ի���, 
      trunc((sysdate -hiredate)/365) as �ټӳ�� 
      from emp
      order by �ټӳ�� desc;

��41) �Ʒ��� ���� ��� �Ͻÿ�
      ��) �������� �ټӳ�� : 20��
    select ename || '�� �ټӳ�� : ' || trunc((sysdate -hiredate)/365) || '��' from emp
    order by trunc((sysdate -hiredate)/365) desc;

��42) ������� �ټӳ���� ������ ���� ��ȸ(�̸�, �ټӳ��)�Ͻÿ�
select ename as �̸�, trunc((sysdate -hiredate)/365) as �ټӳ�� from emp
where trunc((sysdate -hiredate)/365) 
=(select trunc((sysdate -hiredate)/365) from emp where empno = 7654);

��43) �Ի����� ��15�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
      ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
      
trunc((sysdate -hiredate)/365>=15;
select sal*12+nvl(comm,0) as ysal from emp; --����
select (sal*12+nvl(comm,0))*1.1 as up_sal from emp; --�λ� ����
(sal*12+nvl(comm,0))*0.1 --�λ�� �ݾ�;

select empno as ���, ename as �̸�, hiredate as �Ի���, sal*12+nvl(comm,0) as ���翬��, 
(sal*12+nvl(comm,0))*1.1 as �λ��Ŀ���, (sal*12+nvl(comm,0))*0.1 as �λ�ȱݾ�
from emp
where trunc((sysdate -hiredate)/365)>=15
order by �λ��Ŀ��� desc;

��43) �Ի����� ��20�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
      ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
      
trunc((sysdate -hiredate)/365>=20;
select sal*12+nvl(comm,0) as ysal from emp; --����
select (sal*12+nvl(comm,0))*1.1 as up_sal from emp; --�λ� ����
(sal*12+nvl(comm,0))*0.1; --�λ�� �ݾ�

select empno as ���, ename as �̸�, hiredate as �Ի���, sal*12+nvl(comm,0) as ���翬��, (sal*12+nvl(comm,0))*1.1 as �λ��Ŀ���, (sal*12+nvl(comm,0))*0.1 as �λ�ȱݾ�
from emp
where trunc((sysdate -hiredate)/365)>=20
order by �λ��Ŀ��� desc;

��44) �Ի�⵵�� ¦���� �������� �޿��� ����� job���� ����Ͻÿ�;
select to_char(hiredate, 'yy')
from emp
where mod(to_char(hiredate, 'yy'), 2) = 0;
avg(sal)
group by job;

select avg(sal from emp where mod(to_char(hiredate, 'yy'), 2) = 0) from emp;
//////////////////////////////////////////////////////////////////////////////////
select job, avg(sal)
from emp
where mod(to_char(hiredate, 'yy'), 2) = 0
group by job
order by avg(sal);

