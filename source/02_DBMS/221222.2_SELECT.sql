-- [ II ] SELECT 문 - 조회
-- 1. SELECT 문장 작성법
-- 현재 계정(실행 : CTRL+ENTER)

SHOW USER;
SELECT * 
    FROM tab; -- 현 계정이 가지고 있는 테이블 정보
SELECT * 
    FROM emp; -- EMP테이블의 모든 열 (필드), 모든 행 
SELECT * 
    FROM dept; -- DEPT 테이블의 모든 열(필드), 모든 행
SELECT * 
    FROM salgrade; 

-- 2. 특정 열만 출력
DESC EMP; -- EMP 테이블의 구조
SELECT empno, ename, sal,job
    FROM emp; -- EMPNO,ENAME,SAL,JOB필드 모든 행 검색

SELECT empno, ename, sal, job, mgr, sal, comm
    FROM emp;

SELECT empno AS "사 번", ename AS "이름", sal AS "급여", job AS "직책"
    FROM emp;

SELECT empno "사 번", ename "이름", sal "급여", job "직책"
    FROM emp;

SELECT empno "사 번", ename 이름, sal 급여, job 직책
    FROM emp;

SELECT empno no, ename name, sal salary, job
    FROM emp; -- 필드에 별칭을 두는 경우

-- 3. 특정 행 출력 : WHERE 절 (조건절) -- 비교연산자 : 같다 (=), 다르다 (!=, ^=, <>)
SELECT empno "사번", ename "이름", sal "급여"
FROM emp
WHERE sal = 3000; --같다
    
SELECT  empno no, ename name, sal
FROM emp
WHERE sal != 3000; -- 다르다

SELECT empno no, ename name, sal
FROM emp
WHERE sal^= 3000; -- 다르다

SELECT empno no, ename name, sal
FROM emp
WHERE sal <> 3000; -- 다르다 

    -- 비교 연산자는 숫자, 문자, 날짜형 모두 가능
    -- ex1. 사원이름 (ENAME)이 'A','B','C'로 시작하는 사원의 모든 필드
    -- A < AA < AAA < AAAA < AAAAA < AAAAA < AAAAAA < AA..A < A...AB
    
SELECT * FROM emp
WHERE ename < 'D'; 
    
    -- ex2. 81년도 이전에 입사한 사원의 모든 필드
    
SELECT * FROM emp
WHERE hiredate < '81/01/01';

    -- ex3. 부서번호 (DEPTNO)가 10번 사원의 모든 필드
    
SELECT * FROM emp
WHERE deptno = 10;

    -- ex4. 이름(ENAME)이 FORD인 직원의 EMPNO, ENAME, MGR(상사의 사번)을 출력
    -- SQL문 대소문자 구별 없음. 데이터는 대소문자 구별
    
SELECT empno, ename, mg FROM emp
WHERE ename = 'FORD';

-- 4. 조건절에 논리 연산자 : AND OR NOT
    --ex1. 급여(SAL)가 2000이상 3000이하인 직원의 모든 필드 출력
SELECT * FROM emp
WHERE sal >= 2000 AND sal <= 3000;

    --ex2. 82년도에 입사한 사원의 모든 필드
    -- 문자는 ' ' 추가 해야하고 숫자는 괜찮
SELECT * FROM emp 
WHERE hiredate >= '82/01/01' 
AND hiredate <= '82/12/31';

-- 날짜 표기법 셋팅 (현재 : YY/MM/DD 또는 RR/MM/DD)
ALTER SESSION SET nls_date_format = 'MM-DD-YYYY';

SELECT * FROM EMP
    WHERE hiredate >= '01-01-1982'
    AND hiredate <= '12-31-1982';

SELECT *FROM EMP
    WHERE to_char(hiredate, 'RR/MM/DD') >= '82/01/01'
    AND TO_CHAR (HIREDATE, 'RR/MM/DD') <='82/12/31';
    ALTER SESSION SET NLS_DATE_FORMAT ='YY/MM/DD';

    --ex3. 연봉이 2400이상인 직원의 ENAM, SAL, 연봉 (SAL*12)을 출력
    
