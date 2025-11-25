view: tempo_primeiro_monitoramento {
  derived_table: {
    sql:
    SELECT
      b.person_id,
      TIMESTAMP_DIFF(
        MIN(
          CASE
            WHEN b.tipo_contato = 'MONITORING_CONTACT'
              AND CAST(b.data_ligacao AS TIMESTAMP) >= TIMESTAMP("2024-04-01 00:00:00")
            THEN CAST(b.data_ligacao AS TIMESTAMP)
          END
        ),
        MIN(
          CASE
            WHEN b.status_monitoramento IN (
              'ACQUISITION',
              'BEING_MONITORED',
              'COORDINATED',
              'MONITORING_DIFFICULTY_1',
              'MONITORING_DIFFICULTY_2',
              'PENDING_MONITORING_HR'
            )
            AND CAST(b.status_criado AS TIMESTAMP) >= TIMESTAMP("2024-04-01 00:00:00")
            THEN CAST(b.status_criado AS TIMESTAMP)
          END
        ),
        SECOND
      ) AS tempo_primeiro_monitoramento
    FROM ${gerencial_monitoramento.SQL_TABLE_NAME} b
    WHERE b.status_monitoramento IN (
      'ACQUISITION',
      'BEING_MONITORED',
      'COORDINATED',
      'MONITORING_DIFFICULTY_1',
      'MONITORING_DIFFICULTY_2',
      'PENDING_MONITORING_HR'
    )
    GROUP BY b.person_id
    ;;
  }

  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: tempo_primeiro_monitoramento {
    label: "Tempo até 1º Monitoramento (s)"
    type: number
    sql: ${TABLE}.tempo_primeiro_monitoramento ;;
  }

  ##### Tempo entre Captado → 1ª Ligação de Monitoramento
  dimension: tempo_primeiro_monitoramento_cat {
    label: "Tempo entre Captado e 1ª Ligação de Monitoramento"
    type: string
    sql:
     CASE
      WHEN ${tempo_primeiro_monitoramento} / 86400 <= 2 THEN 'a. 0 a 2 dias'
      WHEN ${tempo_primeiro_monitoramento} / 86400 <= 5 THEN 'b. 3 a 5 dias'
      WHEN ${tempo_primeiro_monitoramento} / 86400 <= 30 THEN 'c. 6 a 30 dias'
      WHEN ${tempo_primeiro_monitoramento} / 86400 <= 90 THEN 'd. 31 a 90 dias'
      WHEN ${tempo_primeiro_monitoramento} / 86400 <= 180 THEN 'e. 91 a 180 dias'
      ELSE null
    END ;;
  }

}
