# The name of this view in Looker is "Sinistralidade Core Table"
view: sinistralidade_core_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.sinistralidade_core_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: competencias_calculadas {
    type: number
    sql: ${TABLE}.competencias_calculadas ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.empresa ;;
  }

  dimension: nova_sinistralidade {
    type: number
    sql: ${TABLE}.nova_sinistralidade ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.operadora ;;
  }

  dimension: outliers {
    type: number
    sql: ${TABLE}.outliers ;;
  }

  dimension: percentual_outliers {
    type: number
    sql: ${TABLE}.percentual_outliers ;;
  }

  dimension: premio_total {
    type: number
    sql: ${TABLE}.premio_total ;;
  }

  dimension: sinistralidade_media {
    type: number
    sql: ${TABLE}.sinistralidade_media ;;
  }

  dimension: sinistro_outliers {
    type: number
    sql: ${TABLE}.sinistro_outliers ;;
  }

  dimension: sinistro_sem_outliers {
    type: number
    sql: ${TABLE}.sinistro_sem_outliers ;;
  }

  dimension: sinistro_total {
    type: number
    sql: ${TABLE}.sinistro_total ;;
  }

  dimension: vidas_ultimo_mes {
    type: number
    sql: ${TABLE}.vidas_ultimo_mes ;;
  }
  measure: count {
    type: count
  }
}
