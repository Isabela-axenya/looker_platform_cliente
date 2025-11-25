# The name of this view in Looker is "Gestantes"
view: gestantes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `apresentacao.gestantes` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agrupamento Internacao" in Explore.

  dimension: agrupamento_internacao {
    type: string
    sql: ${TABLE}.Agrupamento_Internacao ;;
  }

  dimension: atendto_domingo {
    type: string
    sql: ${TABLE}.Atendto_domingo ;;
  }

  dimension: atendto_feriados {
    type: string
    sql: ${TABLE}.Atendto_feriados ;;
  }

  dimension: beneficiary_cpf {
    type: string
    sql: ${TABLE}.beneficiary_cpf ;;
  }

  dimension: beneficiary_name {
    type: string
    sql: ${TABLE}.beneficiary_name ;;
  }

  dimension: carregado_em {
    type: number
    sql: ${TABLE}.Carregado_em ;;
  }

  dimension: carteirinha {
    type: string
    sql: ${TABLE}.carteirinha ;;
  }

  dimension: cd_original {
    type: string
    sql: ${TABLE}.cd_original ;;
  }

  dimension: cd_tuss {
    type: string
    sql: ${TABLE}.cd_tuss ;;
  }

  dimension: cid_name {
    type: number
    sql: ${TABLE}.cid_name ;;
  }

  dimension: claim_id {
    type: string
    sql: ${TABLE}.claim_id ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: cnpj_prestador {
    type: string
    sql: ${TABLE}.CNPJ_Prestador ;;
  }

  dimension: cod_cid {
    type: string
    sql: ${TABLE}.CodCID ;;
  }

  dimension: cod_grupo_evento {
    type: number
    sql: ${TABLE}.Cod_Grupo_Evento ;;
  }

  dimension: cod_tipo_evento {
    type: number
    sql: ${TABLE}.Cod_Tipo_Evento ;;
  }

  dimension: cod_tuss {
    type: string
    sql: ${TABLE}.cod_tuss ;;
  }

  dimension: cod_usuario_servico {
    type: string
    sql: ${TABLE}.CodUsuarioServico ;;
  }

  dimension: codigo_plano {
    type: string
    sql: ${TABLE}.CodigoPlano ;;
  }

  dimension: codigo_risco {
    type: number
    sql: ${TABLE}.Codigo_Risco ;;
  }

  dimension: complemento_contas_pagas {
    type: number
    sql: ${TABLE}.Complemento_ContasPagas ;;
  }

  dimension: complemento_terapia {
    type: string
    sql: ${TABLE}.Complemento_Terapia ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_atendto {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Data_atendto ;;
  }

  dimension_group: data_sinistro {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Data_Sinistro ;;
  }

  dimension: dependentes {
    type: string
    sql: ${TABLE}.Dependentes ;;
  }

  dimension: desc_risco {
    type: number
    sql: ${TABLE}.Desc_Risco ;;
  }

  dimension: desc_tuss {
    type: number
    sql: ${TABLE}.desc_tuss ;;
  }

  dimension: descricao_operadora {
    type: string
    sql: ${TABLE}.Descricao_Operadora ;;
  }

  dimension: dia_semana_atendto {
    type: string
    sql: ${TABLE}.Dia_semana_atendto ;;
  }

  dimension: elegiveis_preventivo {
    type: string
    sql: ${TABLE}.Elegiveis_preventivo ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }

  dimension: especialidade {
    type: string
    sql: ${TABLE}.Especialidade ;;
  }

  dimension: exame_preventivo {
    type: string
    sql: ${TABLE}.Exame_preventivo ;;
  }

  dimension: faixa_consulta_eletiva {
    type: number
    sql: ${TABLE}.faixa_consulta_eletiva ;;
  }

  dimension: faixa_etaria {
    type: string
    sql: ${TABLE}.Faixa_Etaria ;;
  }

  dimension: faixa_exames {
    type: number
    sql: ${TABLE}.faixa_exames ;;
  }

  dimension: faixa_pronto_socorro {
    type: number
    sql: ${TABLE}.faixa_pronto_socorro ;;
  }

  dimension: frequencia {
    type: string
    sql: ${TABLE}.Frequencia ;;
  }

  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }

  dimension: grupo_procedimento {
    type: string
    sql: ${TABLE}.Grupo_Procedimento ;;
  }

  dimension: idade {
    type: number
    sql: ${TABLE}.Idade ;;
  }

  dimension: imagem {
    type: string
    sql: ${TABLE}.imagem ;;
  }

  dimension: imagem_op {
    type: string
    sql: ${TABLE}.imagem_op ;;
  }

  dimension: insert_id {
    type: number
    sql: ${TABLE}.insert_id ;;
  }

  dimension: inserted_at {
    type: number
    sql: ${TABLE}.inserted_at ;;
  }

  dimension_group: inserted_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.inserted_at_date ;;
  }

  dimension: item_cadastro {
    type: number
    sql: ${TABLE}.ItemCadastro ;;
  }

  dimension: matricula {
    type: string
    sql: ${TABLE}.Matricula ;;
  }

  dimension: num_conta_cod_usuario {
    type: string
    sql: ${TABLE}.NumConta_CodUsuario ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.Operadora ;;
  }

  dimension: parentesco {
    type: string
    sql: ${TABLE}.Parentesco ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.Periodo ;;
  }

  dimension: periodo_gestacao {
    type: number
    sql: ${TABLE}.Periodo_Gestacao ;;
  }

  dimension: plano {
    type: string
    sql: ${TABLE}.Plano ;;
  }

  dimension: porta_entrada {
    type: string
    sql: ${TABLE}.Porta_Entrada ;;
  }

  dimension: prestador {
    type: string
    sql: ${TABLE}.Prestador ;;
  }

  dimension: prestador_grupo {
    type: number
    sql: ${TABLE}.Prestador_Grupo ;;
  }

  dimension: procedimentos_nao_discriminados {
    type: string
    sql: ${TABLE}.Procedimentos_nao_Discriminados ;;
  }

  dimension: procedimentos_nulos {
    type: string
    sql: ${TABLE}.Procedimentos_Nulos ;;
  }

  dimension: qtd_evento {
    type: number
    sql: ${TABLE}.Qtd_Evento ;;
  }

  dimension: qtd_risco {
    type: number
    sql: ${TABLE}.QTD_Risco ;;
  }

  dimension: qtd_servicos {
    type: number
    sql: ${TABLE}.Qtd_servicos ;;
  }

  dimension: rank_usuario_12meses {
    type: number
    sql: ${TABLE}.Rank_Usuario_12meses ;;
  }

  dimension: rede_reembolso {
    type: string
    sql: ${TABLE}.Rede_Reembolso ;;
  }

  dimension: repeticoes {
    type: string
    sql: ${TABLE}.Repeticoes ;;
  }

  dimension: senha {
    type: string
    sql: ${TABLE}.Senha ;;
  }

  dimension: sinistro {
    type: number
    sql: ${TABLE}.Sinistro ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: status_final {
    type: string
    sql: ${TABLE}.status_final ;;
  }

  dimension: sub_estipulante {
    type: string
    sql: ${TABLE}.Sub_Estipulante ;;
  }

  dimension: sub_grupo_internacao {
    type: number
    sql: ${TABLE}.SubGrupo_Internacao ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.Tipo_Evento ;;
  }

  dimension: tipo_evento_in {
    type: number
    sql: ${TABLE}.Tipo_Evento_IN ;;
  }

  dimension: tipo_internacao {
    type: string
    sql: ${TABLE}.Tipo_Internacao ;;
  }

  dimension: tipo_risco {
    type: number
    sql: ${TABLE}.Tipo_Risco ;;
  }

  dimension: tipo_terapia {
    type: string
    sql: ${TABLE}.Tipo_Terapia ;;
  }

  dimension: titularidade {
    type: string
    sql: ${TABLE}.Titularidade ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }

  dimension: uti_neo {
    type: string
    sql: ${TABLE}.UTI_Neo ;;
  }

  dimension: valida_gestacao {
    type: number
    sql: ${TABLE}.Valida_Gestacao ;;
  }

  dimension: vigencia {
    type: string
    sql: ${TABLE}.Vigencia ;;
  }
  measure: count {
    type: count
    drill_fields: [beneficiary_name, cid_name]
  }
}
