# The name of this view in Looker is "Gerencial Monitoramento"
view: gerencial_monitoramento {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `monitoramento.gerencial_monitoramento` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Beneficiary Name" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: beneficiary_name {
    hidden: yes
    type: string
    sql: ${TABLE}.beneficiary_name ;;
  }

  dimension: canal_contato {
    type: string
    sql: ${TABLE}.canal_contato ;;
  }

  dimension: nome_carteira      { type: string sql: ${TABLE}.nome_carteira ;; }

  dimension: company_name {
    type: string
    sql:
    CASE
      WHEN LOWER(${TABLE}.company_name) = 'ultragaz corporate' THEN 'ultragaz'
      WHEN LOWER(${TABLE}.company_name) = '14º tabelionato corporate' THEN '14º tabelionato'
      ELSE LOWER(${TABLE}.company_name)
    END ;;
  }

  dimension: company_name_filter {
    type: string
    sql:
    CASE
      WHEN LOWER(${TABLE}.company_name) = 'ultragaz corporate' THEN 'Ultragaz'
      WHEN LOWER(${TABLE}.company_name) = '14º tabelionato corporate' THEN '14º Cartório'
      ELSE INITCAP(${TABLE}.company_name)
    END ;;
  }

  dimension_group: competencia_status {
    type: time
    timeframes: [raw, date, month, year]
    datatype: date
    sql: PARSE_DATE('%Y-%m-%d', ${TABLE}.competencia_status) ;;
  }

  dimension: contatos_emcap_cap {
    type: number
    sql: ${TABLE}.contatos_emcap_cap ;;
  }

  dimension: cpf {
    hidden: yes
    type: string
    sql: ${TABLE}.cpf ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_ligacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql:${TABLE}.data_ligacao;;
  }

  dimension: enfermeira {
    type: string
    sql: ${TABLE}.enfermeira ;;
  }

  dimension: person_id {
    hidden:  yes
    primary_key: yes
    type: string
    sql: ${TABLE}.person_id ;;
  }

  dimension: used_tool          { type: string sql: ${TABLE}.used_tool ;; }

  dimension: contact_attempt_status { type: string sql: ${TABLE}.contact_attempt_status ;; }

  dimension_group: status_criado {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.status_criado ;;
  }


  dimension_group: status_deletado {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.status_deletado ;;
  }

  dimension: status_monitoramento {
    type: string
    sql: ${TABLE}.status_monitoramento ;;
  }


  dimension: tipo_contato {
    type: string
    sql: ${TABLE}.tipo_contato ;;
  }

  dimension: tipo_contato_pt {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.tipo_contato = 'ACQUISITION_CONTACT' THEN 'Contato de Captação'
      WHEN ${TABLE}.tipo_contato = 'APPOINTMENT_CONFIRMATION_D_MINUS_1' THEN 'Confirmação de Atendimento D-1'
      WHEN ${TABLE}.tipo_contato = 'APPOINTMENT_CONFIRMATION_D_MINUS_5' THEN 'Confirmação de Agendamento D-5'
      WHEN ${TABLE}.tipo_contato = 'APPOINTMENT_REMINDER_D_MINUS_1' THEN 'Lembrete de Atendimento D-1'
      WHEN ${TABLE}.tipo_contato = 'APPOINTMENT_SCHEDULING_CONTACT' THEN 'Contato de Agendamento de Atendimento (retroativo)'
      WHEN ${TABLE}.tipo_contato = 'BIRTHDAY_CONTACT' THEN 'Contato de Aniversário'
      WHEN ${TABLE}.tipo_contato = 'CAMPAIGN_CONTACT' THEN 'Contato de Campanha'
      WHEN ${TABLE}.tipo_contato = 'CONTACT_CONFIRMATION' THEN 'Contato de Confirmação de Contato'
      WHEN ${TABLE}.tipo_contato = 'CONTACT_DIFFICULTY' THEN 'Contato de Dificuldade de Contato'
      WHEN ${TABLE}.tipo_contato = 'CSAT_NPS_CONTACT' THEN 'Contato de CSAT-NPS'
      WHEN ${TABLE}.tipo_contato = 'HYBRID_WELCOME_ACQUISITION' THEN 'Captação Boas Vindas Híbrido'
      WHEN ${TABLE}.tipo_contato = 'MONITORING_CONTACT' THEN 'Contato de Monitoramento'
      WHEN ${TABLE}.tipo_contato = 'NO_SHOW_RESCHEDULE_CONTACT' THEN 'Contato de Tentativa de contato + reagendamento pós falta'
      WHEN ${TABLE}.tipo_contato = 'REVERSAL_CONTACT' THEN 'Contato de Reversão'
      WHEN ${TABLE}.tipo_contato = 'WHATSAPP_FULL_ACQUISITION' THEN 'Captação completa WhatsApp'
      ELSE ${TABLE}.tipo_contato
    END ;;
  }


  dimension: total_ligacoes {
    type: number
    sql: ${TABLE}.total_ligacoes ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name]
  }

############## Cálculo de taxa de engajamento

