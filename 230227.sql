select * from sungjuk order by uname;

select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt  -- Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt -- as ���� ����
from sungjuk
group by addr;

-- �ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr; -- asc ���� ����

-- �ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr desc;

-- �ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt    -- �ؼ����� 3
from sungjuk                    -- �ؼ����� 1
group by addr                   -- �ؼ����� 2
order by cnt desc;               -- �ؼ����� 4

DROP table sungjuk;

commit;


[�����Լ�]

--��2) �ּҺ� ���������� ���ؼ� �����Ͻÿ�
select addr, count(*), max(kor), min(kor), sum(kor),  avg(kor)  --����, �ִ밪, �ּҰ�, �հ�, ���
from sungjuk
group by addr;

-- �ּҼ����� ����
select addr, count(*), max(kor), min(kor), sum(kor),  avg(kor)  
from sungjuk
group by addr
order by addr;

--round(��, 0) ceil floor �Ҽ��� ���� ������ �ݿø��� �ϰ� �Ҽ����� ����
select addr, count(*), max(kor), min(kor), sum(kor),  round(avg(kor), 0)
from sungjuk
group by addr
order by addr;

-- ���� ����� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor),  round(avg(kor), 0)
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

-- Į���� �ο�
select addr
, count(*) as cnt
, max(kor) as max_kor
, min(kor) as min_kor
, sum(kor) as sum_kor
,  round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

--  ����, ����� ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
commit;
select * from sungjuk;

-- ����� 80�� �̻� ���� ������� �ּҺ� �ο����� �ο��� ������ ��ȸ�Ͻÿ�
select * from sungjuk order by aver desc, addr;

select addr
from sungjuk
where aver>=80
group by addr;

select addr, count(*)
from sungjuk
where aver>=80
group by addr;

select addr, count(*)
from sungjuk
where aver>=80
group by addr
order by count(*);

[2�� �׷�]

--�ּҺ� ������ ��ȸ
select addr, kor, eng, mat
from sungjuk
order by addr, kor;

--�ּҺ� (1��) �׷�, �ּҰ� ���ٸ� ����������(2��) �׷�
select addr, kor
from sungjuk
group by addr, kor
order by addr;

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

-- 1�� kor 2�� eng 3�� mat
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;