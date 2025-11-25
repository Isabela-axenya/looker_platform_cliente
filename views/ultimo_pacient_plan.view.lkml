view: ultimo_pacient_plan {
  derived_table: {
    sql:
    SELECT
      person_id,
      answer_value
    FROM (
      SELECT
        person_id,
        answer_value,
        ROW_NUMBER() OVER (
          PARTITION BY person_id
          ORDER BY created_at DESC
        ) AS rn
      FROM sinistralidade.mission_control_tables.applied_questionnaire_report
      WHERE question_key = 'patient_plan'
        AND questionnaire_key = 'captation'
    )
    WHERE rn = 1
      ;;
  }

  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: answer_value {
    sql: ${TABLE}.answer_value ;;
  }

  dimension: plano_paciente_fatorado {
    sql:
    CASE ${TABLE}.answer_value
      WHEN '1' THEN 'incluir em linha de monitoramento'
      WHEN '2' THEN 'ligar depois'
      WHEN '3' THEN 'não elegível'
      WHEN '4' THEN 'recusou'
      ELSE ${TABLE}.answer_value
    END
  ;;
  }

  ##### % Sucesso de Captação
  measure: distinct_included_in_monitoring_fatorado {
    label: "Pessoas Incluídas no Monitoramento_fatorado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [plano_paciente_fatorado: "incluir em linha de monitoramento"]
  }

  measure: distinct_monitoring_base_fatorado {
    label: "Base de Avaliação (Total)_fatorado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [plano_paciente_fatorado: "incluir em linha de monitoramento, não elegível, recusou"]
  }


  measure: monitoring_success_rate_fatorado {
    label: "% Sucesso de Captação_fatorado"
    type: number
    value_format_name: percent_2
    sql: ${distinct_included_in_monitoring_fatorado} / NULLIF(${distinct_monitoring_base_fatorado}, 0) ;;
  }

  ##### % Recusas de Captação
  measure: distinct_excluded_in_monitoring_fatorado {
    label: "Pessoas Excluídas (Recusas)_fatorado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [plano_paciente_fatorado: "recusou"]
  }

  measure: monitoring_refusal_rate_fatorado {
    label: "% Recusas na Captação_fatorado"
    type: number
    value_format_name: percent_2
    sql: ${distinct_excluded_in_monitoring_fatorado} / NULLIF(${distinct_monitoring_base_fatorado}, 0) ;;
  }

  ##### % Não Elegíveis na Captação
  measure: distinct_not_eligible_fatorado {
    label: "Pessoas Não Elegívei_fatorados"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [plano_paciente_fatorado: "não elegível"]
  }

  measure: not_eligible_rate_fatorado {
    label: "% Não Elegíveis na Captação_fatorado"
    type: number
    value_format_name: percent_2
    sql: ${distinct_not_eligible_fatorado} / NULLIF(${distinct_monitoring_base_fatorado}, 0) ;;
  }
}