# --- Dimensão: status válido no mês da ligação ---

  dimension: status_monitoramento_valido_no_mes {
    label: "Status de Monitoramento Válido no Mês"
    type: yesno
    sql:
    CASE
      WHEN ${status_monitoramento} IN (
        "MONITORADO", "BEING_MONITORED"                       -- BEING_MONITORED
        "DIFICULDADE_DE_CAPTACAO_1", "ACQUISITION_DIFFICULTY_1" ,       -- ACQUISITION_DIFFICULTY_1
        "CAPTADO", "ACQUISITION" ,                         -- ACQUISITION
        "DIFICULDADE_DE_CAPTACAO_2", "ACQUISITION_DIFFICULTY_2",        -- ACQUISITION_DIFFICULTY_2
        "CAPTACAO_PENDENTE_RH", "PENDING_ACQUISITION_HR",             -- PENDING_ACQUISITION_HR
        "COORDENADO",  "COORDINATED",                     -- COORDINATED
        "DIFICULDADE_DE_MONITORAMENTO_1", "MONITORING_DIFFICULTY_1",  -- MONITORING_DIFFICULTY_1
        "DIFICULDADE_DE_MONITORAMENTO_2", "MONITORING_DIFFICULTY_2",  -- MONITORING_DIFFICULTY_2
        "PENDING_MONITORING_HR", "MONITORAMENTO_PENDENTE_RH"         -- PENDING_MONITORING_HR
      )
      AND DATE_TRUNC(DATE(${TABLE}.data_ligacao), MONTH)
          BETWEEN DATE_TRUNC(DATE(${TABLE}.status_criado), MONTH)
          AND DATE_TRUNC(
            COALESCE(DATE(${TABLE}.status_deletado), CURRENT_DATE()),
            MONTH
          )
      THEN TRUE
      ELSE FALSE
    END ;;
  }


######### Construção de intervalo de contatos
  dimension: faixa_total_ligacoes {
    label: "Faixa de Total de Ligações"
    type: string
    sql:
    CASE
        WHEN COALESCE(${total_ligacoes}, 0) <= 0 THEN "a. 0 ligações"
        WHEN COALESCE(${total_ligacoes}, 0) BETWEEN 1 AND 2 THEN "a. 1 a 2 ligações"
        WHEN COALESCE(${total_ligacoes}, 0) BETWEEN 3 AND 5 THEN "b. 3 a 5 ligações"
        WHEN COALESCE(${total_ligacoes}, 0) BETWEEN 6 AND 10 THEN "c. 6 a 10 ligações"
        WHEN COALESCE(${total_ligacoes}, 0) BETWEEN 11 AND 20 THEN "d. 11 a 20 ligações"
        ELSE null
    END
    ;;
  }

  ### Contagem distinta de pessoas
  measure: distinct_person_count {
    label: "Distinct pessoas"
    type: count_distinct
    sql: ${person_id} ;;
  }

#### Tradução de Status Monitoramento

  dimension: status_monitoramento_pt {
    label: "Status de Monitoramento PT"
    type: string
    sql:
    CASE
      WHEN ${status_monitoramento} = 'NOVO_PACIENTE'                    THEN 'Novo Paciente'
      WHEN ${status_monitoramento} = 'DIFICULDADE_DE_CAPTACAO_1'       THEN 'Dificuldade de Captação 1'
      WHEN ${status_monitoramento} = 'CAPTACAO_PENDENTE_RH'            THEN 'Captação pendente RH'
      WHEN ${status_monitoramento} = 'DIFICULDADE_DE_CAPTACAO_2'       THEN 'Dificuldade de Captação 2'
      WHEN ${status_monitoramento} = 'CAPTADO'                         THEN 'Captado'
      WHEN ${status_monitoramento} = 'MONITORADO'                      THEN 'Monitorado'
      WHEN ${status_monitoramento} = 'COORDENADO'                      THEN 'Coordenado'
      WHEN ${status_monitoramento} = 'DIFICULDADE_DE_MONITORAMENTO_1'  THEN 'Dificuldade de monitoramento 1'
      WHEN ${status_monitoramento} = 'MONITORAMENTO_PENDENTE_RH'       THEN 'Monitoramento pendente RH'
      WHEN ${status_monitoramento} = 'DIFICULDADE_DE_MONITORAMENTO_2'  THEN 'Dificuldade de monitoramento 2'
      WHEN ${status_monitoramento} = 'ABANDONO_CAPTACAO'               THEN 'Abandono Captação'
      WHEN ${status_monitoramento} = 'ABANDONO_MONITORAMENTO'          THEN 'Abandono Monitoramento'
      WHEN ${status_monitoramento} = 'INATIVO'                         THEN 'Inativo'
      WHEN ${status_monitoramento} = 'REJEITADO'                       THEN 'Rejeitado'
      WHEN ${status_monitoramento} = 'ALTA'                            THEN 'Alta'
      WHEN ${status_monitoramento} = 'RECUSA'                          THEN 'Recusa'
      WHEN ${status_monitoramento} = 'CAPTACAO_EM_ANDAMENTO'                          THEN 'Captação em andamento'
      WHEN ${status_monitoramento} = 'ELIGIBLE'                         THEN 'Novo Paciente'
      WHEN ${status_monitoramento} = 'ACQUISITION'                         THEN 'Captado'
      WHEN ${status_monitoramento} = 'BEING_MONITORED'                         THEN 'Monitorado'
      WHEN ${status_monitoramento} = 'COORDINATED'                         THEN 'Coordenado'
      WHEN ${status_monitoramento} = 'DECLINED'                         THEN 'Recusa'
      WHEN ${status_monitoramento} = 'DISCHARGED'                         THEN 'Alta'
      WHEN ${status_monitoramento} = 'INACTIVE'                         THEN 'Inativo'
      WHEN ${status_monitoramento} = 'NOT_ELIGIBLE'                         THEN 'Rejeitado'
      WHEN ${status_monitoramento} = 'NON_ENGAGEMENT'                         THEN 'Abandono Captação'
      WHEN ${status_monitoramento} = 'SELF_DISCHARGED'                         THEN 'Alta'
      WHEN ${status_monitoramento} = 'UNREACHABLE'                         THEN 'Dificuldade de Captação 1'

      ELSE ${status_monitoramento}
      END ;;
  }


