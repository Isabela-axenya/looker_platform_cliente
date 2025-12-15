connection: "forninho-elevado"

include: "/views/**/*.view.lkml"

datagroup: cliente_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: cliente_default_datagroup

#############################
# EXPLORE: AFASTADOS COM SOC
#############################
explore: afastados_com_soc {
  label: "Afastados com SOC"

  sql_always_where:
      ${afastados_com_soc.client_id} = '{{ _user_attributes['client_id'] }}' ;;
}


######################
# EXPLORE: POPULAÇÃO
######################
explore: populacao_hub {

  sql_always_where:
      ${populacao_hub.client_id} = '{{ _user_attributes['client_id'] }}'  ;;
}


###################
# EXPLORE: SINISTROS
###################
explore: sinistros {
  sql_always_where:
      ${sinistros.client_id} = '{{ _user_attributes['client_id'] }}';;
}


##################################
# EXPLORE: GERENCIAL MONITORAMENTO
##################################
explore: gerencial_monitoramento {
  label: "Monitoramento"
  description: "Base principal de monitoramento"

  sql_always_where:
    COALESCE(${enfermeira}, '') NOT IN ('Estevão Dias', 'Raffael Marfará', 'Lucas Meneses')
    AND COALESCE(${nome_carteira}, '') NOT IN ('Estevão Dias', 'Raffael Marfará', 'Lucas Meneses')
    AND COALESCE(${beneficiary_name}, '') NOT IN ('ARIELEN SILVA MUNGO DINIZ')
    AND NOT (
      UPPER(COALESCE(${beneficiary_name}, '')) LIKE '%TESTE%'
      OR UPPER(COALESCE(${company_name}, '')) LIKE '%TESTE%'
      OR UPPER(COALESCE(${canal_contato}, '')) LIKE '%TESTE%'
      OR UPPER(COALESCE(${enfermeira}, '')) LIKE '%TESTE%'
    )
    AND
      ${gerencial_monitoramento.client_id} = '{{ _user_attributes['client_id'] }}';;

  join: beneficiarios_hub {
    sql_on: ${gerencial_monitoramento.beneficiary_id} = ${beneficiarios_hub.beneficiary_id} ;;
    relationship: one_to_one
    type: left_outer
  }
  join: ultimo_status_questionario_captacao {
    sql_on: ${gerencial_monitoramento.person_id} = ${ultimo_status_questionario_captacao.person_id} ;;
    relationship: one_to_one
    type: left_outer
  }
  join: waterfall_20_elegiveis_telefone {
    type: left_outer
    sql_on:  ${gerencial_monitoramento.person_id} = ${waterfall_20_elegiveis_telefone.person_id} ;;
    relationship: one_to_one
  }

  #join: pessoas_captadas {
  #  sql_on: ${gerencial_monitoramento.person_id} = ${pessoas_captadas.person_id} ;;
  #  relationship: one_to_one
  #  type: left_outer
  #}

  #join: tempo_captacao_abandono {
  #  sql_on: ${gerencial_monitoramento.person_id} = ${tempo_captacao_abandono.person_id} ;;
  #  relationship: one_to_one
  #  type: left_outer
  #}

  #join: tempo_primeiro_monitoramento {
  #  sql_on: ${gerencial_monitoramento.person_id} = ${tempo_primeiro_monitoramento.person_id} ;;
  #  relationship: one_to_one
  #  type: left_outer
  #}

  #join: ultimo_pacient_plan {
  #  sql_on: ${gerencial_monitoramento.person_id} = ${ultimo_pacient_plan.person_id} ;;
  #  relationship: one_to_one
  #  type: left_outer
  #}



  #join: aparicao_status_monitoramento {
  #  type: left_outer
  #  sql_on:
  #    ${gerencial_monitoramento.person_id} = ${aparicao_status_monitoramento.person_id}
  #    AND ${gerencial_monitoramento.status_monitoramento} = ${aparicao_status_monitoramento.status_monitoramento}
  #    AND ${gerencial_monitoramento.competencia_status_date} = ${aparicao_status_monitoramento.competencia_status_date}
  #    ;;
  #  relationship: one_to_one
  #}
}
