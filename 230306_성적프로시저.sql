[sungjuk ���̺��� create/read/update/delete ���� ���ν���]

1) �� �߰� ���ν��� (Create)
create or replace procedure sungjukInsert
(
    v_uname in sungjuk.uname%type,
    v_kor in sungjuk.kor%type,
    v_eng in sungjuk.eng%type,
    v_mat in sungjuk.mat%type,
    v_addr in sungjuk.addr%type
)
is
begin
    insert into sungjuk(sno, uname, kor, eng, mat, tot, aver, addr)
    values(
    sungjuk_seq.nextval, 
    v_uname, v_kor, v_eng, v_mat, (v_kor+v_eng+v_mat), (v_kor+v_eng+v_mat)/3, v_addr);
    commit;
end;

--���ν��� ����
execute sungjukInsert('���ʽ�', 100, 99, 95, 'Seoul');


2) �� ���� ���ν��� (Update)
-- ��) sno=5���� �Ʒ� ������ �̸�, ��, ��, ��, �ּ�, ����, ����� �����ϴ� ���ν���
/
execute sungjukUpdate('�ڸ���', 50, 60, 90, 'Jeju', 61);
/

create or replace procedure sungjukUpdate
(
    v_uname in sungjuk.uname%type,
    v_kor in sungjuk.kor%type,
    v_eng in sungjuk.eng%type,
    v_mat in sungjuk.mat%type,
    v_addr in sungjuk.addr%type,
    v_sno in sungjuk.sno%type
)
is
begin
    update sungjuk
    set uname=v_uname, kor=v_kor, eng=v_eng, mat=v_mat, aver=(v_kor+v_eng+v_mat)/3, addr=v_addr
    where sno=v_sno;
    commit;
end;
/

3) �� ���� ���ν��� (Delete)
-- ��) sno=5�� ����
execute sungjukDelete(5);

create or replace procedure sungjukDelete
(
v_sno in sungjuk.sno%type
)
is
begin
delete from sungjuk where sno=v_sno;
commit;
end;


//////////////////////////////////////////////////////////
create or replace procedure sungjukRead
(
    v_cursor out sys_refcursor    -- out ��¸Ű�����
   ,v_sno sungjuk.sno%type
)
is
begin
    open v_cursor for 
    select * from sungjuk where sno=v_sno;
    -- close v_cursor; Ŀ���ݳ�
end;
4) �󼼺��� (Read)
create or replace procedure sungjukRead
(
    v_cursor out sys_refcursor    -- out ��¸Ű�����
   ,v_sno sungjuk.sno%type
)
is
begin
    open v_cursor for 
    select * from sungjuk where sno=v_sno;
    -- close v_cursor; Ŀ���ݳ�
end;
5) ��ü��� (Read)
create or replace procedure sungjukList
(
    v_cursor out sys_refcursor
)
is
begin
    open v_cursor for 
    select * from sungjuk order by sno desc;
    LOOP
            fetch v_cursor into rec;
            exit when v_cursor%NOTFOUND;
    end LOOP;
    -- close v_cursor; Ŀ���ݳ�
end;