##### % Altas (Monitoramento)

  measure: distinct_discharged {
    label: "Pessoas com Alta"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "SELF_DISCHARGED, ALTA, DISCHARGED"]
  }

  measure: distinct_discharged_base {
    label: "Base de Avaliação (Altas)"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento:"ALTA, SELF_DISCHARGED, DISCHARGED,MONITORADO, BEING_MONITORED,ACQUISITION, CAPTADO, COORDENADO, COORDINATED,DIFICULDADE_DE_MONITORAMENTO_1, DIFICULDADE_DE_MONITORAMENTO_2, MONITORAMENTO_PENDENTE_RH"]

  }

  measure: discharge_rate {
    label: "% Altas no Monitoramento"
    type: number
    value_format_name: percent_2
    sql: ${distinct_discharged} / NULLIF(${distinct_discharged_base}, 0) ;;
  }

##### % Abandonos (Monitoramento)
  measure: distinct_abandoned {
    label: "Pessoas com Abandono"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "NON_ENGAGEMENT, ABANDONO_CAPTACAO, ABANDONO_MONITORAMENTO"]
  }

  measure: distinct_abandoned_base {
    label: "Base de Avaliação (Abandonos)"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "NON_ENGAGEMENT, ABANDONO_CAPTACAO, ABANDONO_MONITORAMENTO,MONITORADO, BEING_MONITORED,ACQUISITION, CAPTADO, COORDENADO, COORDINATED,DIFICULDADE_DE_MONITORAMENTO_1, DIFICULDADE_DE_MONITORAMENTO_2, MONITORAMENTO_PENDENTE_RH"]
  }


  measure: abandonment_rate {
    label: "% Abandonos no Monitoramento"
    type: number
    value_format_name: percent_2
    sql: ${distinct_abandoned} / NULLIF(${distinct_abandoned_base}, 0) ;;
  }


##### Construção do "Agrupamento de Status"
# 1. Indicador para o Grupo 'Em Contato'

  dimension: is_em_contato {
    label: "Grupo: Em Contato"
    type: yesno
    sql: ${status_monitoramento} IN (
          'MONITORADO','BEING_MONITORED','CAPTADO','ACQUISITION','COORDENADO', 'COORDINATED',
          'DIFICULDADE_DE_CAPTACAO_1', 'UNREACHABLE','DIFICULDADE_DE_CAPTACAO_2','CAPTACAO_PENDENTE_RH',
          'DIFICULDADE_DE_MONITORAMENTO_1', 'DIFICULDADE_DE_MONITORAMENTO_2', 'MONITORAMENTO_PENDENTE_RH'
        ) ;;
  }


# 2. Indicador para o Grupo 'Monitoramento Ativo'
  dimension: is_monitoramento_ativo {
    label: "Grupo: Monitoramento Ativo"
    type: yesno
    sql: ${status_monitoramento} IN (
          'MONITORADO','BEING_MONITORED',
          'CAPTADO','ACQUISITION',
          'COORDENADO', 'COORDINATED',
          'DIFICULDADE_DE_MONITORAMENTO_1',
          'DIFICULDADE_DE_MONITORAMENTO_2',
          'MONITORAMENTO_PENDENTE_RH'
        ) ;;
  }

# 3. Indicador para o Grupo 'Dificuldade Monitoramento'
  dimension: is_dificuldade_monitoramento {
    label: "Grupo: Dificuldade Monitoramento"
    type: yesno
    sql: ${status_monitoramento} IN (
          'DIFICULDADE_DE_MONITORAMENTO_1',
          'DIFICULDADE_DE_MONITORAMENTO_2',
          'MONITORAMENTO_PENDENTE_RH'
        ) ;;
  }

