[���� ���Ἲ ��������]
- foreign key ��������
  - ������ ���̺� �Ǵ� �ٸ� ���̺��� �⺻Ű �Ǵ� ����Ű�� �����ϴ� ���� ����
  - on delete cascade  �θ����̺��� ���� �����Ǵ� ��� �ڽ����̺��� �������� ����
  - on delete set null �θ����̺��� ���� �����Ǵ� ��� ���� �ܷ�Ű ���� null�� ��ȯ
  - �θ�:Primary Key �⺻Ű <---> �ڽ�:Foreign Key �ܷ�Ű
  
  ---------------------------------
��) �������̺� ��������
    create table tb_sugang(
       sno    number(3)  not null
      ,hakno  char(5)    not null
      ,gcode  char(4)    not null
,primary key(sno)                                 --snoĮ�� �⺻Ű
      ,foreign key(hakno) references tb_student(hakno)  --haknoĮ���� �θ����̺�(�л�)�� hakno ����
      ,foreign key(gcode) references tb_gwamok(gcode)   --gcodeĮ���� �θ����̺�(����)�� gcode ����
       on update cascade                                --�θ����̺��� ���� �����Ǹ� �ڽ����̺� ���� ���� ����
       on delete no action                              --�θ����̺��� ���� �����Ǵ��� �ڽ����̺��� �������� ����
    );
    
    --------------------------------
    �� [��ü ���Ἲ]

  - �⺻Ű�� ���� �ִ� �Ӽ��� NULL���� ������ ���Ѵ�
  - �⺻Ű�� ���ڵ尣�� ������ �ĺ����̹Ƿ� ���������� NULL���� �� �� ����
  
  �� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=186
  
  