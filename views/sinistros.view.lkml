# The name of this view in Looker is "Sinistros"
view: sinistros {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dashboard_health_team.sinistros` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agrupamento Internacao" in Explore.

  dimension: agrupamento_internacao {
    type: string
    sql: ${TABLE}.Agrupamento_Internacao ;;
  }

  dimension: media_sinistralidade_12m {
    type: number
    sql: ${TABLE}.media_sinistralidade_12m ;;
    value_format_name: percent_0
  }

  measure: kpi_media_sinistralidade_12m {
    label: "Média Sinistralidade (12m)"
    type: average_distinct
    sql_distinct_key: concat(${empresa}, ${operadora}) ;;
    sql: ${media_sinistralidade_12m} ;;
    value_format_name: percent_0
  }

  measure: alerta_selecao_operadora {
    view_label: "Alertas"
    type: string
    sql:
    CASE
      WHEN COUNT(DISTINCT ${operadora}) > 1
      THEN '⚠️ Escolha uma Operadora por vez'
      ELSE ''
    END ;;
  }

  dimension: atendto_domingo {
    type: string
    sql: ${TABLE}.Atendto_domingo ;;
  }
  dimension: empresa_ativa_inativa {
    type:  string
    sql: ${TABLE}.empresa_ativa_inativa ;;
  }
  dimension: atendto_feriados {
    type: string
    sql: ${TABLE}.Atendto_feriados ;;
  }

  dimension: beneficiarios_34_ativos_empresa_operadora {
    type: number
    sql: ${TABLE}.beneficiarios_34_ativos_empresa_operadora ;;
  }

  dimension: beneficiary_cpf {
    hidden: yes
    type: string
    label: "CPF"
    sql: ${TABLE}.beneficiary_cpf ;;
  }

  dimension: beneficiary_id {
    hidden: yes
    type: string
    sql: ${TABLE}.beneficiary_id ;;
  }

  dimension: beneficiary_name {
    hidden: yes
    type: string
    label: "Nome"
    sql: ${TABLE}.beneficiary_name;;
  }

  dimension: breakeven_empresa_operadora {
    type: number
    label: "Breakeven"
    sql: ${TABLE}.breakeven_empresa_operadora ;;
    value_format_name: percent_0
  }

  measure: breakeven_media {
    type: average
    label: "Breakeven Média"
    sql: ${TABLE}.breakeven_empresa_operadora ;;
    value_format_name: percent_0
  }
  measure: breakeven_media_last {
    type: average
    label: "Breakeven Média"
    sql: ${TABLE}.breakeven_empresa_operadora ;;
    value_format_name: percent_0
  }
  dimension: carregado_em {
    type: number
    sql: ${TABLE}.Carregado_em ;;
  }

  dimension: carteirinha {
    hidden: yes
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
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.CodUsuarioServico;;
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

  dimension: contrato {
    type: string
    sql: ${TABLE}.contrato ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_atendto {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Data_Atendto ;;
  }

# Campo oculto só para ordenar

  dimension: data_atendimento_mes_ano_ord_desc {
    hidden: yes
    type: number
    sql: - (EXTRACT(YEAR FROM ${data_atendto_date}) * 100 + EXTRACT(MONTH FROM ${data_atendto_date})) ;;
  }

  dimension: data_atendimento_mes_ano {
    type: string
    label: "Mês/Ano Atendimento"
    sql: FORMAT_DATE('%m/%Y', ${data_atendto_date}) ;;
    order_by_field: data_atendimento_mes_ano_ord_desc
  }


  dimension_group: data_inicio_contrato {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_inicio_contrato ;;
  }

  dimension_group: data_sinistro {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Data_Sinistro ;;
  }
  # Campo oculto só para ordenar

  dimension: data_sinistro_mes_ano_ord_desc {
    hidden: yes
    type: number
    sql: - (EXTRACT(YEAR FROM ${data_sinistro_date}) * 100 + EXTRACT(MONTH FROM ${data_sinistro_date})) ;;
  }

  dimension: data_sinistro_mes_ano {
    type: string
    label: "Mês/Ano Sinistro"
    sql: FORMAT_DATE('%m/%Y', ${data_sinistro_date}) ;;
    order_by_field: data_sinistro_mes_ano_ord_desc
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
    sql:
      CASE
        WHEN ${TABLE}.Dia_semana_atendto = '0' THEN 'Segunda'
        WHEN ${TABLE}.Dia_semana_atendto = '1' THEN 'Terça'
        WHEN ${TABLE}.Dia_semana_atendto = '2' THEN 'Quarta'
        WHEN ${TABLE}.Dia_semana_atendto = '3' THEN 'Quinta'
        WHEN ${TABLE}.Dia_semana_atendto = '4' THEN 'Sexta'
        WHEN ${TABLE}.Dia_semana_atendto = '5' THEN 'Sábado'
        WHEN ${TABLE}.Dia_semana_atendto = '6' THEN 'Domingo'
      END;;
  }
  dimension: dia_semana_atendto_ordem {
    type: string
    sql: ${TABLE}.Dia_semana_atendto;;
  }

  dimension: dias_internacao {
    type: number
    sql: ${TABLE}.dias_internacao ;;
  }

  measure: diff_sinistralidade_vs_breakeven {
    type: number
    sql: SAFE_DIVIDE(
        AVG(${TABLE}.sinistralidade_empresa_operadora) - AVG(${TABLE}.breakeven_empresa_operadora),
        NULLIF(AVG(${TABLE}.breakeven_empresa_operadora), 0)
      ) ;;
    value_format_name: percent_1
  }

  dimension: eh_gestante {
    type: yesno
    sql: ${TABLE}.eh_gestante ;;
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

  dimension: eventos_12m {
    type: string
    sql: ${TABLE}.eventos_12m ;;
  }

  dimension: exame_preventivo {
    type: string
    sql: ${TABLE}.Exame_preventivo ;;
  }

  dimension: faixa_consulta_eletiva {
    type: number
    sql: ${TABLE}.faixa_consulta_eletiva ;;
  }

  dimension: faixa_dias_internacao {
    type: string
    sql: ${TABLE}.faixa_dias_internacao ;;
    order_by_field: faixa_dias_internacao_ordem
  }

  dimension: faixa_etaria {
    label: "Faixa Etária"
    type: string
    sql: ${TABLE}.Faixa_Etaria ;;
  }

  dimension: faixa_etaria_filter {
    type: string
    sql: ${TABLE}.Faixa_Etaria ;;
  }

  dimension: faixa_etaria_classificada {
    label: "Faixa Etária"
    type: string
    sql:
    CASE
      WHEN ${idade} BETWEEN 0 AND 18 THEN '0-18 anos'
      WHEN ${idade} BETWEEN 19 AND 23 THEN '19-23 anos'
      WHEN ${idade} BETWEEN 24 AND 28 THEN '24-28 anos'
      WHEN ${idade} BETWEEN 29 AND 33 THEN '29-33 anos'
      WHEN ${idade} BETWEEN 34 AND 38 THEN '34-38 anos'
      WHEN ${idade} BETWEEN 39 AND 43 THEN '39-43 anos'
      WHEN ${idade} BETWEEN 44 AND 48 THEN '44-48 anos'
      WHEN ${idade} BETWEEN 49 AND 53 THEN '49-53 anos'
      WHEN ${idade} BETWEEN 54 AND 58 THEN '54-58 anos'
      WHEN ${idade} >= 59 THEN '59+ anos'
      ELSE 'Idade inválida'
    END ;;
    description: "Classifica a idade dos beneficiários em faixas etárias padronizadas."
  }


  dimension: faixa_exames {
    type: number
    sql: ${TABLE}.faixa_exames ;;
  }

  dimension: faixa_pronto_socorro {
    type: number
    sql: ${TABLE}.faixa_pronto_socorro ;;
  }

  dimension: flag_audit_consulta_30d {
    type: yesno
    sql: ${TABLE}.flag_audit_consulta_30d ;;
  }

  dimension: frequencia {
    type: string
    sql: ${TABLE}.Frequencia ;;
  }

  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }
  dimension: genero_filter {
    type: string
    sql: ${TABLE}.Genero ;;
  }
  dimension: gestante_ou_parto {
    type: string
    sql: ${TABLE}.gestante_ou_parto ;;
  }

  dimension: grupo_procedimento {
    type: string
    sql: ${TABLE}.Grupo_Procedimento ;;
  }

  dimension: high_user {
    type: yesno
    sql: ${TABLE}.high_user ;;
  }

  dimension: historico {
    type: string
    sql: ${TABLE}.Historico ;;
  }

  dimension: idade {
    type: number
    sql: ${TABLE}.Idade ;;
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
    hidden: yes
    type: string
    sql: ${TABLE}.Matricula ;;
  }

  dimension: num_conta_cod_usuario {
    hidden: yes
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

  dimension: perfil_epidemiologico {
    type: string
    sql: CASE
            WHEN UPPER(${TABLE}.Perfil_Epidemiologico) = 'CHRONIC' THEN 'Doença Crônica'
            WHEN UPPER(${TABLE}.Perfil_Epidemiologico) = 'UNDETERMINED' THEN 'Indeterminada'
            WHEN UPPER(${TABLE}.Perfil_Epidemiologico) = 'ACUTE' THEN 'Pontual'
            ELSE INITCAP(${TABLE}.Perfil_Epidemiologico)
          END;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.Periodo ;;
  }

  dimension: periodo_agrupado {
    label: "Período Agrupado"
    type: string
    sql:
    CASE
      WHEN ${TABLE}.Periodo IN ('Último mês','Últimos 3 meses','Últimos 6 meses','Últimos 12 meses')
        THEN 'Últimos 12 Meses'
      ELSE ${periodo}
    END ;;
  }


  dimension: periodo_gestacao {
    type: number
    sql: ${TABLE}.Periodo_Gestacao ;;
  }

  dimension: perpetuacao_gastos {
    type: string
    sql:CASE
            WHEN UPPER(${TABLE}.Perpetuacao_gastos) = 'HIGH' THEN 'Alto'
            WHEN UPPER(${TABLE}.Perpetuacao_gastos) = 'MEDIUM' THEN 'Médio'
            WHEN UPPER(${TABLE}.Perpetuacao_gastos) = 'LOW' THEN 'Baixo'
            WHEN UPPER(${TABLE}.Perpetuacao_gastos) = 'UNDETERMINED' THEN 'Indeterminado'
            ELSE INITCAP(${TABLE}.Perpetuacao_gastos)
          END;;
  }

  dimension: plano {
    type: string
    sql: ${TABLE}.Plano ;;
  }

  dimension: porta_entrada {
    type: string
    sql: ${TABLE}.Porta_Entrada ;;
  }

  dimension: pre_natais {
    type: string
    sql: ${TABLE}.pre_natais ;;
  }

  dimension: premio_empresa_operadora {
    type: number
    sql: ${TABLE}.premio_empresa_operadora ;;
  }

  dimension: prestador {
    type: string
    sql: CASE
          WHEN ${TABLE}.Prestador IS NULL THEN 'Prestador(es) não identificado(s) pela operadora'
            ELSE ${TABLE}.Prestador
        END  ;;
  }

  dimension: prestador_grupo {
    type: number
    sql: ${TABLE}.Prestador_Grupo ;;
  }

  dimension: priority {
    type: number
    sql: COALESCE(${TABLE}.priority, 0) ;;
  }


  dimension: procedimentos {
    type: string
    sql: ${TABLE}.procedimentos ;;
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

  dimension: rank_mom {
    type: number
    sql: ${TABLE}.rank_mom ;;
  }

  dimension: rank_usuario_12meses {
    type: number
    sql: ${TABLE}.Rank_Usuario_12meses ;;
  }

  dimension: rede_reembolso {
    type: string
    sql: CASE
          WHEN UPPER(${TABLE}.Rede_Reembolso) = 'REEMBOLSO' Then 'Reembolso'
            ELSE 'Rede'
        END ;;
  }

  measure: valor_sinistro_rede {
    type: sum
    label: "Valor do Sinistro - Rede"
    sql: CASE
            WHEN UPPER(${TABLE}.Rede_Reembolso) = 'REDE' THEN ${sinistro}
        END;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: valor_sinistro_reembolso {
    type: sum
    label: "Valor do Sinistro - Reembolso"
    sql: CASE
            WHEN  UPPER(${TABLE}.Rede_Reembolso) = 'REEMBOLSO' THEN ${sinistro}
        END;;
    value_format: "\"R$\" #,##0.00"
  }

  dimension: reembolso_consultas {
    type: number
    sql: ${TABLE}.reembolso_consultas ;;
  }

  dimension: repeticoes {
    type: string
    sql: ${TABLE}.Repeticoes ;;
  }

  dimension: resumo {
    type: string
    sql: ${TABLE}.Resumo ;;
  }

  dimension: senha {
    hidden: yes
    type: string
    sql: ${TABLE}.Senha ;;
  }

  dimension: senha_parto {
    hidden: yes
    type: string
    sql: ${TABLE}.senha_parto ;;
  }

  dimension: sinistralidade_empresa_operadora {
    type: number
    sql: ${TABLE}.sinistralidade_empresa_operadora ;;
  }

  measure: sinistralidade_media {
    label: "Sinistralidade Média"
    type: average
    sql: ${TABLE}.sinistralidade_empresa_operadora ;;
    value_format_name: percent_0

    html:
    {{ rendered_value }} |
    {% assign diff = diff_sinistralidade_vs_breakeven._value | default: nil %}
    {% if diff == nil %}
      <span style="color:#7f8c8d;">Sem breakeven para comparação</span>
    {% elsif diff > 0 %}
      <span style="color:#e74c3c;">Alta sinistralidade – {{ diff | times: 100 | round: 1 }}% acima do breakeven</span>
    {% else %}
      <span style="color:#27ae60;">Baixa sinistralidade – {{ diff | abs | times: 100 | round: 1 }}% abaixo do breakeven</span>
    {% endif %}
  ;;
  }


  dimension: sinistro {
    type: number
    sql: ${TABLE}.Sinistro ;;
    value_format: "\"R$\" #,##0.00"
  }

  dimension: sinistro_acumulado_mes {
    type: number
    sql: ${TABLE}.sinistro_acumulado_mes ;;
    value_format: "\"R$\" #,##0.00"
  }

  dimension: status {
    type: string
    sql: CASE
            WHEN INITCAP(${TABLE}.Status) = 'Excluido' THEN 'Excluído'
            WHEN INITCAP(${TABLE}.Status) = 'Demitido' THEN 'Excluído'
            WHEN INITCAP(${TABLE}.Status) IS NULL THEN 'Sem Status'
            ELSE INITCAP(${TABLE}.Status)
          END ;;
  }

  dimension: status_monitoramento {
    type: string
    sql: ${TABLE}.status_monitoramento ;;
  }

  dimension: status_monitoramento_legivel {
    label: "Status do Monitoramento"
    description: "Tradução dos códigos técnicos de status para termos compreensíveis ao usuário final."
    type: string
    sql:
    CASE
      WHEN ${status_monitoramento} = 'ACQUISITION' THEN 'Captado'
      WHEN ${status_monitoramento} = 'ACQUISITION_ABANDONED' THEN 'Abandono aquisição'
      WHEN ${status_monitoramento} = 'ACQUISITION_DIFFICULTY_1' THEN 'Dificuldade de Captação 1'
      WHEN ${status_monitoramento} = 'ACQUISITION_DIFFICULTY_2' THEN 'Dificuldade de Captação 2'
      WHEN ${status_monitoramento} = 'BEING_MONITORED' THEN 'Monitorado'
      WHEN ${status_monitoramento} = 'COORDINATED' THEN 'Coordenado'
      WHEN ${status_monitoramento} = 'DECLINED' THEN 'Recusado'
      WHEN ${status_monitoramento} = 'DISCHARGED' THEN 'Alta'
      WHEN ${status_monitoramento} = 'ELIGIBLE' THEN 'Em Captação'
      WHEN ${status_monitoramento} = 'INACTIVE' THEN 'Inativo'
      WHEN ${status_monitoramento} = 'MONITORING_ABANDONED' THEN 'Abandono monitoramento'
      WHEN ${status_monitoramento} = 'MONITORING_DIFFICULTY_1' THEN 'Dificuldade de Monitoramento 1'
      WHEN ${status_monitoramento} = 'MONITORING_DIFFICULTY_2' THEN 'Dificuldade de Monitoramento 2'
      WHEN ${status_monitoramento} = 'NON_ENGAGEMENT' THEN 'Abandono aquisição'
      WHEN ${status_monitoramento} = 'NOT_ELIGIBLE' THEN 'Não Elegível'
      WHEN ${status_monitoramento} = 'PENDING_ACQUISITION_HR' THEN 'Dificuldade captação pendente RH'
      WHEN ${status_monitoramento} = 'PENDING_MONITORING_HR' THEN 'Dificuldade monitoramento pendente RH'
      WHEN ${status_monitoramento} = 'SELF_DISCHARGED' THEN 'Alta'
      WHEN ${status_monitoramento} = 'UNREACHABLE' THEN 'Dificuldade de Captação 1'
      WHEN ${status_monitoramento} IS NULL THEN 'Não está em monitoramento'
      ELSE ${status_monitoramento}
    END ;;
  }


  dimension: sub_estipulante {
    type: string
    sql: ${TABLE}.Sub_Estipulante ;;
  }

  dimension: sub_grupo_internacao {
    type: number
    sql: ${TABLE}.SubGrupo_Internacao ;;
  }

  dimension: tags {
    type: string
    sql: COALESCE(${TABLE}.tags,'') ;;
  }

  dimension: teve_consulta_12m {
    type: yesno
    sql: ${TABLE}.teve_consulta_12m ;;
  }

  dimension: teve_exame_12m {
    type: yesno
    sql: ${TABLE}.teve_exame_12m ;;
  }

  dimension: teve_parto {
    type: yesno
    sql: ${TABLE}.teve_parto ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.Tipo_Evento ;;
  }
  dimension: tipo_evento_filter {
    type: string
    sql: ${TABLE}.Tipo_Evento ;;
  }

  dimension: tipo_evento_dash_cliente {
    label: "Procedimento Médico"
    order_by_field: tipo_evento_order
    type: string
    sql: CASE
          WHEN ${TABLE}.Tipo_Evento IN ('Tax/Mat/Med','Outros Procedimentos') THEN 'Outros Procedimentos'
          ELSE ${TABLE}.Tipo_Evento
          END;;
  }
  dimension: tipo_evento_order {
    label: "Ordem Procedimento Médico"
    type: number
    hidden: yes
    sql: CASE
        WHEN ${tipo_evento_dash_cliente} = 'Internação' THEN 1
        WHEN ${tipo_evento_dash_cliente} = 'Exame' THEN 2
        WHEN ${tipo_evento_dash_cliente} = 'Terapia' THEN 3
        WHEN ${tipo_evento_dash_cliente} = 'Consulta' THEN 4
        WHEN ${tipo_evento_dash_cliente} = 'Pronto Socorro' THEN 5
        WHEN ${tipo_evento_dash_cliente} = 'Proc. Ambulatorial' THEN 6
        WHEN ${tipo_evento_dash_cliente} = 'Outros Procedimentos' THEN 7
        WHEN ${tipo_evento_dash_cliente} = 'Home Care' THEN 8
        ELSE 999
      END;;
  }


  dimension: tipo_evento_in {
    type: number
    sql: ${TABLE}.Tipo_Evento_IN ;;
  }
  dimension: tipo_evento_filtro {
    type: string
    sql: ${TABLE}.Tipo_Evento ;;
  }

  dimension: tipo_exame {
    type: string
    sql: ${TABLE}.Tipo_Exame ;;
  }

  dimension: tipo_internacao {
    type: string
    sql: ${TABLE}.Tipo_Internacao ;;
  }

  dimension: tipo_parto {
    type: string
    sql: ${TABLE}.tipo_parto ;;
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
  dimension: titularidade_filter {
    type: string
    sql: ${TABLE}.Titularidade ;;
  }
  dimension: usuario {
    type: string
    sql: UPPER(${TABLE}.Usuario) ;;
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
    drill_fields: [usuario, cid_name]
  }

  measure: total_sinistro {
    type: sum
    sql: ${TABLE}.sinistro ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: total_sinistro_dinamico {
    label: "Sinistro Total"
    description: "Sinistro dinâmico para visualização com B M ou K"
    type: sum
    sql: ${TABLE}.sinistro ;;
    value_format: "\"R$\" #,##0.00"
    html:
      {% assign v = total_sinistro._value %}

      {% if v >= 1000000000 %}
      {% assign n = v | divided_by: 1000000000 %}
      R${{ n | round: 0 | format: "#,##0" }} Bilhões

      {% elsif v >= 1000000 %}
      {% assign n = v | divided_by: 1000000 %}
      R${{ n | round: 0 | format: "#,##0" }} Milhões

      {% elsif v >= 1000 %}
      {% assign n = v | divided_by: 1000 %}
      R${{ n | round: 0 | format: "#,##0" }} Mil

      {% else %}
      R${{ v | round: 0 | format: "#,##0" }}

      {% endif %}
    ;;
  }

  measure: sinistro_minimo {
    label: "Sinistro Mínimo"
    type: number
    sql: MIN(${sinistro}) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Retorna o menor valor de sinistro no conjunto de dados filtrado."
  }

  measure: sinistro_medio {
    label: "Sinistro Médio"
    type: number
    sql: AVG(${sinistro}) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Retorna o valor MÉDIO de sinistro no conjunto de dados filtrado."
  }


  measure: sinistro_maximo {
    label: "Sinistro Máximo"
    type: number
    sql: MAX(${sinistro}) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Retorna o maior valor de sinistro no conjunto de dados filtrado."
  }
  measure: total_eventos {
    type: sum
    sql: ${TABLE}.qtd_evento;;
  }

  measure: total_eventos_domingo {
    type: sum
    sql: CASE WHEN LOWER(${atendto_domingo}) = 'sim' THEN ${TABLE}.qtd_evento END;;
  }

  measure: total_eventos_feriados {
    type: sum
    sql: CASE WHEN LOWER(${atendto_feriados}) = 'sim' THEN ${TABLE}.qtd_evento END;;
  }

  measure: count_distinct_data_sinistro {
    type: count_distinct
    sql: ${TABLE}.data_sinistro ;;
  }

  measure: count_distinct_usuario {
    type: count_distinct
    sql: ${TABLE}.usuario ;;
  }

  measure: sinistro_per_user_per_date{
    type: number
    sql: ( ${total_sinistro} / NULLIF(${count_distinct_data_sinistro},0) )
      / NULLIF(${count_distinct_usuario},0) ;;
    value_format: "\"R$\" #,##0.00"
  }
# --- parâmetros (values numéricos SEM aspas) ---

  parameter: ano_parametro {
    label: "Escolha o Ano"
    type: number
    allowed_value: { label: "2023" value: "2023" }
    allowed_value: { label: "2024" value: "2024" }
    allowed_value: { label: "2025" value: "2025" }
    allowed_value: { label: "2026" value: "2026" }
  }

  parameter: mes_parametro {
    label: "Escolha o Mês"
    type: number
    allowed_value: { label: "Janeiro"   value: "1" }
    allowed_value: { label: "Fevereiro" value: "2" }
    allowed_value: { label: "Março"     value: "3" }
    allowed_value: { label: "Abril"     value: "4" }
    allowed_value: { label: "Maio"      value: "5" }
    allowed_value: { label: "Junho"     value: "6" }
    allowed_value: { label: "Julho"     value: "7" }
    allowed_value: { label: "Agosto"    value: "8" }
    allowed_value: { label: "Setembro"  value: "9" }
    allowed_value: { label: "Outubro"   value: "10" }
    allowed_value: { label: "Novembro"  value: "11" }
    allowed_value: { label: "Dezembro"  value: "12" }
  }

  # --- data de corte derivada dos parâmetros (reutilizável) ---
  dimension: data_corte_param {
    hidden: yes
    type: date
    # Use Liquid para puxar os valores do parâmetro
    sql: DATE({% parameter ano_parametro %}, {% parameter mes_parametro %}, 1) ;;
  }

  dimension: data_mes_param {
    hidden: yes
    type: date
    sql: DATE({% parameter ano_parametro %}, {% parameter mes_parametro %}, 1) ;;
  }

  dimension: data_mes_anterior_param {
    hidden: yes
    type: date
    sql:
    CASE
      WHEN {% parameter mes_parametro %} = 1
        THEN DATE({% parameter ano_parametro %} - 1, 12, 1)
      ELSE DATE({% parameter ano_parametro %}, {% parameter mes_parametro %} - 1, 1)
    END ;;
  }


  dimension: classificacao_sinistro_per_capita {
    type: string
    sql:
    CASE
      WHEN DATE(${data_sinistro_date}) < ${data_corte_param} THEN
        CONCAT('1. Sinistro per capita até ', FORMAT_DATE('%m/%Y', DATE_SUB(${data_corte_param}, INTERVAL 1 MONTH)))
      WHEN DATE(${data_sinistro_date}) = ${data_corte_param} THEN
        CONCAT('2. Sinistro per capita em ',  FORMAT_DATE('%m/%Y', ${data_corte_param}))
      ELSE
        CONCAT('3. Sinistro per capita após ', FORMAT_DATE('%m/%Y', ${data_corte_param}))
    END ;;
  }
  dimension: classificacao_sinistro_medio {
    type: string
    sql:
    CASE
      WHEN DATE(${data_sinistro_date}) < ${data_corte_param} THEN
        CONCAT('1. Sinistro Médio até ', FORMAT_DATE('%m/%Y', DATE_SUB(${data_corte_param}, INTERVAL 1 MONTH)))
      WHEN DATE(${data_sinistro_date}) = ${data_corte_param} THEN
        CONCAT('2. Sinistro Médio em ',  FORMAT_DATE('%m/%Y', ${data_corte_param}))
      ELSE
        CONCAT('3. Sinistro Médio após ', FORMAT_DATE('%m/%Y', ${data_corte_param}))
    END ;;
  }
  dimension: classificacao_custo_medio {
    type: string
    sql:
    CASE
      WHEN DATE(${data_sinistro_date}) < ${data_corte_param} THEN
        CONCAT('1. Custo Médio até ', FORMAT_DATE('%m/%Y', DATE_SUB(${data_corte_param}, INTERVAL 1 MONTH)))
      WHEN DATE(${data_sinistro_date}) = ${data_corte_param} THEN
        CONCAT('2. Custo Médio em ',  FORMAT_DATE('%m/%Y', ${data_corte_param}))
      ELSE
        CONCAT('3. Custo Médio após ', FORMAT_DATE('%m/%Y', ${data_corte_param}))
    END ;;
  }
  dimension: classificacao_eventos_medio {
    type: string
    sql:
    CASE
      WHEN DATE(${data_sinistro_date}) < ${data_corte_param} THEN
        CONCAT('1. Eventos Médio até ', FORMAT_DATE('%m/%Y', DATE_SUB(${data_corte_param}, INTERVAL 1 MONTH)))
      WHEN DATE(${data_sinistro_date}) = ${data_corte_param} THEN
        CONCAT('2. Eventos Médio em ',  FORMAT_DATE('%m/%Y', ${data_corte_param}))
      ELSE
        CONCAT('3. Eventos Médio após ', FORMAT_DATE('%m/%Y', ${data_corte_param}))
    END ;;
  }

  measure: count_distinct_usuarios {
    type: count_distinct
    sql: ${usuario} ;;
  }

  measure: count_distinct_beneficiaries {
    type: count_distinct
    sql: ${beneficiary_id} ;;
  }

  measure: male_count_negative {
    type: number
    sql: -1 * COUNT(DISTINCT CASE WHEN INITCAP(${genero}) = 'Masculino' THEN ${beneficiary_id} END) ;;
    value_format: "#,##0"
    html: {% assign val = male_count_negative._value | abs %}
    {{ val }}
    ;;
  }
  measure: female_count {
    type: count_distinct
    sql: CASE WHEN INITCAP(${genero}) = 'Feminino' THEN ${beneficiary_id} END ;;
    value_format: "#,##0"
  }
  measure: titularidade_negativa {
    type: number
    sql: -COUNT(DISTINCT CASE WHEN INITCAP(${titularidade}) = 'Titular' THEN ${beneficiary_id} END) ;;
  }
  measure: dependencia_positiva {
    type: count_distinct
    sql: CASE WHEN INITCAP(${titularidade}) = 'Dependente' THEN ${beneficiary_id} END ;;
    value_format: "#,##0"
  }
  dimension: age_range_order {
    type: number
    sql:
    CASE
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "59") THEN 0
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "54") THEN 1
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "49") THEN 2
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "44") THEN 3
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "39") THEN 4
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "34") THEN 5
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "29") THEN 6
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "24") THEN 7
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "19") THEN 8
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "18") THEN 9
      WHEN ${faixa_etaria} IS NULL THEN 10
    END ;;
  }

  dimension: status_monitorado {
    label: "Está sendo monitorado?"
    type: string
    sql:
    CASE
      WHEN ${status_monitoramento} IN (
        'BEING_MONITORED',
        'ACQUISITION',
        'COORDINATED',
        'MONITORING_DIFFICULTY_1',
        'MONITORING_DIFFICULTY_2',
        'PENDING_MONITORING_HR'
      ) THEN 'Sim'
      ELSE 'Não'
    END ;;
  }
  measure: custo_medio_usuario {

    label: "Custo Médio por Usuário"
    type: number
    sql: ${total_sinistro} / NULLIF(${count_distinct_usuario}, 0) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Calcula o custo médio por usuário: total de sinistros dividido pelo número distinto de usuários."
  }

  measure: custo_medio_beneficiary_id {
    label: "Custo Médio por Beneficiário"
    type: number
    sql: ${total_sinistro} / NULLIF(${count_distinct_beneficiaries}, 0) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Calcula o custo médio por beneficiário: total de sinistros dividido pelo número distinto de beneficiary_id."
  }

  measure: custo_medio_evento {
    label: "Custo Médio por Evento"
    type: number
    sql: SUM(${sinistro}) / NULLIF(SUM(${qtd_evento}), 0) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Calcula o custo médio por evento: total de sinistros dividido pela soma de eventos."
  }
  measure: sinistro_medio_periodo {
    label: "Sinistro Médio do Período"
    type: number
    sql:
    CASE
      WHEN COUNT(DISTINCT ${data_sinistro_date}) = 0 THEN NULL
      ELSE SUM(${sinistro}) / COUNT(DISTINCT ${data_sinistro_date})
    END ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: eventos_medio_periodo {
    label: "Eventos Médios do Período"
    type: number
    sql:
    CEIL(CASE
      WHEN COUNT(DISTINCT ${data_sinistro_date}) = 0 THEN NULL
      ELSE SUM(${qtd_evento}) / COUNT(DISTINCT ${data_sinistro_date})
    END) ;;
    value_format: "#,##0"
  }


  measure: sinistralidade_mes_anterior {

    label: "Sinistralidade Mês Anterior"
    type: number
    sql:
    AVG(
      CASE
        WHEN EXTRACT(YEAR FROM ${data_sinistro_date}) =
          CASE
            WHEN {% parameter mes_parametro %} = 1 THEN {% parameter ano_parametro %} - 1
            ELSE {% parameter ano_parametro %}
          END
        AND EXTRACT(MONTH FROM ${data_sinistro_date}) =
          CASE
            WHEN {% parameter mes_parametro %} = 1 THEN 12
            ELSE {% parameter mes_parametro %} - 1
          END
        THEN ${sinistralidade_empresa_operadora}
      END
    ) ;;
    value_format_name: "percent_2"
  }

  measure: sinistralidade_mes_selecionado {
    label: "Sinistralidade Mês Selecionado"
    type: number
    sql:
    AVG(
      CASE
        WHEN EXTRACT(YEAR FROM ${data_sinistro_date}) = {% parameter ano_parametro %}
        AND EXTRACT(MONTH FROM ${data_sinistro_date}) = {% parameter mes_parametro %}
        THEN ${sinistralidade_empresa_operadora}
      END
    ) ;;
    value_format_name: "percent_2"
  }

  measure: premio_mes_anterior {
    label: "Prêmio Mês Anterior"
    type: number
    sql:
    AVG(
      CASE
        WHEN EXTRACT(YEAR FROM ${data_sinistro_date}) =
          CASE
            WHEN {% parameter mes_parametro %} = 1 THEN {% parameter ano_parametro %} - 1
            ELSE {% parameter ano_parametro %}
          END
        AND EXTRACT(MONTH FROM ${data_sinistro_date}) =
          CASE
            WHEN {% parameter mes_parametro %} = 1 THEN 12
            ELSE {% parameter mes_parametro %} - 1
          END
        THEN ${premio_empresa_operadora}
      END
    ) ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: premio_mes_selecionado {
    label: "Prêmio Mês Selecionado"
    type: number
    sql:
    AVG(
      CASE
        WHEN EXTRACT(YEAR FROM ${data_sinistro_date}) = {% parameter ano_parametro %}
        AND EXTRACT(MONTH FROM ${data_sinistro_date}) = {% parameter mes_parametro %}
        THEN ${premio_empresa_operadora}
      END
    ) ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: sinistro_mes_anterior {
    label: "Sinistro Mês Anterior"
    type: number
    sql:
    SUM(
      CASE
        WHEN EXTRACT(YEAR FROM ${data_sinistro_date}) =
          CASE
            WHEN {% parameter mes_parametro %} = 1 THEN {% parameter ano_parametro %} - 1
            ELSE {% parameter ano_parametro %}
          END
        AND EXTRACT(MONTH FROM ${data_sinistro_date}) =
          CASE
            WHEN {% parameter mes_parametro %} = 1 THEN 12
            ELSE {% parameter mes_parametro %} - 1
          END
        THEN ${sinistro}
      END
    ) ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: sinistro_mes_selecionado {
    label: "Sinistro Mês Selecionado"
    type: number
    sql:
    SUM(
      CASE
        WHEN EXTRACT(YEAR FROM ${data_sinistro_date}) = {% parameter ano_parametro %}
        AND EXTRACT(MONTH FROM ${data_sinistro_date}) = {% parameter mes_parametro %}
        THEN ${sinistro}
      END
    ) ;;
    value_format: "\"R$\" #,##0.00"
  }
  dimension: valor_sinistro_10_maiores {
    label: "Valor do Sinistro - 10 Maiores"
    type: number
    sql: CASE WHEN ${rank_usuario_12meses} <= 10 THEN ${sinistro} END ;;
    value_format: "\"R$\" #,##0.00"
  }


  measure: sinistro_10_maiores_ate_mes_anterior {
    label: "Sinistro - 10 Maiores até Mês Anterior"
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.rank_usuario_12meses <= 10
       AND ${data_sinistro_date} < ${data_corte_param}
      THEN ${TABLE}.sinistro
    END ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: sinistro_10_maiores_mes_selecionado {
    label: "Sinistro - 10 Maiores (Mês Selecionado)"
    type: sum
    sql:
    CASE
      WHEN ${data_sinistro_date} = ${data_corte_param}
      THEN ${valor_sinistro_10_maiores}
    END ;;
    value_format: "\"R$\" #,##0.00"
  }
  measure: sinistro_high_user {
    label: "Sinistro High-user"
    type: sum
    sql:
    CASE
      WHEN ${high_user} = TRUE
      THEN ${sinistro}
      ELSE NULL
    END ;;
    value_format: "\"R$\" #,##0.00"
    description: "Soma o valor de sinistro apenas para usuários classificados como High-user (high_user = TRUE)."
  }
  dimension: classificacao_top10 {
    label: "Classificação Top 10 Usuários"
    type: string
    sql:
    CASE
      WHEN ${rank_usuario_12meses} <= 10 THEN '10 Maiores'
      ELSE 'Demais'
    END ;;
    description: "Classifica os usuários entre '10 Maiores' e 'Demais' com base no campo Rank_Usuario_12meses."
  }
  dimension: classificacao_top20 {
    label: "Classificação Top 20 Usuários"
    type: string
    sql:
    CASE
      WHEN ${rank_usuario_12meses} <= 20  THEN '20 Maiores'
      ELSE 'Demais'
    END ;;
    description: "Classifica os usuários entre '20 Maiores' e 'Demais' com base no campo Rank_Usuario_12meses."
  }
  dimension: classificacao_top30 {
    label: "Classificação Top 30 Usuários"
    type: string
    sql:
    CASE
      WHEN ${rank_usuario_12meses} <= 30 THEN '30 Maiores'
      ELSE 'Demais'
    END ;;
    description: "Classifica os usuários entre '30 Maiores' e 'Demais' com base no campo Rank_Usuario_12meses."
  }

  dimension: tipo_evento_perfil_utilizacao {
    label: "Tipo de Evento - Perfil de Utilização"
    type: string
    sql:
      CASE
        WHEN (LOWER(${tipo_evento}) = 'internação' AND LOWER(${porta_entrada}) = 'emergencial')
          OR (LOWER(${tipo_evento}) = 'pronto socorro') THEN 'Urgência'
        WHEN LOWER(${tipo_evento}) IN ('exame', 'consulta') THEN 'Preventivos'
        ELSE 'Tratamentos'
      END ;;
    description: "Classifica o tipo de evento conforme o perfil de utilização: Urgência, Preventivos ou Tratamentos."
  }

  dimension: periodo_6_12_mom {
    label: "Período (0-6 / 7-12 Meses / Anteriores)"
    type: string
    sql:
      CASE
        WHEN ${periodo} IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses') THEN '0 - 6 Meses'
        WHEN ${periodo} = 'Últimos 12 meses' THEN '7 - 12 Meses'
        ELSE 'Anteriores'
      END ;;
    description: "Agrupa o período de monitoramento em três faixas: 0-6 Meses, 7-12 Meses e Anteriores."
  }
  measure: sinistro_0_6_meses {
    label: "Sinistro (0-6 Meses)"
    type: sum
    sql:
    CASE
      WHEN ${periodo_6_12_mom} = '0 - 6 Meses'
      THEN ${sinistro}
    END ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: sinistro_7_12_meses {
    label: "Sinistro (7-12 Meses)"
    type: sum
    sql:
    CASE
      WHEN ${periodo_6_12_mom} = '7 - 12 Meses'
      THEN ${sinistro}
    END ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: usuarios_0_6_meses {
    label: "Usuários (0-6 Meses)"
    type: count_distinct
    sql:
    CASE
      WHEN ${periodo_6_12_mom} = '0 - 6 Meses'
      THEN ${usuario}
    END ;;
    value_format: "#,##0"
  }

  measure: usuarios_7_12_meses {
    label: "Usuários (7-12 Meses)"
    type: count_distinct
    sql:
    CASE
      WHEN ${periodo_6_12_mom} = '7 - 12 Meses'
      THEN ${usuario}
    END ;;
    value_format: "#,##0"
  }

  measure: eventos_0_6_meses {
    label: "Eventos (0-6 Meses)"
    type: sum
    sql:
    CASE
      WHEN ${periodo_6_12_mom} = '0 - 6 Meses'
      THEN ${qtd_evento}
    END ;;
    value_format: "#,##0"
  }

  measure: eventos_7_12_meses {
    label: "Eventos (7-12 Meses)"
    type: sum
    sql:
    CASE
      WHEN ${periodo_6_12_mom} = '7 - 12 Meses'
      THEN ${qtd_evento}
    END ;;
    value_format: "#,##0"
  }

  measure: custo_evento_0_6_meses {
    label: "Custo x Evento (0-6 Meses)"
    type: number
    sql:
    (SUM(CASE WHEN ${periodo_6_12_mom} = '0 - 6 Meses' THEN ${sinistro} END))
    /
    NULLIF(SUM(CASE WHEN ${periodo_6_12_mom} = '0 - 6 Meses' THEN ${qtd_evento} END), 0) ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: custo_evento_7_12_meses {
    label: "Custo x Evento (7-12 Meses)"
    type: number
    sql:
    (SUM(CASE WHEN ${periodo_6_12_mom} = '7 - 12 Meses' THEN ${sinistro} END))
    /
    NULLIF(SUM(CASE WHEN ${periodo_6_12_mom} = '7 - 12 Meses' THEN ${qtd_evento} END), 0) ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: custo_sinistrado_0_6_meses {
    label: "Custo x Sinistrado (0-6 Meses)"
    type: number
    sql:
    (SUM(CASE WHEN ${periodo_6_12_mom} = '0 - 6 Meses' THEN ${sinistro} END))
    /
    NULLIF(COUNT(DISTINCT CASE WHEN ${periodo_6_12_mom} = '0 - 6 Meses' THEN ${usuario} END), 0) ;;
    value_format: "\"R$\" #,##0.00"
  }

  measure: custo_sinistrado_7_12_meses {
    label: "Custo x Sinistrado (7-12 Meses)"
    type: number
    sql:
    (SUM(CASE WHEN ${periodo_6_12_mom} = '7 - 12 Meses' THEN ${sinistro} END))
    /
    NULLIF(COUNT(DISTINCT CASE WHEN ${periodo_6_12_mom} = '7 - 12 Meses' THEN ${usuario} END), 0) ;;
    value_format: "\"R$\" #,##0.00"
  }
  measure: utilizacao_ans {
    label: "% Utilização ANS"
    type: number
    sql:
    CASE
      WHEN INITCAP(${tipo_evento}) = 'Internação' THEN 0.533
      WHEN INITCAP(${tipo_evento}) = 'Pronto Socorro' THEN 0.032
      WHEN INITCAP(${tipo_evento}) = 'Consulta' THEN 0.065
      WHEN INITCAP(${tipo_evento}) = 'Exame' THEN 0.179
      WHEN INITCAP(${tipo_evento}) = 'Terapia' THEN 0.191
      WHEN INITCAP(${tipo_evento}) = 'Proc Ambulatorial' THEN 0
      WHEN INITCAP(${tipo_evento}) = 'Taxa/Mat/Med' THEN 0
    END ;;
    value_format: "0.000"
  }
  measure: total_usuarios_global {
    label: "Total de Usuários Global"
    type: number
    sql: (SELECT COUNT(DISTINCT Usuario) FROM `dashboard_health_team.sinistros`) ;;
    value_format: "#,##0"
  }
  measure: percentual_usuarios_tipo_evento {
    label: "% do Total de Usuários"
    type: number
    sql:
    COUNT(DISTINCT ${usuario}) / NULLIF(${total_usuarios_global}, 0) ;;
    value_format_name: "percent_2"
  }
  measure: total_sinistro_global {
    label: "Total de Sinistro Global"
    type: number
    sql: (SELECT SUM(Sinistro) FROM `dashboard_health_team.sinistros`) ;;
    value_format: "\"R$\" #,##0.00"
  }
  measure: percentual_sinistro_prestador {
    label: "% do Total do Sinistro"
    type: number
    sql:
    NULLIF(${total_sinistro},0) / NULLIF(${total_sinistro_global}, 0) ;;
    value_format_name: "percent_2"
  }

  dimension: usuario_rede {
    label: " Usuário Rede"
    sql: CASE
            WHEN UPPER(${rede_reembolso}) = 'REDE'
              THEN Usuario
          END  ;;
  }
  dimension: usuario_reembolso {
    label: " Usuário Reembolso"
    sql: CASE
            WHEN UPPER(${rede_reembolso}) = 'REEMBOLSO'
              THEN Usuario
          END  ;;
  }

  measure: total_eventos_global {
    label: "Total de Eventos Global"
    type: number
    sql: (SELECT SUM(Qtd_Evento) FROM `dashboard_health_team.sinistros`) ;;
    value_format: "#,##0"
  }

  parameter: metrica_opcional {
    label: "Escolha a Métrica"
    type: string
    allowed_value: { label: "Total de Sinistro" value: "sinistro" }
    allowed_value: { label: "Total de Eventos" value: "eventos" }
    allowed_value: { label: "Custo Médio por Evento" value: "custo_medio_evento" }
    default_value: "sinistro"
    description: "Selecione qual métrica deseja visualizar no gráfico."
  }

  measure: valor_metrica_selecionada {

    label: "Valor da Métrica Selecionada"
    type: number
    sql:
    CASE
      WHEN {% parameter metrica_opcional %} = 'sinistro'
        THEN SUM(${sinistro})
      WHEN {% parameter metrica_opcional %} = 'eventos'
        THEN SUM(${qtd_evento})
      WHEN {% parameter metrica_opcional %} = 'custo_medio_evento'
        THEN SUM(${sinistro}) / NULLIF(SUM(${qtd_evento}), 0)
    END ;;
    value_format: "#,##0.00"
    description: "Muda dinamicamente entre Total de Sinistro, Total de Eventos ou Custo Médio por Evento conforme a seleção do parâmetro."
  }


  dimension: nome_metrica_selecionada {
    label: "Nome da Métrica Selecionada"
    type: string
    sql:
    CASE
      WHEN {% parameter metrica_opcional %} = 'sinistro' THEN 'Total de Sinistro (R$)'
      WHEN {% parameter metrica_opcional %} = 'eventos' THEN 'Total de Eventos'
      WHEN {% parameter metrica_opcional %} = 'custo_medio_evento' THEN 'Custo Médio por Evento (R$)'
    END ;;
  }
  dimension: teleatendimento {
    label: "Teleatendimento"
    type: yesno
    sql:
    CASE
      WHEN ${TABLE}.cd_original IN (
        '59998680','10014012','10014039','10014020','10014160','10014179',
        '59988630','10101063','61602540','66000882','66000904','66000912',
        '66000947','66000963','90101022','90131700','90131722','90131733'
      )
      THEN TRUE
      ELSE FALSE
    END ;;
  }
  dimension: eventos_teleconsulta {
    label: "Eventos Teleconsulta"
    type: number
    sql: CASE
          WHEN ${teleatendimento} = TRUE
          THEN ${TABLE}.qtd_evento
          ELSE 0
        END;;
  }
  dimension: usuario_teleconsulta {
    label: "Usuários Teleconsulta"
    type: string
    sql: CASE
          WHEN ${teleatendimento} = TRUE
          THEN ${usuario}
        END;;
  }
  dimension: faixa_etaria_ordem {
    type: number
    sql:
    CASE
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "59") THEN 0
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "54") THEN 1
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "49") THEN 2
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "44") THEN 3
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "39") THEN 4
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "34") THEN 5
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "29") THEN 6
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "24") THEN 7
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "19") THEN 8
      WHEN CONTAINS_SUBSTR(${faixa_etaria}, "18") THEN 9
      WHEN ${faixa_etaria} IS NULL THEN 10
    END ;;
  }
  measure: usuarios_masculinos {
    type: number
    sql: -1 * COUNT(DISTINCT CASE WHEN INITCAP(${genero}) = 'Masculino' THEN ${usuario} END) ;;
    value_format: "#,##0"
  }
  measure: usuarios_femininos {
    type: count_distinct
    sql: CASE WHEN INITCAP(${genero}) = 'Feminino' THEN ${usuario} END ;;
    value_format: "#,##0"
  }
  measure: sinistro_masculino {
    type: number
    sql: -1 * SUM(CASE WHEN INITCAP(${genero}) = 'Masculino' THEN ${sinistro} END) ;;
    value_format: "\"R$\" #,##0.00"
  }
  measure: sinistro_feminino {
    type: sum
    sql: CASE WHEN INITCAP(${genero}) = 'Feminino' THEN ${sinistro} END ;;
    value_format: "\"R$\" #,##0.00"
  }
  measure: consultas_eletivas {
    label: "Consultas Eletivas"
    type: sum
    sql:
    CASE
      WHEN LOWER(${tipo_evento}) = 'consulta'
      THEN ${qtd_evento}
      ELSE 0
    END ;;
    value_format: "#,##0"
  }

  measure: consultas_teleatendimento {
    label: "Consultas de Teleatendimento"
    type: sum
    sql:
    CASE
      WHEN LOWER(${tipo_evento}) = 'consulta'
       AND ${teleatendimento} = TRUE
      THEN ${qtd_evento}
      ELSE 0
    END ;;
    value_format: "#,##0"
  }

  measure: percentual_teleatendimento_consulta {
    label: "% de Teleatendimento nas Consultas"
    type: number
    sql:
    SAFE_DIVIDE(${consultas_teleatendimento}, NULLIF(${consultas_eletivas},0)) ;;
    value_format_name: "percent_2"
  }

  measure: usuarios_teleatendimento {
    label: "Usuários Distintos - Teleatendimento"
    type: count_distinct
    sql:
    CASE
      WHEN LOWER(${tipo_evento}) = 'consulta'
       AND ${teleatendimento} = TRUE
      THEN ${usuario}
    END ;;
    value_format: "#,##0"
  }
  dimension: faixa_dias_internacao_ordem {
    type: number
    sql:
    CASE
      WHEN ${faixa_dias_internacao} = "1 a 5 dias" THEN 0
      WHEN ${faixa_dias_internacao} = "6 a 10 dias" THEN 1
      WHEN ${faixa_dias_internacao} = "11 a 15 dias" THEN 2
      WHEN ${faixa_dias_internacao} = "16 a 20 dias" THEN 3
      WHEN ${faixa_dias_internacao} = "21 a 30 dias" THEN 4
      WHEN ${faixa_dias_internacao} = "31 dias ou mais" THEN 5
      ELSE 6
    END ;;
    hidden: no
  }
  measure: percentual_internacoes_vindas_ps {
    label: "% de Internações que vieram do Pronto Socorro"
    type: number
    sql:
    SAFE_DIVIDE(
      SUM(CASE
            WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
             AND UPPER(${porta_entrada}) = 'EMERGENCIAL'
            THEN ${qtd_evento}
          END),
      SUM(CASE
            WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
            THEN ${qtd_evento}
          END)
    ) ;;
    value_format_name: "percent_2"
    description: "Percentual de internações cuja porta de entrada foi o pronto socorro (emergencial)."
  }
  measure: percentual_ps_que_virou_internacao {
    label: "% de PS que virou Internação"
    type: number
    sql:
    SAFE_DIVIDE(
      SUM(CASE
            WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
             AND UPPER(${porta_entrada}) = 'EMERGENCIAL'
            THEN ${qtd_evento}
          END),
      SUM(CASE
            WHEN UPPER(${tipo_evento}) = 'PRONTO SOCORRO'
            THEN ${qtd_evento}
          END)
    ) ;;
    value_format_name: "percent_2"
    description: "Percentual de atendimentos de pronto socorro que resultaram em internação (porta de entrada emergencial)."
  }
  dimension: faixa_uso_ps {
    label: "Faixa de Uso - Pronto Socorro"
    type: string
    sql:
    CASE
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'pronto socorro'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 1 AND 5 THEN 'Qtd 01 a 05'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'pronto socorro'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 6 AND 10 THEN 'Qtd 06 a 10'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'pronto socorro'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 11 AND 15 THEN 'Qtd 11 a 15'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'pronto socorro'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 16 AND 20 THEN 'Qtd 16 a 20'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'pronto socorro'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) >= 21 THEN 'Qtd 21 ou +'
      ELSE 'Sem Consultas'
    END ;;
  }
  dimension: faixa_uso_consulta {
    label: "Faixa de Uso - Consulta"
    type: string
    sql:
      CASE
        WHEN (
          SELECT SUM(s.qtd_evento)
          FROM `dashboard_health_team.sinistros` s
          WHERE s.Usuario = ${usuario}
            AND LOWER(s.Tipo_Evento) = 'consulta'
            AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
        ) BETWEEN 1 AND 5 THEN 'Qtd 01 a 05'
        WHEN (
          SELECT SUM(s.qtd_evento)
          FROM `dashboard_health_team.sinistros` s
          WHERE s.Usuario = ${usuario}
            AND LOWER(s.Tipo_Evento) = 'consulta'
            AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
        ) BETWEEN 6 AND 10 THEN 'Qtd 06 a 10'
        WHEN (
          SELECT SUM(s.qtd_evento)
          FROM `dashboard_health_team.sinistros` s
          WHERE s.Usuario = ${usuario}
            AND LOWER(s.Tipo_Evento) = 'consulta'
            AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
        ) BETWEEN 11 AND 15 THEN 'Qtd 11 a 15'
        WHEN (
          SELECT SUM(s.qtd_evento)
          FROM `dashboard_health_team.sinistros` s
          WHERE s.Usuario = ${usuario}
            AND LOWER(s.Tipo_Evento) = 'consulta'
            AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
        ) BETWEEN 16 AND 20 THEN 'Qtd 16 a 20'
        WHEN (
          SELECT SUM(s.qtd_evento)
          FROM `dashboard_health_team.sinistros` s
          WHERE s.Usuario = ${usuario}
            AND LOWER(s.Tipo_Evento) = 'consulta'
            AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
        ) >= 21 THEN 'Qtd 21 ou +'
        ELSE 'Sem Consultas'
      END ;;}
  dimension: faixa_uso_exame {
    label: "Faixa de Uso - Exame"
    type: string
    sql:
    CASE
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'exame'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 1 AND 5 THEN 'Qtd 01 a 05'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'exame'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 6 AND 10 THEN 'Qtd 06 a 10'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'exame'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 11 AND 15 THEN 'Qtd 11 a 15'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'exame'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) BETWEEN 16 AND 20 THEN 'Qtd 16 a 20'
      WHEN (
        SELECT SUM(s.qtd_evento)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND LOWER(s.Tipo_Evento) = 'exame'
          AND s.Periodo IN ('Último mês', 'Últimos 3 meses', 'Últimos 6 meses', 'Últimos 12 meses')
      ) >= 21 THEN 'Qtd 21 ou +'
      ELSE 'Sem Consultas'
    END ;;
  }
  dimension: faixa_uso_consulta_ordem {
    label: "Ordem da Faixa de Uso consulta"
    type: number
    sql:
    CASE
      WHEN ${faixa_uso_consulta} = 'Qtd 01 a 05' THEN 1
      WHEN ${faixa_uso_consulta} = 'Qtd 06 a 10' THEN 2
      WHEN ${faixa_uso_consulta} = 'Qtd 11 a 15' THEN 3
      WHEN ${faixa_uso_consulta} = 'Qtd 16 a 20' THEN 4
      WHEN ${faixa_uso_consulta} = 'Qtd 21 ou +' THEN 5
      ELSE 6
    END ;;
  }
  dimension: faixa_uso_ps_ordem {
    label: "Ordem da Faixa de Uso de PS"
    type: number
    sql:
    CASE
      WHEN ${faixa_uso_ps} = 'Qtd 01 a 05' THEN 1
      WHEN ${faixa_uso_ps} = 'Qtd 06 a 10' THEN 2
      WHEN ${faixa_uso_ps} = 'Qtd 11 a 15' THEN 3
      WHEN ${faixa_uso_ps} = 'Qtd 16 a 20' THEN 4
      WHEN ${faixa_uso_ps} = 'Qtd 21 ou +' THEN 5
      ELSE 6
    END ;;
  }
  dimension: faixa_uso_exame_ordem {
    label: "Ordem da Faixa de Uso de Exame"
    type: number
    sql:
    CASE
      WHEN ${faixa_uso_exame} = 'Qtd 01 a 05' THEN 1
      WHEN ${faixa_uso_exame} = 'Qtd 06 a 10' THEN 2
      WHEN ${faixa_uso_exame} = 'Qtd 11 a 15' THEN 3
      WHEN ${faixa_uso_exame} = 'Qtd 16 a 20' THEN 4
      WHEN ${faixa_uso_exame} = 'Qtd 21 ou +' THEN 5
      ELSE 6
    END ;;
  }
  dimension: risco_gestacao {
    type:  string
    sql:   CASE
            WHEN ${idade} <=18 OR ${idade} >=34
            THEN 'Com Risco' ELSE 'Sem Risco'
          END ;;
  }
  measure: custo_medio_parto {
    label: "Custo Médio por Parto"
    type: number
    sql: ${total_sinistro} / NULLIF(${count_distinct_senha_parto}, 0) ;;
    value_format: "\"R$\" #,##0.00"
    description: "Calcula o custo médio por senha: total de sinistros dividido pelo número distinto de senhas."
  }
  measure: count_distinct_senha {
    type: count_distinct
    sql: ${TABLE}.senha ;;
  }

  measure: count_distinct_senha_parto {
    type: count_distinct
    sql: ${TABLE}.senha_parto ;;
  }

  measure: percentual_utilizante_ativo_34 {
    label: "% Utilizante Ativo 34"
    type: number
    sql:
    SAFE_DIVIDE(
      COUNT(DISTINCT ${usuario}),
      AVG(${beneficiarios_34_ativos_empresa_operadora})
    ) ;;
    value_format_name: "percent_2"
    description: "Percentual de beneficiários ativos que utilizaram o plano no período."
  }
  measure: percentual_nao_utilizante_ativo_34 {
    label: "% Não Utilizando Ativo 34"
    type: number
    sql:
    1 - SAFE_DIVIDE(
      COUNT(DISTINCT ${usuario}),
      AVG(${beneficiarios_34_ativos_empresa_operadora})
    ) ;;
    value_format_name: "percent_2"
    description: "Percentual de beneficiários ativos que não utilizaram o plano no período."
  }
  measure: usuarios_sem_consulta_eletiva {
    label: "Usuários sem Consulta Eletiva"
    type: count_distinct
    sql:
    CASE
      WHEN ${teve_consulta_12m} = FALSE
      THEN ${usuario}
    END ;;
    value_format: "#,##0"
    description: "Número de usuários distintos que não realizaram consulta eletiva nos últimos 12 meses."
  }
  measure: usuarios_sem_exames {
    label: "Usuários sem Exames"
    type: count_distinct
    sql:
    CASE
      WHEN ${teve_exame_12m} = FALSE
      THEN ${usuario}
    END ;;
    value_format: "#,##0"
    description: "Número de usuários distintos que não realizaram exames nos últimos 12 meses."
  }
  measure: representacao_usuarios_sem_consulta {
    label: "% Usuários sem Consulta Eletiva"
    type: number
    sql:
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN ${teve_consulta_12m} = FALSE THEN ${usuario} END),
      COUNT(DISTINCT ${usuario})
    ) ;;
    value_format_name: "percent_2"
    description: "Percentual de usuários que não realizaram consulta eletiva, em relação ao total de usuários distintos."
  }
  measure: representacao_usuarios_sem_exame {
    label: "% Usuários sem Exames"
    type: number
    sql:
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN ${teve_exame_12m} = FALSE THEN ${usuario} END),
      COUNT(DISTINCT ${usuario})
    ) ;;
    value_format_name: "percent_2"
    description: "Percentual de usuários que não realizaram exames, em relação ao total de usuários distintos."
  }
  measure: percentual_internacoes_emergenciais_por_senha {
    label: "% de Internações Emergenciais (por Senha)"
    type: number
    sql:
      SAFE_DIVIDE(
        COUNT(DISTINCT CASE
          WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
           AND UPPER(${porta_entrada}) = 'EMERGENCIAL'
          THEN ${senha}
        END),
        COUNT(DISTINCT CASE
          WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
          THEN ${senha}
        END)
      ) ;;
    value_format_name: "percent_2"
    description: "Percentual de internações emergenciais com base em senhas distintas."
  }
  measure: senhas_internacoes_eletivas {
    label: "Senhas de Internações Eletivas"
    type: count_distinct
    sql:
    CASE
      WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
       AND UPPER(${porta_entrada}) = 'ELETIVA'
      THEN ${senha}
    END ;;
    value_format: "#,##0"
    description: "Conta o número de senhas distintas associadas a internações com porta de entrada eletiva."
  }
  measure: senhas_internacoes_emergenciais {
    label: "Senhas de Internações Emergenciais"
    type: count_distinct
    sql:
    CASE
      WHEN UPPER(${tipo_evento}) = 'INTERNAÇÃO'
       AND UPPER(${porta_entrada}) = 'EMERGENCIAL'
      THEN ${senha}
    END ;;
    value_format: "#,##0"
    description: "Conta o número de senhas distintas associadas a internações com porta de entrada emergencial."
  }


  dimension: atendimento_antes_inicio_contrato {
    label: "Atendimento Antes do Início do Contrato"
    type: yesno
    sql:
    CASE
      WHEN ${data_atendto_date} < ${data_inicio_contrato_date} THEN TRUE
      ELSE FALSE
    END ;;
    description: "Indica se a data de atendimento ocorreu antes da data de início do contrato."
  }
  dimension: flag_tea {
    label: "Procedimentos TEA"
    type: yesno
    sql:
    CASE
      WHEN ${cd_tuss} IN (
        '10101112','25130358','25130412','50005103','50005138','50005170','50005189',
        '50005219','58007601','60010126','60101113','60101490','61010073','62010123',
        '64623661','64623670','64623688','64623696','72000010','72000020','72000080',
        '80004355','80004420','80028311','80028315','80028325','80028871','80029095',
        '80029107','80029116','90132177','90132188','90132199','90135177','90135188',
        '90135199','91000193','91000200','91000201','91000946','91000947'
      )
      THEN TRUE
      ELSE FALSE
    END ;;
    description: "Indica se o código TUSS do evento pertence à lista de procedimentos ligados a TEA definidos pela equipe de saúde."
  }
  measure: sinistro_ultimos_12_meses {
    label: "Sinistro (Últimos 12 Meses)"
    type: sum
    sql:
    CASE
      WHEN ${periodo} IN ('Últimos 12 meses','Últimos 6 meses','Últimos 3 meses','Último mês')
      THEN ${sinistro}
    END ;;
    value_format: "\"R$\" #,##0.00"
    description: "Soma o valor de sinistro referente aos períodos de até 12 meses (Últimos 12, 6, 3 meses e Último mês)."
  }
  dimension: flag_exames_incompativeis_sexo {
    label: "Flag - Exames Incompatíveis com o Sexo"
    type: yesno
    sql:
    CASE
      WHEN UPPER(${genero}) = 'MASCULINO'
       AND ${cd_tuss} IN (
         '41301374','41301552','41301102','40601137',
         '40901300','40901319','41301099','41301188'
       )
      THEN TRUE
      WHEN UPPER(${genero}) = 'FEMININO'
       AND ${cd_tuss} IN (
         '40309312','40316130','40316149','40317498'
       )
      THEN TRUE
      ELSE FALSE
    END ;;
    description: "Indica se o código TUSS do exame é incompatível com o gênero do beneficiário."
  }
  dimension: flag_consulta_valor_maior_que_reembolso {
    label: "Flag - Consulta com Valor Maior que Reembolso"
    type: yesno
    sql:
    CASE
      WHEN (
        CASE
          WHEN UPPER(${tipo_evento}) = 'CONSULTA'
          THEN ${sinistro}
        END
      ) > ${reembolso_consultas}
      THEN TRUE
      ELSE FALSE
    END ;;
    description: "Indica se o valor do sinistro de uma consulta é superior ao valor de reembolso registrado em reembolso_consultas."
  }

  # Cálcul ode Idade Média - Usuário único #

  dimension: flag_ultimo_registro {
    label: "Flag - Último Registro Único por Usuário"
    type: yesno
    sql:
    CASE
      WHEN STRUCT(${data_sinistro_date}, ${claim_id}) = (
        SELECT AS STRUCT MAX(s.Data_Sinistro), MAX(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
      )
      THEN TRUE
      ELSE FALSE
    END ;;
    description: "Marca como TRUE apenas o registro mais recente e único de cada usuário, considerando data_sinistro e caim_id como desempate."
  }
  dimension: flag_ultimo_registro_consulta {
    label: "Flag - Último Registro Único por Usuário - Consulta"
    type: yesno
    sql:
    CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Consulta'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Consulta'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }

  dimension: flag_ultimo_registro_exame {
    label: "Flag - Último Registro Único por Usuário - exame"
    type: yesno
    sql:
    CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Exame'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Exame'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }

  dimension: flag_ultimo_registro_home_care {
    label: "Flag - Último Registro Único por Usuário - Home Care"
    type: yesno
    sql:
     CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Home Care'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Home Care'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }
  dimension: flag_ultimo_registro_internacao {
    label: "Flag - Último Registro Único por Usuário - Internacao"
    type: yesno
    sql:
     CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Internação'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Internação'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }
  dimension: flag_ultimo_registro_ps {
    label: "Flag - Último Registro Único por Usuário - PS"
    type: yesno
    sql:
     CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Pronto Socorro'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Pronto Socorro'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }
  dimension: flag_ultimo_registro_proc_amb {
    label: "Flag - Último Registro Único por Usuário - Procedimento Ambulatorial"
    type: yesno
    sql:
     CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Proc. Ambulatorial'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Proc. Ambulatorial'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }
  dimension: flag_ultimo_registro_terapia {
    label: "Flag - Último Registro Único por Usuário - Terapia"
    type: yesno
    sql:
     CASE
      WHEN ${data_sinistro_date} = (
        SELECT MAX(s.Data_Sinistro)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Terapia'
      )
      AND ${claim_id} = (
        SELECT MIN(s.claim_id)
        FROM `dashboard_health_team.sinistros` s
        WHERE s.Usuario = ${usuario}
          AND INITCAP(s.Tipo_Evento) = 'Terapia'
          AND s.Data_Sinistro = ${data_sinistro_date}
      )
      THEN TRUE ELSE FALSE
    END ;;
  }


  ## Idades Médias para páginas - Usuário Único ##

  measure: idade_media_unica {
    label: "Idade Média (Usuário Único)"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }
  measure: idade_media_unica_consulta {
    label: "Idade Média (Usuário Único)- Consultas"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_consulta} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }
  measure: idade_media_unica_exames {
    label: "Idade Média (Usuário Único)- Exames"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_exame} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }
  measure: idade_media_unica_home_care {
    label: "Idade Média (Usuário Único)- Home Care"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_home_care} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }

  measure: idade_media_unica_internacao {
    label: "Idade Média (Usuário Único)- Internação"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_internacao} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }

  measure: idade_media_unica_ps {
    label: "Idade Média (Usuário Único)- PS"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_ps} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }

  measure: idade_media_unica_proc_amb {
    label: "Idade Média (Usuário Único)- Procedimento Ambulatorial"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_proc_amb} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }

  measure: idade_media_unica_terapia {
    label: "Idade Média (Usuário Único)- Terapia"
    type: average
    sql:
    CASE
      WHEN ${flag_ultimo_registro_terapia} THEN ${idade}
    END ;;
    value_format: "0"
    description: "Média de idade considerando apenas o último registro (mais recente e único) de cada usuário."
  }



}
