��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�);
    select SU.gcode, GM.ghakjum, SU.hakno, uname
    from (
    tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
    ); -- ��ü ��ȸ
    
    select max(GM.ghakjum)
    from (
    tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
    ); -- �ִ� ���� �������� ���� ����
    
    
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
    ; -- ��� ��ȸ
    

��2) �й��� ������û�� �������� ���ϰ� �й������� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
    (��, ������û���� ���� �л��� �������� 0���� ǥ��);
     select ST.hakno, nvl(sum(ghakjum), 0)
     from tb_sugang SU
        RIGHT JOIN tb_student ST ON ST.hakno = SU.hakno
        LEFT JOIN tb_gwamok GM ON GM.gcode = SU.gcode
    group by ST.hakno
    order by ST.hakno; -- �й��� ����
    
    select rownum as rnum, haknum, hakjum
    from
    (select ST.hakno as haknum, nvl(sum(ghakjum), 0) as hakjum
     from tb_sugang SU
        RIGHT JOIN tb_student ST ON ST.hakno = SU.hakno
        LEFT JOIN tb_gwamok GM ON GM.gcode = SU.gcode
    group by ST.hakno
    order by ST.hakno); -- �γѹ� �����
    
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
); -- ��ü �й� �� ���� ��ȸ
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
select SU.hakno, ghakjum
from (
tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
)
group by SU.hakno, ghakjum; --�й��� ������û ��������
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
select ST.hakno, sum(ghakjum)
from (
tb_gwamok GM 
    join tb_sugang SU on GM.gcode = SU.gcode
    join tb_student ST on SU.hakno = ST.hakno
)
group by ST.hakno
order by ST.hakno; --�й��� ������û ������
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������ ������ ���� 1�Ǹ� ��ȸ�Ͻÿ�(�й�, �̸�, ������)
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
    SUM(ghakjum) DESC;-- ������ �������� ����
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



