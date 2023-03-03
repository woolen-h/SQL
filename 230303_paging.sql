[rownum �� Ȱ���� ����¡]
-- �ٹ�ȣ
select hakno, uname, rownum from tb_student;

-- �ٹ�ȣ Į���� �ٲٱ�
select hakno, uname, rownum as ynum from tb_student;

-- �ٹ�ȣ�� ���� �ο��ǰ� ����
select hakno, uname, rownum as ynum from tb_student order by uname;

-- �ٹ�ȣ 1~3 ���� ��ȸ
select hakno, uname, rownum as ynum from tb_student where rownum>=1 and rownum<=3;

select hakno, uname, rownum as ynum from tb_student where rownum>=4 and rownum<=6;


[rownum �� Ȱ���� ����¡]
- rownum�� ����Į���̹Ƿ� �������� ���� ������� ����, ����Į������ �ν��� ����� ���� ��õ
  - rownumĮ���� �������� �Ŀ� �ٹ�ȣ �߰��ϰ� �������� Ȱ���Ѵ�
  
��_ �ٹ�ȣ(rownum)�� �̿��ؼ� �ٹ�ȣ 4~6��ȸ

--1)�̸������� ��ȸ(�ٹ�ȣ���� ���� ����)
SELECT
    uname,
    hakno,
    address,
    ROWNUM
FROM
    tb_student
ORDER BY
    uname;

--2) 1�� ����� ��������
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

--3) AA ���̺� ��Ī�� �����ص� �ȴ�
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

--3) 2�� ����� BB ���̺�� �����, �� ��ȣ 4~6���� ��ȸ�Ͻÿ�.
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

-- 3�� ������� ���̺� ��Ī ����
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