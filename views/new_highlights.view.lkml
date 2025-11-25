# The name of this view in Looker is "New Highlights"
view: new_highlights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.new_highlights` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Breakeven" in Explore.

  dimension: breakeven {
    type: number
    sql: ${TABLE}.breakeven ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: coparticipacao_total_periodo {
    type: number
    sql: ${TABLE}.coparticipacao_total_periodo ;;
  }

  dimension: data_ref {
    type: string
    sql: ${TABLE}.Data_Ref ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: maior_sinistro_usuario_periodo {
    type: number
    sql: ${TABLE}.maior_sinistro_usuario_periodo ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: premio {
    type: number
    sql: ${TABLE}.premio ;;
  }

  dimension: sinistralidade_periodo {
    type: number
    sql: ${TABLE}.sinistralidade_periodo ;;
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

  dimension: vidas {
    type: number
    sql: ${TABLE}.vidas ;;
  }
  measure: count {
    type: count
  }
}
