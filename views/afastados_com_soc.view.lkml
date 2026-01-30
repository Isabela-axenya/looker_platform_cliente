view: afastados_com_soc {
  sql_table_name: `elevated-oven-434719-m1.dashboard_health_team.afastados_com_soc` ;;

  #####################
  # DIMENSÕES BÁSICAS #
  #####################

  dimension: arquivo_origem {
    type: string
    sql: ${TABLE}.arquivo_origem ;;
  }
  dimension: area_de_atuacao {
    type: string
    sql: ${TABLE}.area_de_atuacao ;;
  }
  dimension: codempresa {
    type: string
    sql: ${TABLE}.codempresa ;;
  }
  dimension_group: competencia_arquivo {
    type: time
    timeframes: [raw, date, month, year]
    sql: ${TABLE}.competencia_arquivo ;;
    description: "Data de competência do arquivo recebido."
  }
  dimension: competencia_ano_mes {
    label: "Competência (Ano-Mês)"
    type: string
    sql: FORMAT_DATE('%Y-%m', ${competencia_arquivo_date}) ;;
    description: "Data de competência no formato ano-mês."
  }
  dimension: filial {
    type: string
    sql: ${TABLE}.filial ;;
  }
  dimension: grupo_patologico_soc {
    type: string
    sql: ${TABLE}.grupo_patologico_soc ;;
  }
  dimension: grupo_patologico_soc_filter {
    type: string
    sql: ${TABLE}.grupo_patologico_soc ;;
  }
  dimension: cod_estab {
    type: string
    sql: ${TABLE}.cod_estab ;;
  }
  dimension: conselho_de_classe_soc {
    type: string
    sql: ${TABLE}.conselho_de_classe_soc ;;
  }
  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }
  dimension: uf {
    type: string
    sql: ${TABLE}.uf ;;
  }
  dimension: nome_diretoria {
    type: string
    sql: ${TABLE}.nome_diretoria ;;
  }
  dimension: descr_cr {
    type: string
    sql: ${TABLE}.descr_cr ;;
  }
  dimension: dia_da_semana_soc {
    label: "Dia da Semana (SOC)"
    type: string
    sql: INITCAP(${TABLE}.dia_da_semana_soc) ;;
    order_by_field: dia_da_semana_ordem_soc
    description: "Dia da semana do afastamento, exibido com capitalização e ordenado de segunda a domingo."
  }
  dimension: dia_da_semana_ordem_soc {
    hidden: yes
    type: number
    sql:
    CASE
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'segunda-feira' THEN 1
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'terça-feira' THEN 2
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'quarta-feira' THEN 3
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'quinta-feira' THEN 4
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'sexta-feira' THEN 5
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'sábado' THEN 6
      WHEN LOWER(${TABLE}.dia_da_semana_soc) = 'domingo' THEN 7
      ELSE 8
    END ;;
    description: "Campo auxiliar para garantir a ordenação correta dos dias da semana (segunda → domingo)."
  }
  dimension: dias_afastado {
    type: number
    sql: ${TABLE}.dias_afastado ;;
  }
  dimension: dias_soc {
    type: number
    sql: ${TABLE}.dias_soc ;;
  }
  dimension: dias_uteis_atestado {
    type: number
    sql: ${TABLE}.dias_uteis_atestado ;;
  }
  dimension: dias_uteis_mes {
    type: number
    sql: ${TABLE}.dias_uteis_mes ;;
  }
  dimension: id_empresa_empregado {
    hidden:  yes
    type: string
    sql: ${TABLE}.id_empresa_empregado ;;
  }
  dimension: nome_beneficiario {
    hidden:  yes
    type: string
    sql: ${TABLE}.nome_beneficiario ;;
  }
  dimension: funcao {
    hidden:  yes
    type: string
    sql: ${TABLE}.funcao ;;
  }
  dimension: cod_funcao {
    type: string
    sql: ${TABLE}.cod_funcao ;;
  }
  dimension: matricula {
    hidden:  yes
    type: string
    sql: ${TABLE}.matricula ;;
  }
  dimension: genero {
    type: string
    sql: ${TABLE}.genero ;;
  }
  dimension: data_admissao {
    type: date
    sql: ${TABLE}.data_admissao ;;
  }
  dimension: data_de_nascimento {
    hidden:  yes
    type: date
    sql: ${TABLE}.data_de_nascimento ;;
  }
  dimension: faixa_etaria {
    label: "Faixa Etária"
    type: string
    sql:
    CASE
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) < 19 THEN '0 a 18 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 19 AND 23 THEN '19 a 23 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 24 AND 28 THEN '24 a 28 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 29 AND 33 THEN '29 a 33 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 34 AND 38 THEN '34 a 38 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 39 AND 43 THEN '39 a 43 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 44 AND 48 THEN '44 a 48 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 49 AND 53 THEN '49 a 53 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) BETWEEN 54 AND 58 THEN '54 a 58 anos'
      WHEN DATE_DIFF(DATE(${competencia_arquivo_date}), DATE(${data_de_nascimento}), YEAR) >= 59 THEN '59 ou mais anos'
      ELSE 'Não informado'
    END ;;
    description: "Faixa etária calculada com base na diferença entre a data de nascimento e a competência do arquivo."
  }
  dimension: saida_afast {
    type: date
    sql: ${TABLE}.saida_afast ;;
  }
  dimension: retorno_afast {
    type: date
    sql: ${TABLE}.retorno_afast ;;
  }
  dimension: data_do_desligamento {
    type: date
    sql: ${TABLE}.data_do_desligamento ;;
  }
  dimension: data_do_afastamento_aposentadoria {
    type: date
    sql: ${TABLE}.data_do_afastamento_aposentadoria ;;
  }
  dimension: parecer_da_convocacao_apenas_aposentados {
    type: string
    sql: ${TABLE}.parecer_da_convocacao_apenas_aposentados ;;
  }
  dimension: data_da_alta_do_inss {
    type: date
    sql: ${TABLE}.data_da_alta_do_inss ;;
  }
  dimension: data_retorno_ao_trabalho {
    type: date
    sql: ${TABLE}.data_retorno_ao_trabalho ;;
  }
  dimension: data_proxima_pericia_convocacao {
    type: date
    sql: ${TABLE}.data_proxima_pericia_convocacao ;;
  }
  dimension: nome_normalizado {
    hidden:  yes
    type: string
    sql: ${TABLE}.nome_normalizado ;;
  }
  dimension: responsavel {
    hidden:  yes
    type: string
    sql: ${TABLE}.responsavel ;;
  }
  dimension: mercado {
    type: string
    sql: ${TABLE}.mercado ;;
  }
  dimension: status_do_programa {
    label: "Status do Programa"
    type: string
    sql:
    CASE
      WHEN LOWER(${TABLE}.status_do_programa) = 'verde' THEN 'Conseguimos atuar normalmente'
      WHEN LOWER(${TABLE}.status_do_programa) = 'amarelo' THEN 'Dificuldade de contato / Telefone errado'
      WHEN LOWER(${TABLE}.status_do_programa) = 'laranja' THEN 'Casos enviados para RH ou Jurídico'
      WHEN LOWER(${TABLE}.status_do_programa) = 'vermelho' THEN 'Sem contato / Envio de telegrama / Sem ciência do beneficiário'
      WHEN LOWER(${TABLE}.status_do_programa) = 'roxo' THEN 'Esgotadas tentativas / Recusa / Suspensão de benefício'
      WHEN LOWER(${TABLE}.status_do_programa) = 'cinza' THEN 'Não classificado'
      ELSE LOWER(${TABLE}.status_do_programa)
    END ;;
    order_by_field: status_do_programa_ordem
    description: "Status do programa traduzido conforme classificação de cores e suas descrições."
  }
  dimension: status_do_programa_ordem {
    type: number
    hidden: yes
    sql:
    CASE
      WHEN LOWER(${TABLE}.status_do_programa) = 'verde' THEN 1
      WHEN LOWER(${TABLE}.status_do_programa) = 'amarelo' THEN 2
      WHEN LOWER(${TABLE}.status_do_programa) = 'laranja' THEN 3
      WHEN LOWER(${TABLE}.status_do_programa) = 'vermelho' THEN 4
      WHEN LOWER(${TABLE}.status_do_programa) = 'roxo' THEN 5
      ELSE 6
    END ;;
    description: "Define a ordem de exibição das cores do status do programa."
  }
  dimension: tipo_de_afastamento_inicial {
    type: string
    sql: ${TABLE}.tipo_de_afastamento_inicial ;;
  }
  dimension: beneficio_tranformado {
    type: string
    sql: ${TABLE}.beneficio_tranformado ;;
  }
  dimension: especie_do_beneficio {
    type: string
    sql: ${TABLE}.especie_do_beneficio ;;
  }
  dimension: cid_principal {
    type: string
    sql: ${TABLE}.cid_principal ;;
  }
  dimension: cid_esquerda {
    label: "Grupo CID"
    type: string
    sql: CASE WHEN ${cid_principal} IN ('SEM CID','Sem Informação') THEN  'Sem Informação' ELSE LEFT(${cid_principal},1) END;;
  }
  dimension: outros_cids {
    type: string
    sql: ${TABLE}.outros_cids ;;
  }
  dimension: descricao_cid {
    type: string
    sql: CASE
      WHEN ${TABLE}.descricao_cid = 'SI' THEN 'SI - Sem Informação'
      ELSE ${TABLE}.descricao_cid END ;;
  }
  dimension: especialidade_tratamento_atual {
    type: string
    sql: ${TABLE}.especialidade_tratamento_atual ;;
  }
  dimension: data_da_ultima_pericia {
    type: string
    sql: ${TABLE}.data_da_ultima_pericia ;;
  }
  dimension: presencial_ou_documental {
    type: string
    sql: ${TABLE}.presencial_ou_documental ;;
  }
  dimension: resultado {
    type: string
    sql: ${TABLE}.resultado ;;
  }
  dimension: data_da_previsao_de_alta {
    type: date
    sql: ${TABLE}.data_da_previsao_de_alta ;;
  }
  dimension: convocacao_pelo_inssapenas_aposentados {
    type: string
    sql: ${TABLE}.convocacao_pelo_inssapenas_aposentados ;;
  }
  dimension: telefone_de_contato {
    hidden:  yes
    type: string
    sql: ${TABLE}.telefone_de_contato ;;
  }
  dimension: data_do_contato {
    type: date
    sql: ${TABLE}.data_do_contato ;;
  }
  dimension: dificuldade_de_contato {
    type: string
    sql: ${TABLE}.dificuldade_de_contato ;;
  }
  dimension: motivo_de_dificuldade {
    type: string
    sql: ${TABLE}.motivo_de_dificuldade ;;
  }
  dimension: motivo_licenca_soc  {
    type:  string
    sql: ${TABLE}.motivo_licenca_soc  ;;
  }
  dimension: nome_da_empresa {
    type: string
    sql: ${TABLE}.nome_da_empresa ;;
  }
  dimension: limbo {
    type: string
    sql: ${TABLE}.limbo ;;
  }
  dimension: processo_judicial {
    type: string
    sql: ${TABLE}.processo_judicial ;;
  }
  dimension: beneficio_inss {
    type: string
    sql: ${TABLE}.beneficio_inss ;;
  }
  dimension: convocacao_medico_trabalho {
    type: string
    sql: ${TABLE}.convocacao_medico_trabalho ;;
  }
  dimension: data_medico_do_trabalho {
    type: date
    sql: ${TABLE}.data_medico_do_trabalho ;;
  }
  dimension: parecer_medico_do_trabalho {
    type: string
    sql: ${TABLE}.parecer_medico_do_trabalho ;;
  }
  dimension: acao_no_caso {
    type: string
    sql: ${TABLE}.acao_no_caso ;;
  }
  dimension: telegrama {
    type: string
    sql: ${TABLE}.telegrama ;;
  }
  dimension: tempo_de_afastamento {
    type: string
    sql: ${TABLE}.tempo_de_afastamento ;;
  }
  dimension: tempo_de_afastamento_ordem {
    label: "Ordem Tempo de Afastamento"
    type: number
    sql:
    CASE
      WHEN ${tempo_de_afastamento} = 'Até 6 meses' THEN 1
      WHEN ${tempo_de_afastamento} = '6-11 meses' THEN 2
      WHEN ${tempo_de_afastamento} = '1-2 anos' THEN 3
      WHEN ${tempo_de_afastamento} = '3-5 anos' THEN 4
      WHEN ${tempo_de_afastamento} = '6-10 anos' THEN 5
      WHEN ${tempo_de_afastamento} = '11-15 anos' THEN 6
      WHEN ${tempo_de_afastamento} = '16-20 anos' THEN 7
      WHEN ${tempo_de_afastamento} = 'Mais de 20 anos' THEN 8
      ELSE 0
    END ;;
    description: "Campo auxiliar para garantir a ordenação correta das faixas de tempo de afastamento."
  }
  dimension: tipo_afastamento {
    type: string
    sql: ${TABLE}.tipo_afastamento ;;
  }
  dimension: tipo_licenca_soc {
    type: string
    sql: ${TABLE}.tipo_licenca_soc ;;
  }
  dimension: resolucaoamarelo_laranja_vermelho {
    type: string
    sql: ${TABLE}.resolucaoamarelo_laranja_vermelho ;;
  }
  dimension: historico_parecer_social {
    type: string
    sql: ${TABLE}.historico_parecer_social ;;
  }

  #######################
  # DIMENSÕES DERIVADAS #
  #######################

  ### Datas
  dimension: ultima_competencia_ano_mes_calc {
    label: "Última Competência (Mês/Ano)"
    type: string
    sql: (
       SELECT FORMAT_DATE('%Y-%m', DATE(MAX(competencia_arquivo)))
        FROM `elevated-oven-434719-m1.dashboard_health_team.afastados_com_soc`
    ) ;;

    description: "Ano e mês da última competência disponível na base."
  }
  dimension: data_retorno_ano_mes {
    label: "Data de Retorno Afastamento (Ano-Mês)"
    type: string
    sql: FORMAT_DATE('%Y-%m', DATE(COALESCE(${retorno_afast}, ${data_retorno_ao_trabalho}))) ;;
    description: "Data de retorno ao trabalho, priorizando 'retorno_afast' e, se nula, 'data_retorno_ao_trabalho'."
  }
  dimension: data_entrada_ano_mes {
    label: "Data de Entrada Afastamento (Ano-Mês)"
    type: string
    sql: FORMAT_DATE('%Y-%m', DATE(COALESCE(${saida_afast}, ${data_do_afastamento_aposentadoria}))) ;;
    description: "Data de início do afastamento, priorizando 'saida_afast' e, se nula, 'data_do_afastamento_aposentadoria'."
  }
  dimension: data_inicio_afastamento {
    label: "Data de Entrada Afastamento (Dia)"
    type: date
    sql: COALESCE(${saida_afast}, ${data_do_afastamento_aposentadoria}) ;;
    description: "Data consolidada de início do afastamento (prioriza 'saida_afast', se nula usa 'data_do_afastamento_aposentadoria')."
  }
  measure: dias_afastamento {
    label: "Dias Afastados"
    type: number
    sql: DATE_DIFF(${competencia_arquivo_date}, ${data_inicio_afastamento}, DAY) ;;
    description: "Diferença em dias entre a competência e a data de início do afastamento."
    value_format_name: "decimal_0"
  }

  ### Métricas Gerais
  measure: count {
    type: count
    description: "Contagem total de registros."
  }
  measure: total_arquivo_afastados {
    label: "Total Beneficiários Afastados"
    type: count_distinct
    sql: CASE
            WHEN ${arquivo_origem} = 'work_leave'
            THEN ${id_empresa_empregado}
            END;;
    description: "Contagem distinta de colaboradores afastados no arquivo afastado (work_leave)."
  }
  measure: total_arquivo_soc {
    label: "Total Beneficiários SOC"
    type: count_distinct
    sql: CASE
            WHEN ${arquivo_origem} = 'occupational_health_absenteeism'
            THEN ${id_empresa_empregado}
            END ;;
    description: "Contagem distinta de registros SOC"
  }
  measure: total_afastados {
    label: "Total de Afastados INSS Ativo"
    type: count_distinct
    sql:
    CASE
      WHEN  ${arquivo_origem} = 'work_leave' AND LOWER(${beneficio_inss}) = 'ativo'
      THEN ${id_empresa_empregado}
    END ;;
    description: "Total de afastados com inss ativo."
  }
  measure: retorno_ao_trabalho {
    label: "Retorno ao Trabalho"
    type: count_distinct
    sql:
    CASE
      WHEN LOWER(${resolucaoamarelo_laranja_vermelho}) = 'retorno ao trabalho'
      THEN ${id_empresa_empregado}
    END ;;
    description: "Total de colaboradores que retornaram ao trabalho"
  }
  measure: aguardando_pericia {
    label: "Aguardando Perícia"
    type: count_distinct
    sql:
    CASE
      WHEN LOWER(${resultado}) = 'aguardando perícia'
      THEN ${id_empresa_empregado}
    END ;;
    description: "Total de colaboradores aguardando perícia"
  }
  measure: indeferidos {
    label: "Indeferidos"
    type: count_distinct
    sql:
    CASE
      WHEN LOWER(${resultado}) = 'indeferido'
      THEN ${id_empresa_empregado}
    END ;;
    description: "Total de beneficiários indeferidos "
  }
  measure: limbo_colaboradores {
    label: "Em Limbo"
    type: count_distinct
    sql:
    CASE
      WHEN LOWER(${limbo}) = 'sim'
      THEN ${id_empresa_empregado}
    END ;;
    description: "Total de colaboradores em situação de limbo."
  }
  measure: colaboradores_com_previsao_retorno {
    label: "Colaboradores com Previsão de Retorno"
    type: count_distinct
    sql:
    CASE
      WHEN ${data_retorno_ano_mes} IS NOT NULL
      THEN ${id_empresa_empregado}
    END ;;
    description: "Conta o número de colaboradores (nome) que possuem data de previsão de retorno preenchida."
  }
  measure: total_absenteismo {
    label: "Total Não Afastados"
    type: count_distinct
    sql: CASE
            WHEN ${arquivo_origem} <> 'work_leave'
            THEN ${id_empresa_empregado}
            END ;;
    description: "Contagem distinta de SOC + SINREM"
  }
  dimension: movimentacao {
    label: "Movimentação (Entradas e Saídas de Afastamentos)"
    type: string
    sql:
    CASE
      -- Entrou e saiu no mesmo mês
      WHEN ${data_entrada_ano_mes} = ${data_retorno_ano_mes}
           AND ${data_entrada_ano_mes} = ${competencia_ano_mes}
        THEN 'Entrou e saiu do afastamento'

      -- Entrou no afastamento neste mês
      WHEN ${data_entrada_ano_mes} = ${competencia_ano_mes}
      THEN 'Entrou no Afastamento'

      -- Saiu do afastamento no mês
      WHEN ${data_retorno_ano_mes} = ${competencia_ano_mes}
      THEN 'Saiu do Afastamento'

      -- Continua afastado (entrada antes da competência e retorno depois)
      WHEN (${data_entrada_ano_mes} <= ${competencia_ano_mes}) AND ((${data_retorno_ano_mes} IS NULL) OR (${data_retorno_ano_mes} >= ${competencia_ano_mes}))
      THEN 'Afastamento Existente'

      -- Afastamento finalizado antes da competência
      WHEN ${data_retorno_ano_mes} < ${competencia_ano_mes}
      THEN 'Afastamento encerrado antes da competência'

      ELSE 'Não Classificado'
      END ;;
    description: "Classifica a movimentação do colaborador com base nas datas de entrada e retorno, cobrindo casos encerrados antes da competência."
  }
  measure: indice_absenteismo {
    label: "Índice de Absenteísmo (%)"
    type: number
    sql: SAFE_DIVIDE(SUM(${dias_uteis_atestado}), SUM(${dias_uteis_mes})) ;;
    value_format_name: "percent_2"
    description: "Percentual de dias úteis perdidos por afastamentos sobre o total de dias úteis no mês."
  }
  measure: doador_sangue {
    label: "Doador de Sangue"
    type: count_distinct
    sql:CASE WHEN INITCAP(${tipo_licenca_soc}) = 'Doação de Sangue' THEN ${id_empresa_empregado} END ;;
  }
  measure: acompanhamento {
    label: "Atestados de Acompanhamento"
    type: count_distinct
    sql:CASE WHEN INITCAP(${tipo_licenca_soc}) = 'Acompanhamento' THEN ${id_empresa_empregado} END ;;
  }
  dimension: eh_ultima_competencia {
    label: "É Última Competência id_empresa_empregado?"
    type: yesno
    sql: ${competencia_arquivo_date} = (
          SELECT MAX(competencia_arquivo)
          FROM `elevated-oven-434719-m1.dashboard_health_team.afastados_com_soc`
          WHERE id_empresa_empregado = ${TABLE}.id_empresa_empregado
        ) ;;
  }
  dimension: ultimo_ano_completo {
    label: "Último Ano Completo (12 meses)"
    type: number
    sql:
    (
      SELECT MAX(EXTRACT(YEAR FROM competencia_arquivo))
      FROM `elevated-oven-434719-m1.dashboard_health_team.afastados_com_soc`
      WHERE EXTRACT(YEAR FROM competencia_arquivo) IN (
        SELECT EXTRACT(YEAR FROM competencia_arquivo)
        FROM `elevated-oven-434719-m1.dashboard_health_team.afastados_com_soc`
        GROUP BY 1
        HAVING COUNT(DISTINCT FORMAT_DATE('%Y-%m', competencia_arquivo)) = 12
      )
    )
  ;;
    description: "Ano mais recente com 12 meses distintos de dados na tabela base."
  }


}
