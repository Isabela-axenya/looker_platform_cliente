# The name of this view in Looker is "Zold Beneficios Hubspot"
view: zold_beneficios_hubspot {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.zold_beneficios_hubspot` ;;

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

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: cobertura {
    type: string
    sql: ${TABLE}.cobertura ;;
  }

  dimension: codigo_na_operadora {
    type: string
    sql: ${TABLE}.codigo_na_operadora ;;
  }

  dimension: contrato {
    type: string
    sql: ${TABLE}.contrato ;;
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

  dimension: empresa {
    type: string
    sql: ${TABLE}.empresa ;;
  }

  dimension: ha_copart {
    type: string
    sql: ${TABLE}.ha_copart ;;
  }

  dimension: ha_reembolso {
    type: string
    sql: ${TABLE}.ha_reembolso ;;
  }

  dimension: nome_plano {
    type: string
    sql: ${TABLE}.nome_plano ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.operadora ;;
  }

  dimension: premio_medio {
    type: number
    sql: ${TABLE}.premio_medio ;;
  }

  dimension: premio_total {
    type: number
    sql: ${TABLE}.premio_total ;;
  }

  dimension: reembolso_consultas {
    type: string
    sql: ${TABLE}.reembolso_consultas ;;
  }

  dimension: subcontrato {
    type: string
    sql: ${TABLE}.subcontrato ;;
  }

  dimension: tipo_custo_premio {
    type: string
    sql: ${TABLE}.tipo_custo_premio ;;
  }
  measure: count {
    type: count
  }
}
