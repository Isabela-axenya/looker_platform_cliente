view: aparicao_status_monitoramento {
  derived_table: {
    sql:
      WITH base_gerencial AS (
        SELECT
          gm.person_id,
          gm.status_monitoramento,
      PARSE_DATE('%Y-%m-%d', gm.competencia_status) AS competencia_status_date,
      MIN(PARSE_DATE('%Y-%m-%d', gm.competencia_status)) OVER (
      PARTITION BY gm.person_id, gm.status_monitoramento
      ) AS primeira_competencia_status_date
      FROM ${gerencial_monitoramento.SQL_TABLE_NAME} AS gm
      )

      SELECT
      *
      FROM base_gerencial
      ;;
  }

  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: status_monitoramento {
    sql: ${TABLE}.status_monitoramento ;;
  }

  dimension_group: competencia_status {
    label: "Competência"
    type: time
    datatype: date
    timeframes: [raw, date, month, year]
    sql: ${TABLE}.competencia_status_date ;;
  }

  dimension: primeira_competencia_status {
    type: date
    sql: ${TABLE}.primeira_competencia_status_date ;;
  }

  dimension: aparicao_status {
    label: "Aparição do status (primeira / repetida)"
    type: string
    sql:
      CASE
        WHEN ${competencia_status_date} = ${primeira_competencia_status}
          THEN 'primeira aparição'
        ELSE 'aparições repetidas'
      END ;;
  }
}
