[function �Լ�]

select * from sungjuk order by sno desc;

-- ���� sno=21�� ���� ������ 5�� �߰��ϰ� ������ �������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�

create or replace function fn_update(v_sno number)
    return number -- ��ȯ�Ǵ� �ڷ���
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor; -- �λ�� ���� ����
end;

