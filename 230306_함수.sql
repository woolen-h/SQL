[function 함수]

select * from sungjuk order by sno desc;

-- 연습 sno=21의 국어 점수를 5점 추가하고 수정된 국어점수 반환하는 함수를 생성하시오

create or replace function fn_update(v_sno number)
    return number -- 반환되는 자료형
is
    v_kor number;
begin
    update sungjuk set kor=kor+5 where sno=v_sno;
    select kor into v_kor from sungjuk where sno=v_sno;
    return v_kor; -- 인상된 국어 점수
end;

