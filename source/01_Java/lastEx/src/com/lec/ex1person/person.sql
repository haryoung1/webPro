-- ���̺� �� ������ ����
DROP TABLE Person;
DROP TABLE JOB;
DROP SEQUENCE PERSON_NO_SQ;

-- ���̺� �� ������ ����
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

-- ���̵����� insert
INSERT INTO JOB VALUES (10, '���');
INSERT INTO JOB VALUES (20, '����');
INSERT INTO JOB VALUES (30, '����');
SELECT * FROM JOB;

INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '���켺', 10, 90, 80, 81);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '�ڼ���', 10, 80, 90, 80);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '�����', 20, 20, 90, 90);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '����', 20, 95, 95, 95);
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, '������', 10, 100, 100, 100);

SELECT * FROM Person;
COMMIT;

-- ��ɺ� query �ۼ� (1, 2, 3)
-- 1�� : �̸�, ������, ����,����,���������� �Է� �޾� �����ͺ��̽��� ��ȣ�� �����Ͽ� �Է�
INSERT INTO Person VALUES (PERSON_NO_SQ.NEXTVAL, 'ȫ�浿',
    (SELECT JNO FROM JOB WHERE JNAME ='���'), 81,83,85);

-- 2�� : �������� �Է� �޾�, ������ ��ȸ �� ������ �߰�, ������ ���� ������ �̸�(��ȣ)�� ���
SELECT PNAME || '('||PNO||'��)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
    FROM Person P, JOB J
    WHERE P.JNO=J.JNO AND JNAME = '���'
    ORDER BY SUM DESC;

SELECT ROWNUM RANK, A.*
    FROM (SELECT PNAME || '('||PNO||'��)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
         FROM Person P, JOB J WHERE P.JNO=J.JNO AND JNAME = '���' ORDER BY SUM DESC) A;


-- 3�� : ��� ���� ���, �̸�(pNO),������,����(kor),����(eng),����(mat),������ ���(������������ �������� ����)

SELECT ROWNUM RANK, A.*
    FROM (SELECT PNAME || '('||PNO||'��)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
        FROM Person P, JOB J WHERE P.JNO=J.JNO ORDER BY SUM DESC)A;

-- 1���� 2�� ��ɿ��� ���� ������ ������ list
SELECT JNAME FROM JOB;

