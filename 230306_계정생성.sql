[오라클 계정 생성]

--계정 생성시 세션 변경해야 함
alter session set "_ORACLE_SCRIPT"=true;

--사용자 계정 목록
select username from all_users;

-- 테이블 스페이스 생성
create tablespace 테이블스페이스이름
      datafile '데이터파일경로' size 초기사이즈
      autoextend on
      next 자동증가사이즈
      maxsize 최대사이즈;
      
      연습)
      create tablespace java202301
      datafile 'I:\java202301\database\java202301.dbf' size 50m
      autoextend on
      next 10m
      maxsize unlimited;
      
      --테이블 스페이스 종류 확인
      select tablespace_name, contents from dba_tablespaces;
      
      -- 사용자 계정 생성
      형식;
      create user 아이디 identified by 비번
      default tablespace 테이블스페이스이름;
      
      연습;
      create user itwill identified by 1234
      default tablespace java202301;
      
      -- 모든 권한 부여
      grant connect, resource, dba to itwill;
      
      commit;
      
      -- 명령프롬프트에서 권한 부여된 itwill 로그인하기
      >sqlplus itwill/1234
      
      -- 사용자 계정 삭제
      drop user itwill cascade;
      
      -- 테이블 스페이스 삭제
      drop tablespace java202301
      including contents and datafiles
      cascade constraints;
      
      commit;
      
      