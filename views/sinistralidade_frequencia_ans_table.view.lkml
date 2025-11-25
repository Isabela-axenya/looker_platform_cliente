# The name of this view in Looker is "Sinistralidade Frequencia Ans Table"
view: sinistralidade_frequencia_ans_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.sinistralidade_frequencia_ans_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Beneficiarios" in Explore.

  dimension: beneficiarios {
    type: number
    sql: ${TABLE}.beneficiarios ;;
  }

  dimension: beneficiarios_ans {
    type: number
    sql: ${TABLE}.beneficiarios_ans ;;
  }

  dimension: breakeven {
    type: number
    sql: ${TABLE}.breakeven ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: custo_sinistro {
    type: number
    sql: ${TABLE}.custo_sinistro ;;
  }

  dimension: custo_sinistro_ans {
    type: number
    sql: ${TABLE}.custo_sinistro_ans ;;
  }

  dimension: custo_sinistro_sem_top_3 {
    type: number
    sql: ${TABLE}.custo_sinistro_sem_top_3 ;;
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

  dimension_group: data_sinistro {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Data_Sinistro ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: eventos {
    type: number
    sql: ${TABLE}.Eventos ;;
  }

  dimension: eventos_ans {
    type: number
    sql: ${TABLE}.Eventos_ans ;;
  }

  dimension: eventos_sem_top_3 {
    type: number
    sql: ${TABLE}.eventos_sem_top_3 ;;
  }

  dimension: frequencia_ans_2023 {
    type: number
    sql: ${TABLE}.frequencia_ans_2023 ;;
  }

  dimension: frequencia_uso_evento {
    type: number
    sql: ${TABLE}.frequencia_uso_evento ;;
  }

  dimension: modalidade_operadora {
    type: string
    sql: ${TABLE}.modalidade_operadora ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.Periodo ;;
  }

  dimension: premio_per_capita_periodo {
    type: number
    sql: ${TABLE}.premio_per_capita_periodo ;;
  }

  dimension: premio_total_periodo {
    type: number
    sql: ${TABLE}.premio_total_periodo ;;
  }

  dimension: sinistralidade_periodo {
    type: number
    sql: ${TABLE}.sinistralidade_periodo ;;
  }

  dimension: sinistro_per_capita_evento {
    type: number
    sql: ${TABLE}.sinistro_per_capita_evento ;;
  }

  dimension: sinistro_per_capita_evento_ans {
    type: number
    sql: ${TABLE}.sinistro_per_capita_evento_ans ;;
  }

  dimension: sinistro_per_capita_periodo {
    type: number
    sql: ${TABLE}.sinistro_per_capita_periodo ;;
  }

  dimension: sinistro_total_ans {
    type: number
    sql: ${TABLE}.sinistro_total_ans ;;
  }

  dimension: sinistro_total_periodo {
    type: number
    sql: ${TABLE}.sinistro_total_periodo ;;
  }

  dimension: tamanho {
    type: string
    sql: ${TABLE}.Tamanho ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.Tipo_Evento ;;
  }

  dimension: vidas_total_periodo {
    type: number
    sql: ${TABLE}.vidas_total_periodo ;;
  }
  measure: count {
    type: count
  }
}
