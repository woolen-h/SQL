[Ʈ���� trigger]
-- �ܼ�â ��� dbms_output.put_line �� �����
set serveroutput on;

////////////////////////
-- ���� sungjuk���̺��� ���������� ���
select avg(kor) from sungjuk;

-- ���������� �߰�, ����, ���� �� ��ü ������� �޶���
-- �ٲ� ���� ��� �� ���

create or replace trigger kor_trigger
after
        insert or update or delete on sungjuk
declare
        avg_kor number;
begin
        select avg(kor) into avg_kor from sungjuk;
        dbms_output.put_line('������� : ' || avg_kor);
end;

select * from sungjuk order by sno desc;

-- �� ����
update sungjuk set kor=0 where sno=11;

-- �� ����
delete from sungjuk where sno=11;

-- �� �߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '�̼���', 100, 100, 100, 'Seoul', sysdate);