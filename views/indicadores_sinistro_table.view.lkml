# The name of this view in Looker is "Indicadores Sinistro Table"
view: indicadores_sinistro_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.indicadores_sinistro_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: custo_medio {
    type: number
    sql: ${TABLE}.custo_medio ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    sql: ${TABLE}.eventos ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: premio_periodo {
    type: number
    sql: ${TABLE}.premio_periodo ;;
  }

  dimension: rede_reembolso {
    type: string
    sql: ${TABLE}.Rede_reembolso ;;
  }

  dimension: ref_meses {
    type: string
    sql: ${TABLE}.ref_meses ;;
  }

  dimension: sinistralidade_periodo {
    type: number
    sql: ${TABLE}.sinistralidade_periodo ;;
  }

  dimension: sinistro {
    type: number
    sql: ${TABLE}.sinistro ;;
  }

  dimension: sinistro_10_maiores {
    type: number
    sql: ${TABLE}.sinistro_10_maiores ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.Tipo_Evento ;;
  }
  measure: count {
    type: count
  }
}
