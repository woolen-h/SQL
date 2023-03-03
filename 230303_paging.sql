[rownum 을 활용한 페이징]
-- 줄번호
select hakno, uname, rownum from tb_student;

-- 줄번호 칼럼명 바꾸기
select hakno, uname, rownum as ynum from tb_student;

-- 줄번호가 먼저 부여되고 정렬
select hakno, uname, rownum as ynum from tb_student order by uname;

-- 줄번호 1~3 사이 조회
select hakno, uname, rownum as ynum from tb_student where rownum>=1 and rownum<=3;

select hakno, uname, rownum as ynum from tb_student where rownum>=4 and rownum<=6;


[rownum 을 활용한 페이징]
- rownum은 모조칼럼이므로 조건절에 직접 사용하지 말고, 실제칼럼으로 인식후 사용할 것을 추천
  - rownum칼럼은 셀프조인 후에 줄번호 추가하고 조건절에 활용한다
  
문_ 줄번호(rownum)를 이용해서 줄번호 4~6조회

--1)이름순으로 조회(줄번호까지 같이 정렬)
SELECT
    uname,
    hakno,
    address,
    ROWNUM
FROM
    tb_student
ORDER BY
    uname;

--2) 1의 결과를 셀프조인
SELECT
    ROWNUM AS rnum,
    hakno,
    uname,
    address
FROM
    (
        SELECT
            uname,
            hakno,
            address
        FROM
            tb_student
        ORDER BY
            uname
    ) aa;

--3) AA 테이블 명칭은 생략해도 된다
SELECT
    ROWNUM AS rnum,
    hakno,
    uname,
    address
FROM
    (
        SELECT
            uname,
            hakno,
            address
        FROM
            tb_student
        ORDER BY
            uname
    );

--3) 2의 결과를 BB 테이블로 만들고, 줄 번호 4~6행을 조회하시오.
SELECT
    uname,
    hakno,
    address,
    rnum
FROM
    (
        SELECT
            ROWNUM AS rnum,
            hakno,
            uname,
            address
        FROM
            (
                SELECT
                    uname,
                    hakno,
                    address
                FROM
                    tb_student
                ORDER BY
                    uname
            ) aa
    ) bb
WHERE
        rnum >= 4
    AND rnum <= 6;

-- 3의 결과에서 테이블 별칭 생략
SELECT
    uname,
    hakno,
    address,
    rnum
FROM
    (
        SELECT
            ROWNUM AS rnum,
            hakno,
            uname,
            address
        FROM
            (
                SELECT
                    uname,
                    hakno,
                    address
                FROM
                    tb_student
                ORDER BY
                    uname
            )
    )
WHERE
        rnum >= 4
    AND rnum <= 6;