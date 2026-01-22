view: pessoas_captadas {
  derived_table: {
    sql:
      SELECT
        qr.person_id,
        p.company_name,
        p.name,
        qr.applied_questionnaire_status,
        DATE(qr.created_at) AS data_questionario,
        ms.status,
        DATE(ms.created_at) AS data_inclusao_status
      FROM sinistralidade.mission_control_tables.applied_questionnaire_report qr
      LEFT JOIN sinistralidade.mission_control_tables.person p
          ON p.id = qr.person_id
      LEFT JOIN sinistralidade.mission_control_tables.monitoring_status ms
          ON ms.person_id = qr.person_id
      WHERE questionnaire_key = 'captation'
        AND qr.question_key = 'patient_plan'
        AND qr.answer_value = '1'
        AND qr.applied_questionnaire_status = 'COMPLETED'
        AND ms.status IN ('CAPTADO', 'ACQUISITION')
        AND p.deleted_at IS NULL
        AND DATE(qr.created_at) = DATE(ms.created_at)
      ;;
  }

  dimension: company_name { sql: ${TABLE}.company_name ;; }
  dimension: person_id {hidden: yes sql: ${TABLE}.person_id ;;}
  dimension: name {hidden: yes  sql: ${TABLE}.name ;; }
  dimension: applied_questionnaire_status { sql: ${TABLE}.applied_questionnaire_status ;; }
  dimension: data_questionario { type: date sql: ${TABLE}.data_questionario ;; }
  dimension: status { sql: ${TABLE}.status ;; }
  dimension: data_inclusao_status { type: date sql: ${TABLE}.data_inclusao_status ;; }
  dimension: mes_ano_captacao {
    label: "Mês/Ano Captação"
    type: string
    sql: FORMAT_DATE('%Y-%m', ${data_questionario}) ;;
  }

}
