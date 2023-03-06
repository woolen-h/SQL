[PL/SQL(Procedural Language) ���ν���]
- �������� �����ͺ��̽� ���α׷��� ���
- ����, ���ǹ�, �ݺ���

-- �ܼ�â ����ϱ� ���� ���� �غ�
set serveroutput on;

[PL/SQL �⺻����]

1) ��������
declare
 -- ���� ����
 a number := 3;
 b number := 5;
begin
 -- �ܼ�â ���
 dbms_output.put_line('* ���� ��� *');
 dbms_output.put_line(a);
 dbms_output.put_line(b);
 dbms_output.put_line(a+b);
 dbms_output.put_line(a || '+' || b || '=' || (a+b));
end;

2) ���ǹ�
declare
uname varchar2(50) := '����ȭ';
kor number := 100;
eng number := 95;
mat number := 80;
aver    number := (kor+eng+mat)/3;
grade   varchar2(10) := NULL;
begin
if aver>=90 then grade := 'A';
elsif  aver>=80 then grade := 'B';
elsif  aver>=70 then grade := 'C';
elsif  aver>=60 then grade := 'D';
else grade := 'F';
end if;
-- ���
dbms_output.put_line('*������*');
dbms_output.put_line('�̸� : ' || uname);
dbms_output.put_line('���� : ' || kor);
dbms_output.put_line('���� : ' || eng);
dbms_output.put_line('���� : ' || mat);
dbms_output.put_line('��� : ' || round(aver,2));
dbms_output.put_line('���� : ' || grade);

end;

3) �ݺ���
declare
dan number := 4;
i   number default 0;
begin
while i <10 loop
i := i+1;
exit when i=10;
dbms_output.put_line(dan || '*' || i || '=' || (dan*i));
end loop;
end;
//////////////////;


select * from sungjuk order by sno desc;
select * from sungjuk where sno=5;

����) ���ν����� �̿��ؼ� sungjuk ���̺��� sno=5���� ��ȸ�Ͻÿ�.
DECLARE
    v_sno   NUMBER;
    v_uname VARCHAR2(50);
    v_kor   NUMBER;
    v_eng   NUMBER;
    v_mat   NUMBER;
    v_addr  VARCHAR2(30);
    v_wdate DATE;
    v_juso  VARCHAR2(30); -- �ѱ� �ּ�
BEGIN
    SELECT
        sno,
        uname,
        kor,
        eng,
        mat,
        addr,
        wdate
    INTO
        v_sno,
        v_uname,
        v_kor,
        v_eng,
        v_mat,
        v_addr,
        v_wdate
    FROM
        sungjuk
    WHERE
        sno = 5;
        if v_addr='Seoul' then v_juso:='����';
        elsif v_addr='Jeju' then v_juso:='����';
        elsif v_addr='Suwon' then v_juso:='����';
        elsif v_addr='Busan' then v_juso:='�λ�';
        end if;
        
        -- ���
dbms_output.put_line('*������*');
dbms_output.put_line('��ȣ : ' || v_sno);
dbms_output.put_line('�̸� : ' || v_uname);
dbms_output.put_line('���� : ' || v_kor);
dbms_output.put_line('���� : ' || v_eng);
dbms_output.put_line('���� : ' || v_mat);
dbms_output.put_line('�ּ� : ' || v_addr);
dbms_output.put_line('�ּ� : ' || v_juso);
dbms_output.put_line('�ۼ��� : ' || v_wdate);
               
END;
///////////////////////////////////////////////
�� [���ν��� ����]
����) create or replace  procedure ���ν�����


�� [���ν��� ����]
����) drop  procedure ���ν�����


�� [���ν��� ȣ��]
����) execute ���ν�����
////////////////////////////////////////////////

create or replace procedure test_proc
is
begin
dbms_output.put_line('test_proc ���ν��� ȣ��');
end;

-- test_proc ���ν��� ȣ��
execute test_proc;

--test_proc ���ν��� ����
drop procedure test_proc;