# 4. Indicador para o Grupo 'Dificuldade Captação'
  dimension: is_dificuldade_captacao {
    label: "Grupo: Dificuldade Captação"
    type: yesno
    sql: ${status_monitoramento} IN (
          'DIFICULDADE_DE_CAPTACAO_1',
          'UNREACHABLE',
          'CAPTACAO_PENDENTE_RH',
          'DIFICULDADE_DE_CAPTACAO_2'
        ) ;;
  }

  dimension: rn_mes {
    type: number
    sql: ${TABLE}.rn_mes  ;;
  }

  dimension: data_ligacao_ord_desc {
    hidden: yes
    type: number
    sql: - (EXTRACT(YEAR FROM ${TABLE}.data_ligacao) * 10000
         + EXTRACT(MONTH FROM ${TABLE}.data_ligacao) * 100
         + EXTRACT(DAY FROM ${TABLE}.data_ligacao)) ;;
  }

  dimension: data_ligacao_mes_ano {
    type: string
    label: "Mês/Ano Ligação"
    sql: FORMAT_DATE('%d/%m/%Y', ${TABLE}.data_ligacao) ;;
    order_by_field: data_ligacao_ord_desc
  }


  dimension: status_criado_ord_desc {
    hidden: yes
    type: number
    sql: - (EXTRACT(YEAR FROM ${TABLE}.status_criado) * 10000
        + EXTRACT(MONTH FROM ${TABLE}.status_criado) * 100
        + EXTRACT(DAY FROM ${TABLE}.status_criado)) ;;
  }

  dimension: status_criado_mes_ano {
    type: string
    label: "Mês/Ano Status Criado"
    sql: FORMAT_DATE('%d/%m/%Y', ${TABLE}.status_criado) ;;
    order_by_field: status_criado_ord_desc
  }

  dimension: origem {
    type: string
    sql: ${TABLE}.origem ;;
  }


  measure: dias_desde_ultimo_status {
    label: "Dias desde o último Status até hoje"
    sql: DATE_DIFF(
      CURRENT_DATE(),
      DATE(MAX(${TABLE}.status_criado)), DAY) ;;
  }


  # --- Medidas de contagem (pessoa pode estar em mais de um grupo) ---
  measure: qtd_em_contato {
    type: count_distinct
    sql: CASE WHEN ${is_em_contato} THEN ${person_id} END ;;
    label: "Qtd Pessoas - Em Contato"
  }

  measure: qtd_monitoramento_ativo {
    type: count_distinct
    sql: CASE WHEN ${is_monitoramento_ativo} THEN ${person_id} END ;;
    label: "Qtd Pessoas - Monitoramento Ativo"
  }

  measure: qtd_dificuldade_monitoramento {
    type: count_distinct
    sql: CASE WHEN ${is_dificuldade_monitoramento} THEN ${person_id} END ;;
    label: "Qtd Pessoas - Dificuldade Monitoramento"
  }

  measure: qtd_dificuldade_captacao {
    type: count_distinct
    sql: CASE WHEN ${is_dificuldade_captacao} THEN ${person_id} END ;;
    label: "Qtd Pessoas - Dificuldade Captação"
  }

  dimension: mes_captado {
    type: string
    sql:
    CASE
      WHEN ${status_monitoramento_pt} = 'Captado'
       AND ${status_criado_date} = ${ultimo_status_questionario_captacao.data_resposta_questionario_raw}
      THEN FORMAT_DATE('%m/%Y', ${ultimo_status_questionario_captacao.data_resposta_questionario_raw})
      ELSE NULL
    END ;;
  }

################## Métricas Dashboard do Cliente - Participação Programas (MC)

  # Dimensão para JOIN com beneficiarios_hub
  dimension: beneficiary_id {
    hidden: yes
    type: string
    sql: ${TABLE}.beneficiary_id ;;
  }

  #################################
  # Entradas e Saídas no Programa #
  #################################

  # Entradas mensais
  measure: entradas_mes {
    label: "Entradas no Programa (Primeiro Mês Ativo)"
    description: "Conta o primeiro mês em que o beneficiário entra em um status ativo de monitoramento."
    type: count_distinct
    sql:
          CASE
            WHEN ${rn_mes} = 1
             AND ${status_monitoramento} IN (
                'CAPTADO','ACQUISITION', 'MONITORADO','BEING_MONITORED', 'COORDENADO', 'COORDINATED'
                'DIFICULDADE_DE_MONITORAMENTO_1', 'DIFICULDADE_DE_MONITORAMENTO_2',
                'MONITORAMENTO_PENDENTE_RH'
             )
             AND FORMAT_TIMESTAMP('%Y-%m', ${status_criado_raw}) = (
                SELECT MIN(FORMAT_TIMESTAMP('%Y-%m', sub.status_criado))
                FROM `monitoramento.gerencial_monitoramento` AS sub
                WHERE sub.person_id = ${person_id}
                  AND sub.status_monitoramento IN (
                    'MONITORADO','BEING_MONITORED', 'COORDENADO', 'COORDINATED'
                'DIFICULDADE_DE_MONITORAMENTO_1', 'DIFICULDADE_DE_MONITORAMENTO_2',
                'MONITORAMENTO_PENDENTE_RH'
                  )
             )
            THEN ${person_id}
          END ;;
  }

  # Saídas mensais
  measure: saidas_mes {
    label: "Saídas do Programa (Mês de Saída)"
    description: "Conta o primeiro mês em que o beneficiário assume um status de saída do programa."
    type: count_distinct
    sql:
          CASE
            WHEN ${rn_mes} = 1
             AND ${status_monitoramento} IN (
                'ALTA','SELF_DISCHARGED', 'DISCHARGED', 'ABANDONO_MONITORAMENTO',
                'ABANDONO_CAPTACAO','NON_ENGAGEMENT'--, 'REJEITADO', 'NOT_ELIGIBLE', 'RECUSA', 'DECLINED'
             )
             AND FORMAT_TIMESTAMP('%Y-%m', ${status_criado_raw}) = (
                SELECT MIN(FORMAT_TIMESTAMP('%Y-%m', sub.status_criado))
                FROM `monitoramento.gerencial_monitoramento` AS sub
                WHERE sub.person_id = ${person_id}
                  AND sub.status_monitoramento IN (
                    'ALTA','SELF_DISCHARGED', 'DISCHARGED', 'ABANDONO_MONITORAMENTO','NON_ENGAGEMENT',
                'ABANDONO_CAPTACAO'--,'REJEITADO', 'NOT_ELIGIBLE', 'RECUSA', 'DECLINED'
                  )
             )
            THEN ${person_id}
          END ;;
    # Tooltip customizado via HTML
        html:
          <div style="font-family: Arial; font-size: 12px; line-height: 1.4;">
            <strong>Total de Saídas:</strong> {{ rendered_value }}<br/>
            <hr style="border: 0.5px solid #ccc; margin: 5px 0;"/>
            <span style="color: #4CAF50;">●</span> <strong>Altas:</strong> {{ saidas_altas_detalhe._rendered_value }}<br/>
            <span style="color: #FF9800;">●</span> <strong>Abandono:</strong> {{ saidas_abandono_detalhe._rendered_value }}
          </div> ;;
  }

