[alter ��] - ���̺��� ���� ���� �� ����

1. �÷� �߰�
   ����) alter table table�� add (�÷��� ������Ÿ��);
   
--music �÷� �߰�

alter table sungjuk add(music int null);

select * from sungjuk;

2. �÷��� ����
   ����) alter table table�� rename column �����÷��� to �ٲ��÷���;
   
   alter table sungjuk rename column kor to korea;
   
3. �÷� ������ Ÿ�� ����   
  ����) alter table table�� modify(�÷��� ������Ÿ��);
  
  alter table sungjuk modify();
  
4. �÷� ����
   ����)alter table table�� drop(�÷���);
   
   alter table sungjuk drop(music);