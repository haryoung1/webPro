-- 테이블 생성 & 더미데이터
-- 테이블 및 시퀀스 삭제
DROP TABLE Person;
DROP TABLE JOB;
DROP SEQUENCE PERSON_NO_SQ;

-- 테이블 및 시퀀스 생성
CREATE TABLE JOB (
    jNO NUMBER(2),
    jNAME VARCHAR2(50),
    PRIMARY KEY (jNO)
);
CREATE TABLE Person (
    pNO NUMBER(5),
    pNAME VARCHAR2(50) NOT NULL,
    jNO NUMBER(2) NOT NULL,
    KOR NUMBER(3) CHECK (KOR>0),
    ENG NUMBER(3) CHECK (ENG>0),
    MAT NUMBER(3) CHECK (MAT>0),
    PRIMARY KEY (pNO),
    FOREIGN KEY (jNO) REFERENCES JOB (jNO)
);
CREATE SEQUENCE PERSON_NO_SQ
    START WITH 1
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;

-- 더미데이터 insert
INSERT INTO JOB VALUES (10, '배우');
INSERT INTO JOB VALUES (20, '가수');
INSERT INTO JOB VALUES (30, '엠씨');


INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '정우성', 10, 90, 80, 81);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '박세영', 10, 80, 90, 80);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '배수지', 20, 20, 90, 90);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '설현', 20, 95, 95, 95);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '송혜교', 10, 100, 100, 100);

COMMIT;

SELECT * FROM Person;













