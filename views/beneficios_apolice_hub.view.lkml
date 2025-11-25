# The name of this view in Looker is "Beneficios Apolice Hub"
view: beneficios_apolice_hub {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.beneficios_apolice_hub` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Abrangencia" in Explore.

  dimension: abrangencia {
    type: string
    sql: ${TABLE}.abrangencia ;;
  }

  dimension: acomodacao {
    type: string
    sql: ${TABLE}.acomodacao ;;
  }

  dimension: beneficiarios {
    type: number
    sql: ${TABLE}.beneficiarios ;;
  }

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

  dimension: contrato {
    type: string
    sql: ${TABLE}.contrato ;;
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

  dimension: desc_reembolso {
    type: string
    sql: ${TABLE}.desc_reembolso ;;
  }

  dimension: descricao_copart {
    type: string
    sql: ${TABLE}.descricao_copart ;;
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

  dimension: ha_copart {
    type: string
    sql: ${TABLE}.ha_copart ;;
  }

  dimension: ha_reembolso {
    type: string
    sql: ${TABLE}.ha_reembolso ;;
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

  dimension: nome_plano {
    type: string
    sql: ${TABLE}.nome_plano ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: periodo_avaliativo {
    type: string
    sql: ${TABLE}.periodo_avaliativo ;;
  }

  dimension: premio {
    type: number
    sql: ${TABLE}.premio ;;
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

  dimension: reembolso_consultas {
    type: number
    sql: ${TABLE}.reembolso_consultas ;;
  }

  dimension: regra_copart {
    type: string
    sql: ${TABLE}.regra_copart ;;
  }

  dimension: subcontrato {
    type: string
    sql: ${TABLE}.subcontrato ;;
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
