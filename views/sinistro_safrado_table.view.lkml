# The name of this view in Looker is "Sinistro Safrado Table"
view: sinistro_safrado_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.sinistro_safrado_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Data Atendimento" in Explore.

  dimension: data_atendimento {
    type: string
    sql: ${TABLE}.data_atendimento ;;
  }

  dimension: data_competencia {
    type: string
    sql: ${TABLE}.data_competencia ;;
  }

  dimension: diferenca_meses {
    type: number
    sql: ${TABLE}.diferenca_meses ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: percentual_acumulado {
    type: number
    sql: ${TABLE}.percentual_acumulado ;;
  }

  dimension: percentual_sinistro {
    type: number
    sql: ${TABLE}.percentual_sinistro ;;
  }

  dimension: sinistro {
    type: number
    sql: ${TABLE}.sinistro ;;
  }

  dimension: sinistro_acumulado {
    type: number
    sql: ${TABLE}.sinistro_acumulado ;;
  }

  dimension: sinistro_max {
    type: number
    sql: ${TABLE}.sinistro_max ;;
  }
  measure: count {
    type: count
  }
}
