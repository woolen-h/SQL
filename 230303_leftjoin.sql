[left join �� right join]

-- �л����̺��� ��� ���� ��������, �������̺��� �й��� ��ġ�ϴ� �ุ ��������
select ST.*, SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno;

--��1) left join �� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ�Ͻÿ�

select ST.hakno, uname, SU.gcode
from tb_student ST 
left join tb_sugang SU
on ST.hakno=SU.hakno
where sno is null;

select ST.hakno, ST.uname, SU.gcode
from tb_student ST left join tb_sugang SU
on ST.hakno=SU.hakno
where SU.hakno is null;

��2) right join �� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ�Ͻÿ�

select GM.*, SU.*
from tb_gwamok GM right join tb_sugang SU
on GM.gcode=SU.gcode;

select ST.hakno, ST.uname, SU.gcode
from tb_sugang SU 
right join tb_student ST on ST.hakno=SU.hakno
where SU.hakno is null;

