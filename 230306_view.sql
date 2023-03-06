[view]

-- �� ����

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
        
        
        -- ���̺� �� ��� Ȯ��
        select * from tab;  -- ��� ���̺�
        select * from tab where tabtype='TABLE';  --���̺�
        select * from tab where tabtype='VIEW';  --�丸
        
        -- ������ ��� ���̺� ó�� ��� �����ϴ�
        select * from test1_view;
        
        -- ���� �������� Ȯ��
        select * from user_views;
        select text from user_views where view_name='TEST1_VIEW';
        
        -- �� ����
        drop view test1_view;
        
        /////////////////////////////////////////////////
        
        create or replace view test2_view
        as
        select uname as �̸�, kor as ����, eng as ����, mat as ����, addr as �ּ�
        from sungjuk
        where addr in ('Seoul', 'Jeju');
        
        select * from test2_view;
        
        ������û�� �л����� �й�, �������� ��� �����Ͻÿ�(test3_view)
     g1001  14����
     g1002  8����
     g1005  12����
     g1006  3����
     
     -- ������û������ ���� / �й� ���� ������
     select SU.hakno as �й�, sum(GW.ghakjum) || '����' as ������
     from tb_sugang SU join tb_gwamok GW
     on SU.gcode=GW.gcode
     group by SU.hakno;
     
     -- ���� ����� test3_view �����ϱ�
     create or replace view test3_view
     as select SU.hakno, sum(GW.ghakjum) || '����' as ������
     from tb_sugang SU join tb_gwamok GW
     on SU.gcode=GW.gcode
     group by SU.hakno;
     
     select * from test3_view;
     
     -- ��� �л����̺��� �����ؼ� �й�, �̸�, ������ ���
     select tb_student.uname, test3_view.*
     from tb_student join test3_view
     on tb_student.hakno=test3_view.hakno
     order by tb_student.hakno;