# Medida Auxiliar: Altas no Mês

  measure: saidas_altas_detalhe {
    hidden: yes
    type: count_distinct
    sql:
      CASE
        WHEN ${rn_mes} = 1
        AND ${status_monitoramento} IN ('ALTA','DISCHARGED')
        AND FORMAT_TIMESTAMP('%Y-%m', ${status_criado_raw}) = (
            SELECT MIN(FORMAT_TIMESTAMP('%Y-%m', sub.status_criado))
            FROM `monitoramento.gerencial_monitoramento` AS sub
            WHERE sub.person_id = ${person_id}
              AND sub.status_monitoramento IN ('ALTA','SELF_DISCHARGED', 'DISCHARGED', 'ABANDONO_MONITORAMENTO', 'NON_ENGAGEMENT',
              'ABANDONO_CAPTACAO'--, 'REJEITADO', 'NOT_ELIGIBLE', 'RECUSA', 'DECLINED'
              )
        )
        THEN ${person_id}
      END ;;
  }

  # Medida Auxiliar: Abandono no Mês
  measure: saidas_abandono_detalhe {
    hidden: yes
    type: count_distinct
    sql:
      CASE
        WHEN ${rn_mes} = 1
        AND ${status_monitoramento} IN ('SELF_DISCHARGED','NON_ENGAGEMENT','ABANDONO_MONITORAMENTO', 'ABANDONO_CAPTACAO')
        AND FORMAT_TIMESTAMP('%Y-%m', ${status_criado_raw}) = (
            SELECT MIN(FORMAT_TIMESTAMP('%Y-%m', sub.status_criado))
            FROM `monitoramento.gerencial_monitoramento` AS sub
            WHERE sub.person_id = ${person_id}
              AND sub.status_monitoramento IN ('ALTA','SELF_DISCHARGED', 'DISCHARGED', 'ABANDONO_MONITORAMENTO', 'NON_ENGAGEMENT',
              'ABANDONO_CAPTACAO'--, 'REJEITADO', 'NOT_ELIGIBLE', 'RECUSA', 'DECLINED'
              )
        )
        THEN ${person_id}
      END ;;
  }

  # Pessoas que estavam ativas
  measure: distinct_being_monitored {
    label: "Beneficiários em Navegação (MoM)"
    type: count_distinct
    description: "Conta person_id cujo último status do mês é de monitoramento ativo."
    sql:
      CASE
        WHEN ${status_monitoramento} IN (
           'CAPTADO','ACQUISITION', 'MONITORADO','BEING_MONITORED', 'COORDENADO', 'COORDINATED',
                'DIFICULDADE_DE_MONITORAMENTO_1', 'DIFICULDADE_DE_MONITORAMENTO_2',
                'MONITORAMENTO_PENDENTE_RH'
        )
        THEN ${person_id}
      END ;;
  }

  # Pessoas com último status ativo de monitoramento
  measure: distinct_being_monitored_ultimo_status {
    label: "Beneficiários em Navegação (Global)"
    description: "Conta apenas pessoas cujo status mais recente (último registro em toda a base) está em um dos status de monitoramento ativo."
    type: count_distinct
    sql:
      CASE
        WHEN ${status_criado_raw} = (
          SELECT MAX(sub.status_criado)
          FROM `monitoramento.gerencial_monitoramento` AS sub
          WHERE sub.person_id = ${person_id}
        )
        AND ${status_monitoramento} IN (
          'CAPTADO','ACQUISITION',
          'MONITORADO','BEING_MONITORED',
          'COORDENADO', 'COORDINATED',
          'DIFICULDADE_DE_MONITORAMENTO_1', 'MONITORING_DIFFICULTY_1',
          'MONITORAMENTO_PENDENTE_RH', 'PENDING_MONITORING_HR',
          'DIFICULDADE_DE_MONITORAMENTO_2', 'MONITORING_DIFFICULTY_2'
        )
      THEN ${person_id}
      END ;;
  }

  # Pessoas com último status ativo de Elegibilidade (ELEGÍVEL E CAPTADO)
  measure: distinct_eligible_ultimo_status {
    label: "Pessoas Elegíveis (Global)"
    description: "Conta apenas pessoas cujo status mais recente (último registro do person_id em toda a base) está em um dos status de elegível (elegible || like acquisition)."
    type: count_distinct
    sql:
        CASE
          WHEN ${status_criado_raw} = (
            SELECT MAX(sub.status_criado)
            FROM `monitoramento.gerencial_monitoramento` AS sub
            WHERE sub.person_id = ${person_id}
          )
          AND ${status_monitoramento} IN (
            'CAPTADO','ACQUISITION',
            'ELIGIBLE', 'NOVO_PACIENTE',
            'CAPTACAO_EM_ANDAMENTO',
            'UNREACHABLE','ACQUISITION_DIFFICULTY_1', 'DIFICULDADE_DE_CAPTACAO_1',
            'ACQUISITION_DIFFICULTY_2','DIFICULDADE_DE_CAPTACAO_2',
            'PENDING_ACQUISITION_HR','CAPTACAO_PENDENTE_RH'
          )
      THEN ${person_id}
      END ;;
  }
  #
  measure: distinct_eligible_restritivo_ultimo_status {
    label: "Pessoas Elegíveis (Global) - ex não elegiveis"
    description: "Conta apenas pessoas cujo status mais recente não é não elegível."
    type: count_distinct
    sql:
        CASE
          WHEN ${status_criado_raw} = (
            SELECT MAX(sub.status_criado)
            FROM `monitoramento.gerencial_monitoramento` AS sub
            WHERE sub.person_id = ${person_id}
          )
          AND ${status_monitoramento} NOT IN (
            'REJEITADO','REJECTED',
            'NOT_ELIGIBLE',
            'INATIVO','INACTIVE',
            'ALTA','DISCHARGED', 'SELF_DISCHARGED',
            'RECUSA','DECLINED',
            'NON_ENGAGEMENT',
            'ACQUISITION_ABANDONED','ABANDONO_CAPTACAO',
            'MONITORING_ABANDONED','ABANDONO_MONITORAMENTO'
            )
      THEN ${person_id}
      END ;;
  }

  # % Total Participantes (Monitorados / Elegíveis)
  measure: monitored_among_eligible_rate {
    label: "% de Participantes Sendo Monitorados"
    type: number
    value_format_name: percent_2
    sql: ${distinct_being_monitored_ultimo_status} / NULLIF(${distinct_eligible_restritivo_ultimo_status}, 0) ;;
  }

  dimension: include_in_analise {
    label: "Incluir na Análise Temporal?"
    type: yesno
    sql: CASE
         WHEN ${origem} = 'historico' AND ${status_deletado_raw} IS NULL THEN FALSE
         ELSE TRUE
       END ;;
  }