SELECT ENAME, SAL, SAL*12 ANNUALSAL 
    FROM EMP                  -- (1)
    WHERE ANNUALSAL >= 2400;  -- (2) WHERE 절에는 필드 별칭 사용 불가
SELECT ENAME, SAL, SAL*12 ANNUALSAL -- (3)번째
    FROM EMP                -- (1)번쨰 
    WHERE SAL*12 > 2400;    -- (2)번째
    
    -- ex4. 연봉이 10,000 이상인 직원의 ENAME, SAL, 연봉 (연봉순으로) 출력
SELECT ENAME, SAL, SAL*12 "연봉" -- (3)
    FROM EMP            -- (1) 
    WHERE SAL*12>2400   -- (2)
    ORDER BY 연봉;       -- (4) 정렬
    -- ex5. 10번 부서(DEPTNO) 이거나 JOB이 MANAGER인 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO = 10 OR JOB= 'MANAGER';

    -- ex6. 부서번호가 10번 부서가 아닌 직원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO != 10;
SELECT * FROM EMP WHERE NOT DEPTNO = 10; 

-- 5. 산술연산자 
SELECT EMPNO, ENAME, SAL, SAL*1.1 UPGRADESAL FROM EMP;
    -- ex. 모든 사원의 이름(ename), 월급(sal), 상여(comm), 연봉(sal*12+comm)
SELECT ENAME, SAL, COMM, SAL*12+COMM 연봉 FROM EMP;
    -- 산술 연산의 결과는 NULL을 포함하면 결과는 NULL 
    -- NVL (NULL 일 수도 있는 필드명, 대치값)을 이용 ; 필드명과 대치값은 타입이 일치
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) 연봉 FROM EMP;

    -- 모든 사원의 ENAME, MGR(상사사번)을 출력 (상사가 없으면 CEO로 출력)

SELECT ENAME, NVL (TO_CHAR (MGR),'CEO') MGR FROM EMP;

-- 6. 연결 연산자 (||) : 필드나 문자를 연결
SELECT ENAME || '은' || JOB EMPLOYEES FROM EMP;
    -- ex. 모든 사원에 대하여 'SMITH : ANNUAL SALARY = XXXX' 포멧으로 출력 (연봉=SAL*12+COMM)
SELECT ENAME || ' : ANNUAL SALARY = ' || (SAL*12+NVL(COMM,0)) MESSAGE FROM EMP;

