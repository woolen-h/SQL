[left join 과 right join]

-- 학생테이블의 모든 행을 가져오고, 수강테이블에서 학번이 일치하는 행만 가져오기
select ST.*, SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno;

--문1) left join 을 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오

select ST.hakno, uname, SU.gcode
from tb_student ST 
left join tb_sugang SU
on ST.hakno=SU.hakno
where sno is null;

select ST.hakno, ST.uname, SU.gcode
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno
where SU.hakno is null;

문2) right join 을 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오

select GM.*, SU.*
from tb_gwamok GM right join tb_sugang SU
on GM.gcode=SU.gcode;

select ST.hakno, ST.uname, SU.gcode
from tb_sugang SU 
right join tb_student ST on ST.hakno=SU.hakno
where SU.hakno is null;

