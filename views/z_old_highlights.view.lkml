# The name of this view in Looker is "Z Old Highlights"
view: z_old_highlights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.z_old_highlights` ;;

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

  dimension: custo_coparticipacao {
    type: number
    sql: ${TABLE}.custo_coparticipacao ;;
  }

  dimension: custo_sinistro {
    type: number
    sql: ${TABLE}.custo_sinistro ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_ref {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
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

  dimension: percentual_sinistro {
    type: number
    sql: ${TABLE}.percentual_sinistro ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: premio_per_capita_periodo {
    type: number
    sql: ${TABLE}.premio_per_capita_periodo ;;
  }

  dimension: premio_total_periodo {
    type: number
    sql: ${TABLE}.premio_total_periodo ;;
  }

  dimension: procedimentos {
    type: string
    sql: ${TABLE}.procedimentos ;;
  }

  dimension: rank_usuario {
    type: number
    sql: ${TABLE}.rank_usuario ;;
  }

  dimension: sinistralidade_periodo {
    type: number
    sql: ${TABLE}.sinistralidade_periodo ;;
  }

  dimension: sinistralidade_periodo_sem_usuario_ofensor {
    type: number
    sql: ${TABLE}.sinistralidade_periodo_sem_usuario_ofensor ;;
  }

  dimension: sinistro_total_periodo {
    type: number
    sql: ${TABLE}.sinistro_total_periodo ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }

  dimension: vidas_total_periodo {
    type: number
    sql: ${TABLE}.vidas_total_periodo ;;
  }
  measure: count {
    type: count
  }
}
