# The name of this view in Looker is "Sinistralidade Agrupada Apolice Table"
view: sinistralidade_agrupada_apolice_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.sinistralidade_agrupada_apolice_table` ;;

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

  dimension: codigo_contrato {
    type: string
    sql: ${TABLE}.codigo_contrato ;;
  }

  dimension: coparticipacao {
    type: number
    sql: ${TABLE}.coparticipacao ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
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
    sql: ${TABLE}.periodo ;;
  }

  dimension: premio {
    type: number
    sql: ${TABLE}.premio ;;
  }

  dimension: premio_per_capita {
    type: number
    sql: ${TABLE}.premio_per_capita ;;
  }

  dimension: sinistralidade {
    type: number
    sql: ${TABLE}.sinistralidade ;;
  }

  dimension: sinistro {
    type: number
    sql: ${TABLE}.sinistro ;;
  }

  dimension: sinistro_per_capita {
    type: number
    sql: ${TABLE}.sinistro_per_capita ;;
  }

  dimension: vidas {
    type: number
    sql: ${TABLE}.vidas ;;
  }
  measure: count {
    type: count
  }
}