-- 7. 중복제거 (DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- ★ 연습문제  꼭 풀기
--1. emp 테이블의 구조 출력
DESC EMP;

--2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;

--3. 현 scott 계정에서 사용가능한 테이블 출력
SHOW USER;
SELECT * FROM TAB;

--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT  EMPNO, ENAME, SAL, JOB, HIREDATE
FROM EMP;

--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE sal <= 2000;

--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO, ENAME, JOB, HIREDATE 
FROM EMP 
WHERE hiredate < '81/02/01';

--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT  * 
FROM EMP
WHERE JOB = 'SALESMAN';

--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT *
FROM EMP
WHERE NOT JOB = 'CLERK';

--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 1500 AND SAL <=3000;

--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO != 20;

--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'SALESMAZ' OR SAL<=3000;

--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO, ENAME, JOB, SAL 
FROM EMP
WHERE JOB = 'MANAGER' AND SAL>=2500;

--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ENAME || '은' || JOB || '업무이고 연봉은' || (SAL*12+NVL(COMM,0))||'이다'
MESSAGE FROM EMP;

-- CF. "ENAME의 상여는 800" (연결 연산자로 하면 NULL은 출력 안됨)
SELECT ENAME || '의 상여금은 ' || NVL(COMM,0)
FROM EMP;
--------------------------------------------------------------------------------

-- 8. SQL 연산자(BETWEEN, IN, LIKE IS NULL)
    -- (1) BETWEEN A AND B; A부터 B까지 (A,B 포함)
    
        -- ex.SAL이 1500이상 3000이하인 직원의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL >= 1500 AND SAL <= 3000;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000; -- 앞에 작은거, 뒤에는 큰거

    -- ex. sal이 1500미만, 3000초과
SELECT * 
FROM EMP
WHERE SAL NOT BETWEEN 1500 AND 3000;

    -- ex. 이름이 'A', 'B', 'C' 로 시작하는 직원의 모든 필드
SELECT * 
FROM EMP
WHERE ENAME BETWEEN 'A' AND 'D' AND ENAME!= 'D'; -- 'A'~'D'까지 / 'D'는 제외

    -- ex. 82년도에 입사한 직원의 모든 필드 출력
SELECT * FROM EMP
WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '82/01/01' AND '82/12/31';

-- (2) IN

    -- ex. 부서번호가 10, 20, 40번 부서인 직원의 모든 필드 ( IN )
SELECT * FROM EMP
WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40;
SELECT * FROM EMP
WHERE DEPTNO IN (10,20,40);

    -- ex. 부서번호가 10,20,40번을 제외한 부서 직원의 모든 필드 ( NOT )
SELECT * FROM EMP
WHERE DEPTNO NOT IN (10,20,40);

    -- ex. 사번이 7902, 7788, 7566인 사원의 모든 필드
SELECT * FROM EMP
WHERE EMPNO IN (7902, 7788, 7566);

    -- ex. 직책이 MANAGER 이거나 ANALYST인 사원의 모든 필드
SELECT * FROM EMP
WHERE JOB IN ('MANAGER', 'ANALYST');

    -- (3) LIKE % (0글자이상), _ (한글자)를 포함한 패턴
    
        -- ex. 이름이 M으로 시작하는 사원의 모든 필드
SELECT * FROM EMP
WHERE ENAME LIKE 'M%'; -- M, MA, MAA, (M이 들어가는 모든 이름 검색가능)

    -- ex. 이름에 N이 들어가는 사원의 모든 필드
SELECT * FROM EMP
WHERE ENAME LIKE '%N%';

    -- ex. 이름에 N이 들어가거나 job에 N이 들어가는 사원의 모든 필드
SELECT * FROM EMP
WHERE ENAME LIKE '%N%' OR JOB LIKE '%N%';

    -- ex. 이름이 'S' 로 끝나는 사원의 모든 필드
SELECT * FROM EMP
WHERE ENAME LIKE '%S';

    -- ex. SAL이 5로 끝나는 사원의 모든 필드
SELECT * FROM EMP
WHERE SAL LIKE '%5';

    -- ex. 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP
WHERE TO_CHAR (HIREDATE,'RR/MM/DD') LIKE '82/%';

    -- ex. 1월에 입사한 사원의 모든 필드
SELECT * FROM EMP
WHERE HIREDATE LIKE '__/01/__';

    -- ex. 이름에 '%'가 들어간 사원의 모든 필드
INSERT INTO EMP VALUES (9999, 'LISA%', NULL, NULL, NULL, 6000, 1500, 40);
SELECT * FROM EMP
WHERE ENAME LIKE '%\%%' ESCAPE '\';
ROLLBACK; -- DML(데이터 조작어; 추가, 수정, 삭제를 취소

    -- (4) IS NULL (null 인지 검색할때)
    
        -- ex. 상여금이 없는 사원의 모든 필드 (COMM이 NULL, 0)
SELECT * FROM EMP
WHERE COMM IS NULL OR COMM = 0;

        --.ex 상여금을 받는 사원의 모든 필드 (comm이 null이 아니고 0도 아님)
SELECT * FROM EMP
WHERE NOT COMM IS NULL AND COMM != 0;

SELECT * FROM EMP
WHERE COMM IS NOT NULL AND COMM != 0;
    
-- 9. 정렬 (오름차순, 내림차순) ; ORDER BY 절

SELECT ENAME, SAL, HIREDATE
FROM EMP
ORDER BY SAL; -- 급여 오름차순 정렬

SELECT ENAME, SAL, HIREDATE
FROM EMP
ORDER BY SAL DESC; -- 급여 내림차순 정렬

SELECT ENAME, SAL, HIREDATE
FROM EMP
ORDER BY SAL DESC, HIREDATE DESC; -- 급여 내림차순, 급여


SELECT ENAME, SAL, HIREDATE
FROM EMP
ORDER BY ENAME; -- 이름 ABC 순으로 정렬

SELECT ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE; -- 입사 날짜순으로 정렬

SELECT ENAME, SAL, SAL*12+NVL(COMM,0)
ANNUALSAL FROM EMP
ORDER BY ANNUALSAL;

-- 형변환 함수
-- 날짜형 (HIREDATE)을 문자형으로 변환 : TO_CHAR (날짜형데이터, 패턴)
SELECT TO_CHAR (HIREDATE,'MM-DD-YYYY')
FROM EMP;

-- 문자형을 날짜형으로 변환 : TO_DATE (문자데이터 , 패턴)
SELECT TO_DATE ('01-12-1996', 'MM-DD-YYYY')
FROM DUAL;

-- 날짜형식 바꾸는 문법 = ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

-- <시험 연습문제>
--1.EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
 SELECT EMPNO, ENAME, JOB, SAL
    FROM EMP
    WHERE SAL >= 3000;
 
--2.EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO
    FROM EMP
    WHERE EMPNO IN (7788);

--3.연봉이 2400이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL*12+NVL(COMM,0) >=2400 
    ORDER BY SAL;

--4. 입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력)
SELECT ENAME, JOB, HIREDATE
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '81/02/20' AND '81/05/01';

--5.deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * 
    FROM EMP
    WHERE DEPTNO IN (10,20) 
    ORDER BY ENAME;

--6.sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 TITLE 을 employee과 Monthly Salary로 출력)
SELECT ENAME employee, SAL "Monthly Salary"
    FROM EMP
    WHERE SAL >= 1500 AND DEPTNO IN (10,30);

