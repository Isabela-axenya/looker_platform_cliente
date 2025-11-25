view: tempo_captacao_abandono {
  derived_table: {
    sql:
    WITH status_ordenado AS (
      SELECT
        person_id,
        status_monitoramento,
        CAST(status_criado AS TIMESTAMP) AS status_criado
      FROM ${gerencial_monitoramento.SQL_TABLE_NAME}
      WHERE status_monitoramento IS NOT NULL
    ),
    primeiro_status_final AS (
      SELECT
        person_id,
        status_monitoramento AS status_inicial,
        status_criado AS data_captado
      FROM (
        SELECT
          s.person_id,
          s.status_monitoramento,
          s.status_criado,
          ROW_NUMBER() OVER (
            PARTITION BY s.person_id
            ORDER BY s.status_criado ASC
          ) AS rn
        FROM status_ordenado s
        WHERE s.status_monitoramento IN (
          'ACQUISITION',
          'BEING_MONITORED',
          'COORDINATED',
          'MONITORING_DIFFICULTY_1',
          'MONITORING_DIFFICULTY_2',
          'PENDING_MONITORING_HR'
        )
      ) t
      WHERE rn = 1
    ),
    tempo_acq_aband AS (
      SELECT
        s.person_id,
        s.status_monitoramento AS status_final,
        MIN(CAST(s.status_criado AS TIMESTAMP)) AS inicio_abandono
      FROM status_ordenado s
      WHERE s.status_monitoramento IN (
        'MONITORING_ABANDONED',
        'ACQUISITION_ABANDONED',
        'SELF_DISCHARGED',
        'DISCHARGED',
        'NON_ENGEGEMENT'
      )
      GROUP BY s.person_id, s.status_monitoramento
    )
    SELECT
      f.person_id,
      MIN(
        ROUND(
          TIMESTAMP_DIFF(
            t.inicio_abandono,
            f.data_captado,
            SECOND
          ),
          0
        )
      ) AS segundos_entre_captado_abandono
    FROM primeiro_status_final f
    JOIN tempo_acq_aband t
      ON f.person_id = t.person_id
    WHERE t.inicio_abandono > f.data_captado
    GROUP BY f.person_id
    ;;
  }

  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: cap_aband_alta {
    label: "Segundos entre Captado e Abandono/Alta"
    type: number
    sql: ${TABLE}.segundos_entre_captado_abandono ;;
  }

##### Tempo entre Captado → Abandono/Alta
  dimension: tempo_capta_aband_alta {
    label: "Tempo (dias) entre Captado e Abandono/Alta"
    type: string
    sql:
    CASE
        WHEN ${cap_aband_alta} IS NULL OR ${cap_aband_alta} <= 0 THEN NULL
        WHEN ${cap_aband_alta} <= 2592000 THEN 'a. Até 30 dias'
        WHEN ${cap_aband_alta} <= 7776000 THEN 'b. 31 a 90 dias'
        WHEN ${cap_aband_alta} <= 15552000 THEN 'c. 91 a 180 dias'
        WHEN ${cap_aband_alta} <= 31536000 THEN 'd. 181 a 365 dias'
        WHEN ${cap_aband_alta} <= 63072000 THEN 'e. 1 a 2 anos'
        WHEN ${cap_aband_alta} <= 94608000 THEN 'f. 2 a 3 anos'
        ELSE null
    END;;
  }

}
