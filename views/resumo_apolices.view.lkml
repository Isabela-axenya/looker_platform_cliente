# The name of this view in Looker is "Resumo Apolices"
view: resumo_apolices {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.resumo_apolices` ;;

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

  dimension: contratacao {
    type: string
    sql: ${TABLE}.contratacao ;;
  }

  dimension: contribuicao_dependente {
    type: string
    sql: ${TABLE}.contribuicao_dependente ;;
  }

  dimension: contribuicao_titular {
    type: string
    sql: ${TABLE}.contribuicao_titular ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_fim_apolice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_fim_apolice ;;
  }

  dimension_group: data_inicio_apolice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_inicio_apolice ;;
  }

  dimension: desc_elegibilidade {
    type: string
    sql: ${TABLE}.desc_elegibilidade ;;
  }

  dimension: elegibilidade {
    type: string
    sql: ${TABLE}.elegibilidade ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: grupo_elegibilidade {
    type: string
    sql: ${TABLE}.grupo_elegibilidade ;;
  }

  dimension: mes_aniversario_contrato {
    type: string
    sql: ${TABLE}.mes_aniversario_contrato ;;
  }

  dimension: modalidade_operadora {
    type: string
    sql: ${TABLE}.modalidade_operadora ;;
  }

  dimension: multa_cancelamento {
    type: string
    sql: ${TABLE}.multa_cancelamento ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: produto {
    type: string
    sql: ${TABLE}.produto ;;
  }

  dimension: reajuste_final {
    type: number
    sql: ${TABLE}.reajuste_final ;;
  }

  dimension: reajuste_proposto_axenya {
    type: number
    sql: ${TABLE}.reajuste_proposto_axenya ;;
  }

  dimension: reajuste_proposto_operadora {
    type: number
    sql: ${TABLE}.reajuste_proposto_operadora ;;
  }

  dimension: regra_copart {
    type: string
    sql: ${TABLE}.regra_copart ;;
  }

  dimension: tipo_contratacao {
    type: string
    sql: ${TABLE}.tipo_contratacao ;;
  }

  dimension: tipo_venda {
    type: string
    sql: ${TABLE}.tipo_venda ;;
  }

  dimension_group: vencimento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.vencimento ;;
  }
  measure: count {
    type: count
  }
}
