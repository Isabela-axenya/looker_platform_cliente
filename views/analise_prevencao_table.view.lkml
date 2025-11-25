# The name of this view in Looker is "Analise Prevencao Table"
view: analise_prevencao_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.analise_prevencao_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: elegiveis_ca_mama {
    type: number
    sql: ${TABLE}.Elegiveis_Ca_Mama ;;
  }

  dimension: elegiveis_ca_prostata {
    type: number
    sql: ${TABLE}.Elegiveis_Ca_Prostata ;;
  }

  dimension: elegiveis_ca_utero {
    type: number
    sql: ${TABLE}.Elegiveis_Ca_Utero ;;
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

  dimension: prevenidos_mama {
    type: number
    sql: ${TABLE}.Prevenidos_Mama ;;
  }

  dimension: prevenidos_prostata {
    type: number
    sql: ${TABLE}.Prevenidos_Prostata ;;
  }

  dimension: prevenidos_utero {
    type: number
    sql: ${TABLE}.Prevenidos_Utero ;;
  }

  dimension: titularidade {
    type: string
    sql: ${TABLE}.Titularidade ;;
  }
  measure: count {
    type: count
  }
}
