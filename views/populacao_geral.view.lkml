# The name of this view in Looker is "Populacao Geral"
view: populacao_geral {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.populacao_geral` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Beneficiarios" in Explore.

  dimension: beneficiarios {
    type: number
    sql: ${TABLE}.beneficiarios ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: data_sinistro {
    type: string
    sql: ${TABLE}.Data_Sinistro ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: faixa_etaria {
    type: string
    sql: ${TABLE}.Faixa_Etaria ;;
  }

  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }

  dimension: idade {
    type: number
    sql: ${TABLE}.Idade ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: titularidade {
    type: string
    sql: ${TABLE}.Titularidade ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }
  measure: count {
    type: count
  }
}
