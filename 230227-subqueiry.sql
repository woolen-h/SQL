<<<<<<< HEAD
[��������]
- SQL�� �� �� �ٸ� SQL
- ���̺� ������ �������� ���� �� ��ȸ �� �˻�

--���� ������ ����� ��ȸ�Ͻÿ�
select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk;
select round(avg(kor), 0) as avg_kor from sungjuk;


--���� ���� ��պ��� �� �� ���� ������ ��ȸ�Ͻÿ�
select round(avg(kor), 0) as avg_kor from sungjuk;
select uname, kor from sungjuk where kor >=66;
select uname, kor from sungjuk where kor >=(select round(avg(kor),0) from sungjuk);

--��2) ���������� �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul');


--��3) ���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�
select uname, addr, kor
from sungjuk
where addr 
not in('Seoul') 
and kor>(
select round(avg(kor),0) 
from sungjuk 
where addr = 'Seoul'
);

select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul')
and addr<>'Seoul';

--��4) ���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
select uname, mat, eng from sungjuk
where mat<=(select min(kor) from sungjuk) 
=======
[��������]
- SQL�� �� �� �ٸ� SQL
- ���̺� ������ �������� ���� �� ��ȸ �� �˻�

--���� ������ ����� ��ȸ�Ͻÿ�
select kor from sungjuk order by kor desc;
select avg(kor) from sungjuk;
select round(avg(kor), 0) from sungjuk;
select round(avg(kor), 0) as avg_kor from sungjuk;


--���� ���� ��պ��� �� �� ���� ������ ��ȸ�Ͻÿ�
select round(avg(kor), 0) as avg_kor from sungjuk;
select uname, kor from sungjuk where kor >=66;
select uname, kor from sungjuk where kor >=(select round(avg(kor),0) from sungjuk);

--��2) ���������� �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�
select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul');


--��3) ���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�
select uname, addr, kor
from sungjuk
where addr 
not in('Seoul') 
and kor>(
select round(avg(kor),0) 
from sungjuk 
where addr = 'Seoul'
);

select uname, addr, kor from sungjuk 
where kor>(select round(avg(kor),0) from sungjuk where addr = 'Seoul')
and addr<>'Seoul';

--��4) ���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
select uname, mat, eng from sungjuk
where mat<=(select min(kor) from sungjuk) 
>>>>>>> 550dc26ea696050eff62c6ac29d3f96a21ee13a2
or eng<=(select min(kor) from sungjuk);