--7.hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * FROM EMP
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '82/01/01' AND '82/12/31';

--8.이름의 첫자가 C부터 P로 시작하는 사람의 이름, 급여 출력 (급여, 이름순 정렬)
SELECT ENAME, SAL
    FROM EMP
    WHERE ENAME BETWEEN 'C' AND 'Q'
    ORDER BY SAL, ENAME;

--9.comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM
    FROM EMP;
    WHERE COMM>SAL*1.1;

--10.job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP
    WHERE JOB IN ('CLERK', 'ANALYST')
    AND SAL NOT IN (1000,3000,5000);

--11.ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP
    WHERE ENAME LIKE '%L%L%' AND
    DEPTNO=30 OR MGR=7782;

--12.입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '81/01/01' AND '81/12/31';

--13.입사일이 81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '81/01/01' AND '81/12/31' AND
    NOT JOB IN ('SALESMAN');

--14.사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
FROM EMP
ORDER BY SAL, HIREDATE;

--15.사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '__N%';

--16.사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%A%';

--17.연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO, ENAME, SAL*12 연봉 
FROM EMP
WHERE SAL*12>35000;




--  일사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 이름, 직책, 입사일을 출력(단hiredate 순으로 출력)

SELECT ENAME, JOB, HIREDATE
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '81/02/20' AND '81/05/01';

--. . sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력(단 TITLE을 employee과 Monthly Salary로 출력)

SELECT ENAME "employee", SAL "Monthly Salary"
    FROM EMP
    WHERE SAL >= 1500 AND DEPTNO IN (10,30);

--. 입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 업무, 급여를 출력.

SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') BETWEEN '81/01/01' AND '81/12/31' AND
    NOT JOB IN ('SALESMAN');


--. SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '__N%';