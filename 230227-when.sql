 CASE WHEN ����1 THEN ���Ǹ����� ��1
          WHEN ����2 THEN ���Ǹ����� ��2
          WHEN ����3 THEN ���Ǹ����� ��3
             ...
          ELSE ��
     END ����÷���
     
    
-- �̸� �ּ� ��ȸ
select uname, addr from sungjuk;

-- �̸� �ּ� ��ȸ(��, �ּҴ� �ѱ۷� �ٲ㼭 ��ȸ)
select uname, addr, case when addr='Seoul' then '����'
                                when addr='Jeju' then '����'
                                when addr='Busan' then '�λ�'
                                when addr='Suwon' then '����'
                                end as juso
from sungjuk;


-- �̸�, ����, ������ ��ȸ�Ͻÿ�
���� : �������� 90�̻� 'A����'
                      80�̻� 'B����'
                      70�̻� 'C����'
                      60�̻� 'D����'
                      ������ 'F����'
select uname, kor, case when kor>=90 then 'A����'
                              when kor>=80 then 'B����'
                              when kor>=70 then 'C����'
                              when kor>=60 then 'D����'
                              when kor<60 then 'F����'
                              end as grade
from sungjuk;
select uname, kor, case when kor>=90 then 'A����'
                              when kor>=80 then 'B����'
                              when kor>=70 then 'C����'
                              when kor>=60 then 'D����'
                              when kor<60 then 'F����'
                              end as ���� ����
from sungjuk;



select uname, kor, case when kor between 90 and 100 then 'A����'
                            when kor between 80 and 89 then 'B����'
                            when kor between 70 and 79 then 'C����'
                            when kor between 60 and 69 then 'D����'
                            else 'F����'
                            end as grade from sungjuk;
                              
--���� ���� ������ �����ϱ�

select uname, kor, case when kor between 90 and 100 then 'A����'
                            when kor between 80 and 89 then 'B����'
                            when kor between 70 and 79 then 'C����'
                            when kor between 60 and 69 then 'D����'
                            else 'F����'
                            end as �������� 
                            from sungjuk
                            order by ��������;










