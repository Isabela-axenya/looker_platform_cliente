# The name of this view in Looker is "Sem Exames Ou Sem Consultas"
view: sem_exames_ou_sem_consultas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.sem_exames_ou_sem_consultas` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Beneficiarios Maior 34 Anos" in Explore.

  dimension: beneficiarios_maior_34_anos {
    type: number
    sql: ${TABLE}.beneficiarios_maior_34_anos ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: eventos_no_periodo {
    type: string
    sql: ${TABLE}.Eventos_no_Periodo ;;
  }

  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: titularidade {
    type: string
    sql: ${TABLE}.Titularidade ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }

  dimension: usuario_com_consulta {
    type: yesno
    sql: ${TABLE}.Usuario_com_consulta ;;
  }

  dimension: usuario_com_exame {
    type: yesno
    sql: ${TABLE}.Usuario_com_exame ;;
  }
  measure: count {
    type: count
  }
}
