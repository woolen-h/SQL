[where ������] 
-���� ���� �� / ���� ���� ���ڵ� ��� ��ȸ, ����, ����
select uname, kor, eng, mat
from sungjuk
where uname='���ѹα�';

select uname, kor, eng, mat
from sungjuk
where uname != '���ѹα�';

--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor>= 90 and eng>=90 and mat>=90;
--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor < 40 or eng < 40 or mat < 40;
--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor between 80 and 89;
--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select * from sungjuk where uname = '����ȭ' or uname= '����ȭ';
-- ��9) ��, ��, �� ��� 100�� �ƴ� ���� ��ȸ�Ͻÿ�
select * from sungjuk where not (kor =100 or eng=100 or mat= 100);