################################################ OS FATORADOS
  dimension: status_contato_fatorado {
    type: string
    sql:
      CASE
        WHEN (UPPER(${canal_contato}) LIKE '%WHATS%'
          OR UPPER(${used_tool}) LIKE '%WHATS%')
          AND ${contact_attempt_status} = 'ANSWERED_CALL'
        THEN 'WHATSAPP_MESSAGE_ANSWERED'
        ELSE ${contact_attempt_status}
      END ;;
  }

  dimension: carteira_fatorado {
    type: string
    sql: CONCAT('Carteira da ', ${nome_carteira}) ;;
  }

  dimension: status_contato_pt_fatorado {
    label: "Status de Contato PT_fatorado"
    type: string
    sql:
    CASE
      WHEN ${status_contato_fatorado} = 'ANSWERED_CALL' THEN 'Chamada atendida'
      WHEN ${status_contato_fatorado} = 'MISSED_CALL' THEN 'Chamada perdida'
      WHEN ${status_contato_fatorado} = 'UNAVAILABLE_TO_TALK' THEN 'Indisponível para falar'
      WHEN ${status_contato_fatorado} = 'WHATSAPP_MESSAGE_ANSWERED' THEN 'WhatsApp respondido'
      WHEN ${status_contato_fatorado} = 'WHATSAPP_MESSAGE_UNANSWERED' THEN 'WhatsApp não respondido'
      WHEN ${status_contato_fatorado} = 'WHATSAPP_MESSAGE_SENT' THEN 'WhatsApp enviado'
      ELSE ${status_contato_fatorado}
    END ;;
  }

# --- Measure 1: Pessoas que atenderam (válidas no mês) ---
  measure: pessoas_que_atenderam_validas_fatorado {
    label: "Pessoas que Atenderam (Status válido no mês)_fatorado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [
      status_monitoramento_valido_no_mes: "yes",
      status_contato_fatorado: "ANSWERED_CALL"
    ]
  }

# --- Measure 2: Pessoas com ligação (válidas no mês) ---
  measure: pessoas_com_ligacao_validas_fatorado {
    label: "Pessoas com Ligação (Status válido no mês_fatorado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento_valido_no_mes: "yes"]
  }

