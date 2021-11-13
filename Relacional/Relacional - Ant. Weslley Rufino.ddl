-- Gerado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   em:        2021-11-07 16:32:43 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE equipe (
    idequipe                  INTEGER NOT NULL,
    horario_idhoraio          INTEGER NOT NULL,
    horario_hora              VARCHAR2(10) NOT NULL,
    funcionario_idfuncionario INTEGER NOT NULL,
    funcao_idfuncao           INTEGER NOT NULL
);

ALTER TABLE equipe ADD CONSTRAINT equipe_pk PRIMARY KEY ( idequipe );

CREATE TABLE exibicao (
    idexibicao       INTEGER NOT NULL,
    sala_idsala      INTEGER NOT NULL,
    filme_idfilme    INTEGER NOT NULL,
    horario_idhoraio INTEGER NOT NULL,
    horario_hora     VARCHAR2(10) NOT NULL
);

ALTER TABLE exibicao ADD CONSTRAINT exibicao_pk PRIMARY KEY ( idexibicao );

CREATE TABLE filme (
    idfilme       INTEGER NOT NULL,
    nomeoriginal  VARCHAR2(10) NOT NULL,
    nomebr        VARCHAR2(10),
    diretor       VARCHAR2(10),
    sinopse       VARCHAR2(200),
    tipo          VARCHAR2(10),
    marketing     VARCHAR2(200),
    anolancamento DATE NOT NULL
);

ALTER TABLE filme ADD CONSTRAINT filme_pk PRIMARY KEY ( idfilme );

CREATE TABLE funcao (
    idfuncao INTEGER NOT NULL,
    cargo    VARCHAR2(10)
);

ALTER TABLE funcao ADD CONSTRAINT funcao_pk PRIMARY KEY ( idfuncao );

CREATE TABLE funcionario (
    idfuncionario INTEGER NOT NULL,
    ncarteira     INTEGER NOT NULL,
    dataadmisao   DATE NOT NULL,
    salario       FLOAT,
    nome          VARCHAR2(50) NOT NULL
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( idfuncionario );

CREATE TABLE horario (
    idhoraio INTEGER NOT NULL,
    hora     VARCHAR2(10) NOT NULL
);

ALTER TABLE horario ADD CONSTRAINT horario_pk PRIMARY KEY ( idhoraio,
                                                            hora );

CREATE TABLE sala (
    idsala     INTEGER NOT NULL,
    capacidade INTEGER,
    nome       VARCHAR2(50) NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( idsala );

ALTER TABLE equipe
    ADD CONSTRAINT equipe_funcao_fk FOREIGN KEY ( funcao_idfuncao )
        REFERENCES funcao ( idfuncao );

ALTER TABLE equipe
    ADD CONSTRAINT equipe_funcionario_fk FOREIGN KEY ( funcionario_idfuncionario )
        REFERENCES funcionario ( idfuncionario );

ALTER TABLE equipe
    ADD CONSTRAINT equipe_horario_fk FOREIGN KEY ( horario_idhoraio,
                                                   horario_hora )
        REFERENCES horario ( idhoraio,
                             hora );

ALTER TABLE exibicao
    ADD CONSTRAINT exibicao_filme_fk FOREIGN KEY ( filme_idfilme )
        REFERENCES filme ( idfilme );

ALTER TABLE exibicao
    ADD CONSTRAINT exibicao_horario_fk FOREIGN KEY ( horario_idhoraio,
                                                     horario_hora )
        REFERENCES horario ( idhoraio,
                             hora );

ALTER TABLE exibicao
    ADD CONSTRAINT exibicao_sala_fk FOREIGN KEY ( sala_idsala )
        REFERENCES sala ( idsala );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
