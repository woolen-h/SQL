[where 조건절] 
-조건 만족 행 / 조건 만족 레코드 대상 조회, 수정, 삭제
select uname, kor, eng, mat
from sungjuk
where uname='대한민국';

select uname, kor, eng, mat
from sungjuk
where uname != '대한민국';

--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오
select * from sungjuk where kor>= 90 and eng>=90 and mat>=90;
--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오
select * from sungjuk where kor < 40 or eng < 40 or mat < 40;
--문7) 국어점수가 80 ~ 89점 사이 행을 조회하시오
select * from sungjuk where kor between 80 and 89;
--문8) 이름이 '무궁화', '봉선화'를 조회하시오
select * from sungjuk where uname = '무궁화' or uname= '봉선화';
-- 문9) 국, 영, 수 모두 100점 아닌 행을 조회하시오
select * from sungjuk where not (kor =100 or eng=100 or mat= 100);