# --- Measure 3: Taxa de Engajamento (válidas no mês) ---
  measure: taxa_engajamento_valida_fatorado {
    label: "Taxa de Engajamento (Status válido no mês)_fatorado"
    type: number
    value_format_name: percent_2
    sql: ${pessoas_que_atenderam_validas_fatorado} / NULLIF(${pessoas_com_ligacao_validas_fatorado}, 0) ;;
  }

######### Efetividade de Contato - Whats

# Numerador
  measure: whatsapp_answered_count_fatorado {
    label: "Respostas de WhatsApp (Fatorado)"
    type: sum
    sql: CASE
        WHEN ${status_contato_fatorado} = 'WHATSAPP_MESSAGE_ANSWERED' THEN 1
        ELSE 0
       END ;;
  }

# Denominador
  measure: whatsapp_message_total_fatorado {
    label: "Mensagens de WhatsApp (Base Fatorada)"
    type: sum
    sql: CASE
        WHEN ${status_contato_fatorado} IN (
          'WHATSAPP_MESSAGE_SENT',
          'WHATSAPP_MESSAGE_ANSWERED',
          'WHATSAPP_MESSAGE_UNANSWERED'
        ) THEN 1
        ELSE 0
       END ;;
  }

# Taxa
  measure: whatsapp_response_rate_fatorado {
    label: "Efetividade de Contato no WhatsApp (Fatorado)"
    type: number
    value_format_name: percent_2
    sql: ${whatsapp_answered_count_fatorado} / NULLIF(${whatsapp_message_total_fatorado}, 0) ;;
  }



################## Efetividade de Contato - Telefone
# Numerador
  measure: answered_calls_fatorado {
    label: "Ligações Atendidas (Fatorado)"
    type: sum
    sql: CASE
        WHEN ${status_contato_fatorado} = 'ANSWERED_CALL' THEN 1
        ELSE 0
       END ;;
  }

# Denominador
  measure: attempted_calls_base_fatorado {
    label: "Base de Ligações Tentadas (Fatorado)"
    type: sum
    sql: CASE
        WHEN ${status_contato_fatorado} IN (
          'UNAVAILABLE_TO_TALK',
          'ANSWERED_CALL',
          'MISSED_CALL'
        ) THEN 1
        ELSE 0
       END ;;
  }

# Taxa
  measure: call_answer_rate_fatorado {
    label: "Efetividade de Contato no Telefone (Fatorado)"
    type: number
    value_format_name: percent_2
    sql: ${answered_calls_fatorado} / NULLIF(${attempted_calls_base_fatorado}, 0) ;;
  }



################ Efetividade de Contato Unificado
# Numerador
  measure: total_multichannel_answers_fatorado {
    label: "Respostas (Ligação + WhatsApp) Fatorado"
    type: sum
    sql: CASE
        WHEN ${status_contato_fatorado} IN (
          'ANSWERED_CALL',
          'WHATSAPP_MESSAGE_ANSWERED'
        ) THEN 1
        ELSE 0
       END ;;
  }

# Denominador
  measure: total_multichannel_base_fatorado {
    label: "Base de Interações (Todas as Tentativas) Fatorado"
    type: sum
    sql: CASE
        WHEN ${status_contato_fatorado} IN (
          'UNAVAILABLE_TO_TALK',
          'ANSWERED_CALL',
          'MISSED_CALL',
          'WHATSAPP_MESSAGE_SENT',
          'WHATSAPP_MESSAGE_ANSWERED',
          'WHATSAPP_MESSAGE_UNANSWERED'
        ) THEN 1
        ELSE 0
       END ;;
  }

