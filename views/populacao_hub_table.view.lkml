# The name of this view in Looker is "Populacao Hub Table"
view: populacao_hub_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.populacao_hub_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Beneficiary Cpf" in Explore.

  dimension: beneficiary_cpf {
    type: string
    sql: ${TABLE}.beneficiary_cpf ;;
  }

  dimension: beneficiary_gender {
    type: string
    sql: ${TABLE}.beneficiary_gender ;;
  }

  dimension: beneficiary_id {
    type: string
    sql: ${TABLE}.beneficiary_id ;;
  }

  dimension: beneficiary_status {
    type: string
    sql: ${TABLE}.beneficiary_status ;;
  }

  dimension: beneficiary_type {
    type: string
    sql: ${TABLE}.beneficiary_type ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_nascimento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Data_Nascimento ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: faixa_idade {
    type: string
    sql: ${TABLE}.Faixa_Idade ;;
  }

  dimension: idade {
    type: number
    sql: ${TABLE}.Idade ;;
  }

  dimension: operator_name {
    type: string
    sql: ${TABLE}.operator_name ;;
  }

  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }
  measure: count {
    type: count
    drill_fields: [operator_name, plan_name]
  }
}
