[����Ŭ �Լ�]

-- �������̺� : dual

1. ���ڿ�
select lower('Hello World') from dual; --�ҹ���
select upper('Hello World') from dual; --�빮��
select length('Hello World') from dual; --���ڰ���
select substr('Hello World',1,5) from dual; --���ڿ� �ڸ���

select instr('Hello World','W') from dual; --���� ������ġ
select lpad('SKY',5,'*') from dual;  -- ���ʿ� ���� �߰�
select rpad('SKY',5,'*') from dual;  -- �����ʿ� ���� �߰�
select replace('happy','p','k') from dual; --Ư������ ����

select chr(65) from dual; --A
select chr(66) from dual; --B
select chr(97) from dual; --a
select chr(98) from dual; --b

-- ���ڿ� �����ϱ�
select concat('�ι̿�', '�ٸ���') from dual;

--concat (Į����, '���ڿ�')
select concat(uname, '�� �����'), concat(aver, '�Դϴ�') from sungjuk;
select concat(uname, '�� �����') as �̸�, concat(aver, '�Դϴ�') as ��� from sungjuk;

select uname || '�� ����� ' || aver || '�Դϴ�' from sungjuk;

2. ����
select abs(-7) from dual; --���밪
select mod(5,3) from dual; --�������Լ�
select ceil(12.546) from dual; --�ø��Լ�
select trunc(13.543, 1) from dual; --�����Լ�

select avg(kor) from sungjuk;  
select ceil(avg(kor)) from sungjuk;
select trunc(avg(kor), 2) from sungjuk;
select round(avg(kor), 1) from sungjuk;


select to_number('123')+1 from dual;
select '123'+1 from dual;

3. ��¥
select sysdate from dual;

select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate) from dual;

select sysdate+100 from dual;
select sysdate-100 from dual;

select months_between('2025-01-05', '2021-01-06') from dual;

-- ���ڿ��� ��¥������ ��ȯ
select to_date('2023-02-27') from dual;
select to_date('2023-02-27') - to_date('2023-05-30') from dual;

-- �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�.
select max(kor), count(*)
from sungjuk
where addr = 'Incheon';


select count(*)+1     --0+1=1
from sungjuk
where addr='Inchoen';

select max(kor) + 1  -- null ���� 1�� ���� ������ �Ұ����ϴ�
from sungjuk
where addr='Incheon';

select nvl(max(kor),0) + 1
from sungjuk
where addr='Incheon';

select nvl(max(kor),0) + 1 as max_kor
from sungjuk
where addr='Incheon';

select * from sungjuk order by sno;

����) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�
sno   : max(sno)+1
        ��, max()���� null�̸� 0���� �ٲ��� ����Ѵ�
uname : �����
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate;

select nvl(max(sno),0)+1 from sungjuk;

insert into sungjuk (sno, uname, kor, eng, mat, addr, wdate)
values (
(select nvl(max(sno),0)+1 from sungjuk), 
'�����'
, 100
, 100
, 100
, 'Seoul'
, sysdate);

delete from sungjuk where sno=12;

commit;
