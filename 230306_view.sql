[view]

-- 뷰 생성

SELECT
    uname,
    kor,
    eng,
    mat,
    addr
FROM
    sungjuk
WHERE
    addr IN ( 'Seoul', 'Jeju' );

CREATE OR REPLACE VIEW test1_view AS
    SELECT
        uname,
        kor,
        eng,
        mat,
        addr
    FROM
        sungjuk
    WHERE
        addr IN ( 'Seoul', 'Jeju' );
        
        
        -- 테이블 뷰 목록 확인
        select * from tab;  -- 모든 테이블
        select * from tab where tabtype='TABLE';  --테이블만
        select * from tab where tabtype='VIEW';  --뷰만
        
        -- 생성된 뷰는 테이블 처럼 사용 가능하다
        select * from test1_view;
        
        -- 뷰의 세부정보 확인
        select * from user_views;
        select text from user_views where view_name='TEST1_VIEW';
        
        -- 뷰 삭제
        drop view test1_view;
        
        /////////////////////////////////////////////////
        
        create or replace view test2_view
        as
        select uname as 이름, kor as 국어, eng as 영어, mat as 수학, addr as 주소
        from sungjuk
        where addr in ('Seoul', 'Jeju');
        
        select * from test2_view;
        
        수강신청한 학생들의 학번, 총학점을 뷰로 생성하시오(test3_view)
     g1001  14학점
     g1002  8학점
     g1005  12학점
     g1006  3학점
     
     -- 수강신청과목의 학점 / 학번 별로 총학점
     select SU.hakno as 학번, sum(GW.ghakjum) || '학점' as 총학점
     from tb_sugang SU join tb_gwamok GW
     on SU.gcode=GW.gcode
     group by SU.hakno;
     
     -- 위의 결과를 test3_view 생성하기
     create or replace view test3_view
     as select SU.hakno, sum(GW.ghakjum) || '학점' as 총학점
     from tb_sugang SU join tb_gwamok GW
     on SU.gcode=GW.gcode
     group by SU.hakno;
     
     select * from test3_view;
     
     -- 뷰와 학생테이블을 조인해서 학번, 이름, 총학점 출력
     select tb_student.uname, test3_view.*
     from tb_student join test3_view
     on tb_student.hakno=test3_view.hakno
     order by tb_student.hakno;