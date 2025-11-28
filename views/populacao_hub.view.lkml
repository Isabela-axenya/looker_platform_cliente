# The name of this view in Looker is "Populacao Hub"
view: populacao_hub {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dashboard_health_team.populacao_hub` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ativos Acumulados" in Explore.

  dimension: ativos_acumulados {
    type: number
    sql: ${TABLE}.ativos_acumulados ;;
  }

  dimension: beneficiary_address_city {
    type: string
    sql: ${TABLE}.beneficiary_address_city ;;
  }

  dimension: beneficiary_address_state {
    type: string
    sql: ${TABLE}.beneficiary_address_state ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: beneficiary_admission {
    label: "Data de Admissão"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.beneficiary_admission_date ;;
  }
  dimension: data_admissao_mes_ano_ord_desc {
    hidden: yes
    type: number
    sql: - (EXTRACT(YEAR FROM ${beneficiary_admission_date}) * 100 + EXTRACT(MONTH FROM ${beneficiary_admission_date})) ;;
  }

  dimension: data_admissao_mes_ano {
    type: string
    label: "Mês/Ano Admissão"
    sql: FORMAT_DATE('%m/%Y', ${beneficiary_admission_date}) ;;
    order_by_field: data_admissao_mes_ano_ord_desc
  }

  dimension: beneficiary_age {
    type: number
    sql: ${TABLE}.beneficiary_age ;;
  }

  dimension: beneficiary_age_range {
    label: "Faixa Etária"
    type: string
    sql: ${TABLE}.beneficiary_age_range ;;
  }

  dimension: beneficiary_benefit_id_odonto {
    type: string
    sql: ${TABLE}.beneficiary_benefit_id_odonto ;;
  }

  dimension: beneficiary_benefit_id_saude {
    type: string
    sql: ${TABLE}.beneficiary_benefit_id_saude ;;
  }

  dimension_group: beneficiary_birth {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.beneficiary_birth_date ;;
  }

  dimension: beneficiary_client_registration {
    type: string
    sql: ${TABLE}.beneficiary_client_registration ;;
  }

  dimension: beneficiary_client_role {
    type: string
    sql: ${TABLE}.beneficiary_client_role ;;
  }

  dimension: beneficiary_coparticipacao {
    type: string
    sql: ${TABLE}.beneficiary_coparticipacao ;;
  }

  dimension: beneficiary_coparticipacao_descricao {
    type: string
    sql: ${TABLE}.beneficiary_coparticipacao_descricao ;;
  }

  dimension: beneficiary_cpf {
    type: string
    sql: ${TABLE}.beneficiary_cpf ;;
  }

  dimension_group: beneficiary_data_inicio_de_vigencia {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.beneficiary_data_inicio_de_vigencia ;;
  }

  dimension: beneficiary_dependency_relation {
    type: string
    sql: ${TABLE}.beneficiary_dependency_relation ;;
  }

  dimension_group: beneficiary_duration_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.beneficiary_duration_end_date ;;
  }

  dimension: beneficiary_email {
    type: string
    sql: ${TABLE}.beneficiary_email ;;
  }

  dimension: beneficiary_gender {
    type: string
    sql: ${TABLE}.beneficiary_gender ;;
  }

  dimension: beneficiary_ha_reembolso_diferenciado {
    type: string
    sql: ${TABLE}.beneficiary_ha_reembolso_diferenciado ;;
  }

  dimension: beneficiary_holder_id {
    type: string
    sql: ${TABLE}.beneficiary_holder_id ;;
  }

  dimension: beneficiary_id {
    type: string
    sql: ${TABLE}.beneficiary_id ;;
  }

  dimension_group: beneficiary_inactivation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.beneficiary_inactivation_date ;;
  }

  dimension: beneficiary_mother_name {
    type: string
    sql: ${TABLE}.beneficiary_mother_name ;;
  }

  dimension: beneficiary_name {
    type: string
    sql: ${TABLE}.beneficiary_name ;;
  }

  dimension: beneficiary_phones {
    type: string
    sql: ${TABLE}.beneficiary_phones ;;
  }

  dimension: beneficiary_reembolso {
    type: number
    sql: ${TABLE}.beneficiary_reembolso ;;
  }

  dimension: beneficiary_status {
    type: string
    sql: ${TABLE}.beneficiary_status ;;
  }

  dimension: beneficiary_type {
    type: string
    sql: INITCAP(${TABLE}.beneficiary_type) ;;
  }
  dimension: beneficiary_retiree {
    type: string
    sql: INITCAP(${TABLE}.beneficiary_retiree) ;;
  }
  dimension: beneficiary_redeemed {
    type: string
    sql: INITCAP(${TABLE}.beneficiary_redeemed) ;;
  }

  dimension: card_number {
    type: string
    sql: ${TABLE}.card_number ;;
  }

  dimension: card_status {
    type: string
    sql: ${TABLE}.card_status ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: company_squad {
    type: string
    sql: ${TABLE}.company_squad ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: entradas {
    type: number
    sql: ${TABLE}.entradas ;;
  }

  dimension: operator_id {
    type: string
    sql: ${TABLE}.operator_id ;;
  }

  dimension: operator_name {
    type: string
    sql: ${TABLE}.operator_name ;;
  }

  dimension: plan_name {
    label: "Plano"
    type: string
    sql: ${TABLE}.plan_name ;;
  }

  dimension: plan_operator_code {
    type: string
    sql: ${TABLE}.plan_operator_code ;;
  }

  dimension: plan_provider {
    type: string
    sql: ${TABLE}.plan_provider ;;
  }

  dimension: plan_type {
    label: "Tipo de Plano"
    type: string
    sql: ${TABLE}.plan_type;;
  }
  dimension: plan_type_ajustado {
    type: string
    sql: CASE
          WHEN ${TABLE}.plan_type IN ('vida','seguro_vida') THEN 'Seguro de Vida'
          WHEN ${TABLE}.plan_type = 'saude' THEN 'Saúde'
          WHEN ${TABLE}.plan_type = 'odonto' THEN 'Odonto'
          END;;
  }

  dimension: policy_name {
    type: string
    sql: ${TABLE}.policy_name ;;
  }

  dimension: saidas {
    type: number
    sql: ${TABLE}.saidas ;;
  }

  dimension: status_monitoramento {
    type: string
    sql: ${TABLE}.status_monitoramento ;;
  }

  dimension: subclient_document {
    type: string
    sql: ${TABLE}.subclient_document ;;
  }

  dimension: subclient_name {
    type: string
    sql: ${TABLE}.subclient_name ;;
  }

  dimension: subpolicy_name {
    type: string
    sql: ${TABLE}.subpolicy_name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: media_idade_usuario {
    type: average
    sql: ${beneficiary_age} ;;
    value_format_name: "decimal_0"
  }
  measure: count_distinct_beneficiaries {
    label: "Beneficiários"
    type: count_distinct
    sql: ${beneficiary_id} ;;
  }
  measure: male_count_negative {
    type: number
    sql: -1 * COUNT(DISTINCT CASE WHEN ${beneficiary_gender} = 'Masculino' THEN ${beneficiary_id} END) ;;
    value_format: "#,##0"
    html: {% assign val = male_count_negative._value | abs %}
    {{ val }};;
  }
  measure: female_count {
    type: count_distinct
    sql: CASE WHEN ${beneficiary_gender} = 'Feminino' THEN ${beneficiary_id} END ;;
    value_format: "#,##0"
  }
  measure: titularidade_negativa {
    type: number
    sql: -COUNT(DISTINCT CASE WHEN INITCAP(${beneficiary_type}) = 'Titular' THEN ${beneficiary_id} END) ;;
    html: {% assign val = titularidade_negativa._value | abs %}
    {{ val }};;
  }
  measure: dependencia_positiva {
    type: count_distinct
    sql: CASE WHEN INITCAP(${beneficiary_type}) = 'Dependente' THEN ${beneficiary_id} END ;;
    value_format: "#,##0"
  }
  dimension: age_range_order {
    type: number
    sql:
    CASE
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "59") THEN 0
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "54") THEN 1
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "49") THEN 2
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "44") THEN 3
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "39") THEN 4
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "34") THEN 5
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "29") THEN 6
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "24") THEN 7
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "19") THEN 8
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "18") THEN 9
      WHEN ${beneficiary_age_range} IS NULL THEN 10
    END ;;
  }
  measure: pct_fertil {
    label: "Percentual em Idade Fértil"
    type: number
    sql:
    COUNT(DISTINCT CASE
      WHEN ${beneficiary_age} >= 15 AND ${beneficiary_age} <= 49
      THEN ${beneficiary_id}
    END)
    / COUNT(DISTINCT ${beneficiary_id}) ;;
    value_format_name: "percent_2"
  }
  measure: pct_fertil_titular {
    label: "Percentual em Idade Fértil TITULAR"
    type: number
    sql:
    COUNT(DISTINCT CASE
      WHEN ${beneficiary_age} >= 15 AND ${beneficiary_age} <= 49 AND INITCAP(${beneficiary_type}) = 'Titular'
      THEN ${beneficiary_id}
    END)
    / COUNT(DISTINCT ${beneficiary_id}) ;;
    value_format_name: "percent_2"
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      beneficiary_name,
      subclient_name,
      policy_name,
      subpolicy_name,
      plan_name,
      operator_name,
      beneficiary_mother_name
    ]
  }

}
