# The name of this view in Looker is "Exames Pre Natais"
view: exames_pre_natais {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.exames_pre_natais` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Beneficiary Name" in Explore.

  dimension: beneficiary_name {
    type: string
    sql: ${TABLE}.beneficiary_name ;;
  }

  dimension: carteirinha {
    type: string
    sql: ${TABLE}.carteirinha ;;
  }

  dimension: classificacao {
    type: string
    sql: ${TABLE}.classificacao ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_parto {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_parto ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: faixa_etaria {
    type: string
    sql: ${TABLE}.Faixa_Etaria ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: plano {
    type: string
    sql: ${TABLE}.plano ;;
  }

  dimension: sub_estipulante {
    type: string
    sql: ${TABLE}.Sub_Estipulante ;;
  }

  dimension: titularidade {
    type: string
    sql: ${TABLE}.Titularidade ;;
  }

  dimension: total_exames_realizados {
    type: number
    sql: ${TABLE}.total_exames_realizados ;;
  }

  dimension: tuss_40302709 {
    type: number
    sql: ${TABLE}.TUSS_40302709 ;;
  }

  dimension: tuss_40304353 {
    type: number
    sql: ${TABLE}.TUSS_40304353 ;;
  }

  dimension: tuss_40304361 {
    type: number
    sql: ${TABLE}.TUSS_40304361 ;;
  }

  dimension: tuss_40307018 {
    type: number
    sql: ${TABLE}.TUSS_40307018 ;;
  }

  dimension: tuss_40307735_40308286_40307026_40307182_40307760_40311210 {
    type: number
    sql: ${TABLE}.TUSS_40307735_40308286_40307026_40307182_40307760_40311210 ;;
  }

  dimension: tuss_40307824_40307832_40307182_40307026 {
    type: number
    sql: ${TABLE}.TUSS_40307824_40307832_40307182_40307026 ;;
  }

  dimension: tuss_40310213_40307182 {
    type: number
    sql: ${TABLE}.TUSS_40310213_40307182 ;;
  }

  dimension: tuss_40311210 {
    type: number
    sql: ${TABLE}.TUSS_40311210 ;;
  }

  dimension: tuss_40324079_40307182_28066642_28069099_40307026_40307166_40307174_40307182_40323919 {
    type: number
    sql: ${TABLE}.TUSS_40324079_40307182_28066642_28069099_40307026_40307166_40307174_40307182_40323919 ;;
  }

  dimension: tuss_40403173_31309054_40304280_40304299_40403173_40403181_40403327_40403327 {
    type: number
    sql: ${TABLE}.TUSS_40403173_31309054_40304280_40304299_40403173_40403181_40403327_40403327 ;;
  }

  dimension: tuss_40901238_40901246 {
    type: number
    sql: ${TABLE}.TUSS_40901238_40901246 ;;
  }
  measure: count {
    type: count
    drill_fields: [beneficiary_name]
  }
}
