[having ������]

group by �� ���� ����ϴ� ������
�׷�ȭ�� �ϰ� �� �� �������� �߰�

where having on

select addr, count(*) as cnt
from sungjuk
group by addr;

--�ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

--�ּҺ� �ο����� 3�� ���� ��ȸ�Ͻÿ�
select addr, count(*) as cnt
from sungjuk
group by addr
having count(*)=3;

-- �ּҺ� �ο����� 3 �̻��� ���� ��ȸ
select addr, count(*) as cnt
from sungjuk
group by addr
having count(*)>=3;

-- �ּҺ� ������հ��� 50�̻� �� ��ȸ
-- �� ��հ��� �Ҽ��� ���� �ݿø�
select * from sungjuk;

select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

select addr
        , round(avg(kor),0) as avg_kor
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

-- ����� 70�̻� ���� ������� �ּҺ� �ο��� ����
-- �ο����� 2�̸� ���� �ο��� ������ ��ȸ
1) ��ü �� ��ȸ
select * from sungjuk order by aver desc;
2) ��� ���� 70�̻� �� ��ȸ
select *
from sungjuk
where aver>=70;
3) �ּҺ� �ο����� ���Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=70
group by addr
4) �ο��� 2�̸�
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;
5) �ο��� ������ ��ȸ
select addr, count(*) as cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by cnt;
