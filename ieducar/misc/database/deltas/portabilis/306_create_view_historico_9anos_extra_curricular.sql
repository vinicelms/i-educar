-- Cria view de historico escolar 9 anos extra curricular
-- @author Caroline Salib <caroline@portabilis.com.br>

DROP VIEW relatorio.view_historico_9anos_extra_curricular;


CREATE OR REPLACE VIEW relatorio.view_historico_9anos_extra_curricular AS
SELECT ref_ref_cod_aluno AS cod_aluno,
       fcn_upper(nm_disciplina) AS disciplina,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 1 LIMIT 1) LIMIT 1) AS nota_1serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 2 LIMIT 1) LIMIT 1) AS nota_2serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 3 LIMIT 1) LIMIT 1) AS nota_3serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 4 LIMIT 1) LIMIT 1) AS nota_4serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 5 LIMIT 1) LIMIT 1) AS nota_5serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 6 LIMIT 1) LIMIT 1) AS nota_6serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 7 LIMIT 1) LIMIT 1) AS nota_7serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 8 LIMIT 1) LIMIT 1) AS nota_8serie,

  (SELECT CASE
              WHEN ((substring(trim(hd.nota),1,1) <> 0)
                    AND (substring(trim(hd.nota),1,1) <> 1)
                    AND (substring(trim(hd.nota),1,1) <> 2)
                    AND (substring(trim(hd.nota),1,1) <> 3)
                    AND (substring(trim(hd.nota),1,1) <> 4)
                    AND (substring(trim(hd.nota),1,1) <> 5)
                    AND (substring(trim(hd.nota),1,1) <> 6)
                    AND (substring(trim(hd.nota),1,1) <> 7)
                    AND (substring(trim(hd.nota),1,1) <> 8)
                    AND (substring(trim(hd.nota),1,1) <> 9)) THEN replace(hd.nota,'.',',')
              WHEN ((to_number(trim(hd.nota), '999') > 10)
                    AND (to_number(trim(hd.nota), '999') <= 20)) THEN replace(trim(hd.nota),'.',',')
              ELSE replace(substring(trim(hd.nota),1,4),'.',',')
          END
   FROM pmieducar.historico_disciplinas hd
   INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = hd.ref_ref_cod_aluno
                                              AND historico_escolar.sequencial = hd.ref_sequencial)
   WHERE hd.ref_ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND fcn_upper(hd.nm_disciplina) = fcn_upper(nm_disciplina)
     AND historico_escolar.ativo = 1
     AND historico_escolar.extra_curricular = 1
     AND historico_escolar.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 9 LIMIT 1) LIMIT 1) AS nota_9serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 1 LIMIT 1) AS ano_1serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 2 LIMIT 1) AS ano_2serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 3 LIMIT 1) AS ano_3serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 4 LIMIT 1) AS ano_4serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 5 LIMIT 1) AS ano_5serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 6 LIMIT 1) AS ano_6serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 7 LIMIT 1) AS ano_7serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 8 LIMIT 1) AS ano_8serie,

  (SELECT ano
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.sequencial =
       (SELECT max(hee.sequencial)
        FROM pmieducar.historico_escolar hee
        WHERE hee.ref_cod_aluno = he.ref_cod_aluno
          AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
          AND hee.ativo = 1
          AND hee.extra_curricular = 0)
     AND substring(he.nm_serie,1,1) = 9 LIMIT 1) AS ano_9serie,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 1 LIMIT 1) LIMIT 1) AS transferido1,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 2 LIMIT 1) LIMIT 1) AS transferido2,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 3 LIMIT 1) LIMIT 1) AS transferido3,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 4 LIMIT 1) LIMIT 1) AS transferido4,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 5 LIMIT 1) LIMIT 1) AS transferido5,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 6 LIMIT 1) LIMIT 1) AS transferido6,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 7 LIMIT 1) LIMIT 1) AS transferido7,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 8 LIMIT 1) LIMIT 1) AS transferido8,

  (SELECT DISTINCT he.aprovado = 4
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 9 LIMIT 1) LIMIT 1) AS transferido9,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 1 LIMIT 1) LIMIT 1) AS carga_horaria1,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 2 LIMIT 1) LIMIT 1) AS carga_horaria2,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 3 LIMIT 1) LIMIT 1) AS carga_horaria3,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 4 LIMIT 1) LIMIT 1) AS carga_horaria4,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 5 LIMIT 1) LIMIT 1) AS carga_horaria5,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 6 LIMIT 1) LIMIT 1) AS carga_horaria6,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 7 LIMIT 1) LIMIT 1) AS carga_horaria7,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 8 LIMIT 1) LIMIT 1) AS carga_horaria8,

  (SELECT he.carga_horaria
   FROM pmieducar.historico_escolar he
   WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
     AND he.ativo = 1
     AND he.extra_curricular = 1
     AND he.ano =
       (SELECT ano
        FROM pmieducar.historico_escolar he
        WHERE he.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
          AND he.ativo = 1
          AND he.sequencial =
            (SELECT max(hee.sequencial)
             FROM pmieducar.historico_escolar hee
             WHERE hee.ref_cod_aluno = he.ref_cod_aluno
               AND substring(he.nm_serie,1,1) = substring(hee.nm_serie,1,1)
               AND hee.ativo = 1
               AND hee.extra_curricular = 0)
          AND substring(he.nm_serie,1,1) = 9 LIMIT 1) LIMIT 1) AS carga_horaria9
FROM pmieducar.historico_disciplinas
INNER JOIN pmieducar.historico_escolar ON (historico_escolar.ref_cod_aluno = historico_disciplinas.ref_ref_cod_aluno
                                           AND historico_escolar.sequencial = historico_disciplinas.ref_sequencial)
WHERE historico_escolar.extra_curricular = 1
  AND historico_escolar.ativo = 1
  AND ref_ref_cod_aluno = 7108
GROUP BY ref_ref_cod_aluno,
         fcn_upper(nm_disciplina)
ORDER BY fcn_upper(nm_disciplina);


ALTER TABLE relatorio.view_historico_9anos_extra_curricular OWNER TO ieducar;