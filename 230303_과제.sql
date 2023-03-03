문1) 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
    (학번, 이름, 과목코드);
    select SU.gcode, GM.ghakjum, SU.hakno, uname
    from (
    tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
    ); -- 전체 조회
    
    select max(GM.ghakjum)
    from (
    tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
    ); -- 최대 학점 교과목의 학점 선택
    
    
    select SU.hakno, uname, SU.gcode
    from (
    tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
    )
    where GM.ghakjum =(select max(GM.ghakjum)
    from (
    tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
    ))
    ; -- 명단 조회
    

문2) 학번별 수강신청한 총학점을 구하고 학번순으로 정렬해서 줄번호 4~6행 조회하시오
    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시);
     select ST.hakno, nvl(sum(ghakjum), 0)
     from tb_sugang SU
        RIGHT JOIN tb_student ST ON ST.hakno = SU.hakno
        LEFT JOIN tb_gwamok GM ON GM.gcode = SU.gcode
    group by ST.hakno
    order by ST.hakno; -- 학번순 정렬
    
    select rownum as rnum, haknum, hakjum
    from
    (select ST.hakno as haknum, nvl(sum(ghakjum), 0) as hakjum
     from tb_sugang SU
        RIGHT JOIN tb_student ST ON ST.hakno = SU.hakno
        LEFT JOIN tb_gwamok GM ON GM.gcode = SU.gcode
    group by ST.hakno
    order by ST.hakno); -- 로넘버 만들기
    
    select rnum, haknum, hakjum
    from (
    select rownum as rnum, haknum, hakjum
    from
    (select ST.hakno as haknum, nvl(sum(ghakjum), 0) as hakjum
     from tb_sugang SU
        RIGHT JOIN tb_student ST ON ST.hakno = SU.hakno
        LEFT JOIN tb_gwamok GM ON GM.gcode = SU.gcode
    group by ST.hakno
    order by ST.hakno)
    )
    where rnum >=4 and rnum<=6;
    
    
    
    
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    select distinct(hakno), GM.gcode, sno
    from (
tb_sugang SU 
    left join tb_gwamok GM on GM.gcode = SU.gcode)
    order by hakno; -- leftjoin 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
select SU.hakno, ghakjum
from (
tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
); -- 전체 학번 및 학점 조회
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
select SU.hakno, ghakjum
from (
tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
)
group by SU.hakno, ghakjum; --학번별 수강신청 개별학점
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
select ST.hakno, sum(ghakjum)
from (
tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
)
group by ST.hakno
order by ST.hakno; --학번별 수강신청 총학점
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
문3) 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후 위에서 부터 1건만 조회하시오(학번, 이름, 총학점)
SELECT
    su.hakno,
    uname,
    SUM(ghakjum)
FROM
    (
             tb_gwamok gm
        JOIN tb_sugang  su ON gm.gcode = su.gcode
        JOIN tb_student st ON su.hakno = st.hakno
    )
GROUP BY
    su.hakno,
    uname
ORDER BY
    SUM(ghakjum) DESC;-- 총학점 내림차순 정렬
SELECT
    ROWNUM,
    hakno,
    uname,
    sum_hak
FROM
    (
        SELECT
            su.hakno,
            uname,
            SUM(ghakjum) AS sum_hak
        FROM
            (
                     tb_gwamok gm
                JOIN tb_sugang  su ON gm.gcode = su.gcode
                JOIN tb_student st ON su.hakno = st.hakno
            )
        GROUP BY
            su.hakno,
            uname
        ORDER BY
            SUM(ghakjum) DESC
    )
WHERE
    ROWNUM = 1;



