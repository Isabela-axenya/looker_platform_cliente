# The name of this view in Looker is "Sinistralidade Sem Ofensores"
view: sinistralidade_sem_ofensores {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.sinistralidade_sem_ofensores` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: data_ref {
    type: string
    sql: ${TABLE}.Data_Ref ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: sinistralidade {
    type: number
    sql: ${TABLE}.sinistralidade ;;
  }

  dimension: sinistro_rank_1 {
    type: number
    sql: ${TABLE}.sinistro_rank_1 ;;
  }

  dimension: sinistro_rank_2 {
    type: number
    sql: ${TABLE}.sinistro_rank_2 ;;
  }

  dimension: sinistro_rank_3 {
    type: number
    sql: ${TABLE}.sinistro_rank_3 ;;
  }

  dimension: sinistro_rank_4 {
    type: number
    sql: ${TABLE}.sinistro_rank_4 ;;
  }

  dimension: sinistro_rank_5 {
    type: number
    sql: ${TABLE}.sinistro_rank_5 ;;
  }

  dimension: sinistro_total_periodo {
    type: number
    sql: ${TABLE}.sinistro_total_periodo ;;
  }
  measure: count {
    type: count
  }
}