# Taxa
  measure: multichannel_response_rate_fatorado {
    label: "Efetividade de Contato Unificado (Fatorado)"
    type: number
    value_format_name: percent_2
    sql: ${total_multichannel_answers_fatorado} / NULLIF(${total_multichannel_base_fatorado}, 0) ;;
  }

  dimension: hora_do_dia {
    label: "Hora do Dia"
    type: string
    sql: LPAD(CAST(EXTRACT(HOUR FROM ${TABLE}.data_ligacao) AS STRING), 2, '0') || ':00' ;;
  }

  measure: contatos {
    label: "Total de Contatos"
    type: count
  }

  measure: dias_uteis_no_periodo {
    label: "Dias Úteis no Período"
    type: count_distinct
    sql:
    CASE
      WHEN EXTRACT(DAYOFWEEK FROM DATE(${TABLE}.data_ligacao)) BETWEEN 2 AND 6
        THEN DATE(${TABLE}.data_ligacao)
      ELSE NULL
    END ;;
  }

  measure: horas_uteis_no_periodo {
    label: "Horas Úteis no Período"
    type: number
    sql: ${dias_uteis_no_periodo} * 8 ;;
  }

  measure: media_contatos_por_hora_mes {
    label: "Média de Contatos por Hora (Mês)"
    type: number
    sql: ${contatos} / NULLIF(${horas_uteis_no_periodo}, 0) ;;
    value_format: "0.0"
  }

  dimension: dia_do_mes {
    label: "Dia do Mês"
    type: string
    sql: LPAD(CAST(EXTRACT(DAY FROM ${TABLE}.data_ligacao) AS STRING), 2, '0');;
  }

  parameter: agrupar_por {
    label: "Agrupar Média por"
    type: string
    allowed_value: { label: "Hora do Dia" value: "hora" }
    allowed_value: { label: "Dia do Mês" value: "dia" }
  }

  dimension: eixo_x_selecionado_sort {
    type: number
    sql:
      CASE
        WHEN {% parameter agrupar_por %} = 'hora' THEN EXTRACT(HOUR FROM ${TABLE}.data_ligacao)
        WHEN {% parameter agrupar_por %} = 'dia' THEN UNIX_DATE(DATE(${TABLE}.data_ligacao))
        ELSE NULL
      END
      ;;
  }

  dimension: eixo_x_selecionado {
    label: "Eixo de Agrupamento Selecionado"
    type: string
    sql:
    CASE
      WHEN {% parameter agrupar_por %} = 'hora' THEN ${hora_do_dia}
      WHEN {% parameter agrupar_por %} = 'dia' THEN FORMAT_DATE('%Y-%m-%d', ${data_ligacao_date})
      ELSE NULL
    END
  ;;
  }

  measure: media_ajustada_dinamica {
    label: "Média Dinâmica de Contatos/Hora/Dia"
    type: number
    sql:
    CASE
      WHEN {% parameter agrupar_por %} = 'hora'
        THEN ${contatos} / 22

      WHEN {% parameter agrupar_por %} = 'dia'
      THEN ${contatos} / 8

      ELSE NULL
      END
      ;;
    value_format: "0.0"
  }

  measure: em_contato_sob_total {
    type: number
    value_format_name: percent_2
    sql: ${qtd_em_contato} / NULLIF(${distinct_person_count}, 0) ;;
  }

  #############################
  #Informações sobre Waterfall

  #população total
  measure: populacao_total {
    label: "População Total"
    type: count_distinct
    sql: ${person_id} ;;
  }

  measure: nao_elegiveis {
    label: "Não Elegíveis"
    type: number
    sql: ${populacao_total} - ${waterfall_20_elegiveis_telefone.Elegiveis} ;;
    value_format_name: decimal_0
  }

#########

# Rejeitado pela enfermeira
  measure: rej_enfermeira {
    label: "Rejeitado pela enfermeira"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "REJEITADO, NOT_ELIGIBLE"]
  }

# Monitoramento recusado
  measure: monitoramento_recusado {
    label: "Monitoramento Recusado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "RECUSA, DECLINED"]
  }

# Dificuldade de contato Captação
  measure: dificuldade_captacao {
    label: "Dificuldade de contato Captação"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "DIFICULDADE_DE_CAPTACAO_1, UNREACHABLE ,DIFICULDADE_DE_CAPTACAO_2,CAPTACAO_PENDENTE_RH"]
  }

# Pacientes Captados
  measure: paciente_captados {
    label: "Pacientes Captados"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "ALTA,SELF_DISCHARGED, DISCHARGED,ABANDONO_MONITORAMENTO,CAPTADO, ACQUISITION,MONITORADO, BEING_MONITORED, COORDENADO,COORDINATED, DIFICULDADE_DE_MONITORAMENTO_1,MONITORAMENTO_PENDENTE_RH,DIFICULDADE_DE_MONITORAMENTO_2"]
  }

# A Captar
  measure: a_captar {
    label: "A Captar"
    type: number
    sql: ${waterfall_20_elegiveis_telefone.Elegiveis_Acionaveis} - ${rej_enfermeira} - ${monitoramento_recusado} - ${dificuldade_captacao} - ${paciente_captados} ;;
  }

# Alta
  measure: alta {
    label: "Alta"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "ALTA,SELF_DISCHARGED, DISCHARGED"]
  }

# Abandono Monitoramento
  measure: abandono_monitoramento {
    label: "Abandono Monitoramento"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "ABANDONO_MONITORAMENTO"]
  }

# Monitoramento Ativo
  measure: monitoramento_ativo {
    label: "Monitoramento Ativo"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "CAPTADO, ACQUISITION,MONITORADO, BEING_MONITORED,COORDENADO,COORDINATED, ,DIFICULDADE_DE_MONITORAMENTO_1,MONITORAMENTO_PENDENTE_RH,DIFICULDADE_DE_MONITORAMENTO_2"]
  }

# Captado
  measure: captado {
    label: "Captado"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "CAPTADO, ACQUISITION"]
  }

# Monitorados
  measure: monitoramentos {
    label: "Monitorados"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "MONITORADO, BEING_MONITORED"]
  }

# Coordenados
  measure: coordenados {
    label: "Coordenados"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "COORDENADO, COORDINATED"]
  }

# Dificuldade de Contato Monitoramento
  measure: dificuldade_de_contato_monitoramento {
    label: "Dificuldade de Contato Monitoramento"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [status_monitoramento: "DIFICULDADE_DE_MONITORAMENTO_1,MONITORAMENTO_PENDENTE_RH,DIFICULDADE_DE_MONITORAMENTO_2"]
  }

  measure: teste_modelo_cliente {
    label: "teste"
    sql: ${person_id} ;;
  }
}
