view: ultimo_status_questionario_captacao {
  derived_table: {
    sql:
      SELECT
        person_id,
        applied_questionnaire_status,
        DATA_RESPOSTA_QUESTIONARIO
      FROM (
        SELECT
          person_id,
          applied_questionnaire_status,
          created_at AS DATA_RESPOSTA_QUESTIONARIO,
          ROW_NUMBER() OVER (
            PARTITION BY person_id
            ORDER BY created_at DESC
          ) AS rn
        FROM sinistralidade.mission_control_tables.applied_questionnaire_report
        WHERE questionnaire_key = 'captation'
      )
      WHERE rn = 1
      ;;
  }


  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: status_questionario_captacao {
    sql: ${TABLE}.applied_questionnaire_status ;;
  }

  dimension_group: data_resposta_questionario {
    label: "DATA_RESPOSTA_QUESTIONARIO"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.DATA_RESPOSTA_QUESTIONARIO ;;
  }

}
