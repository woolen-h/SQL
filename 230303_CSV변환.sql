[CSV ����]
- ��� �����Ͱ� , �� ���еǾ� �ִ� ����

[CSV ������ �����ͺ��̽��� ��������]
- �������������� https://data.go.kr/ Ȱ��


��1) ���θ� �����ȣ ���̺� �����ϱ�

--1) zipdoro.CSV (258267��)

--2) zipdoro ���̺� ����
CREATE TABLE zipdoro (
    zipno      CHAR(5),
    zipaddress VARCHAR(1000)
);

COMMIT;

--3) ��������� ��������
- zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
- zipdoro ���̺� ��Ŭ�� - > export(��������)

select count(*) from zipdoro;

��2) �ѱ����� ~~.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ�
create table school (
SCid           VARCHAR(20) null,
SCname VARCHAR(100) null,
SCgrade VARCHAR(20) null,
SCadd  VARCHAR(1000) null,
SCcreatedate   VARCHAR(30) null,
SCchangedate   VARCHAR(30) null,
SClati VARCHAR(30),
SClont VARCHAR(30)
);
commit;

drop table school;

select count(*) from school;

����1) ����ִ� �� null�� ã���ÿ�
select * from school
where scadd is null
;
����2) �� �õ��� �ʵ��б� ���б� ������ ���Ͻÿ