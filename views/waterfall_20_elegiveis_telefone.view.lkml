view: waterfall_20_elegiveis_telefone {
  derived_table: {
    sql:
      WITH ranked AS (
        SELECT
          p.company_id,
          p.name,
          ms.person_id,
          m.priority,
          NTILE(5) OVER (
              PARTITION BY p.company_id
              ORDER BY m.priority DESC
          ) AS priority_group
        FROM `sinistralidade.mission_control_tables.monitoring_status` ms
        LEFT JOIN `sinistralidade.mission_control_tables.person` p
          ON p.id = ms.person_id
        LEFT JOIN `sinistralidade.mission_control_tables.monitoring` m
          ON m.beneficiary_id = p.beneficiary_id
        WHERE ms.deleted_at IS NULL
          AND p.deleted_at IS NULL
          AND p.name <> "ARIELEN SILVA MUNGO DINIZ"
      )

      SELECT
      person_id,
      company_id,
      name,

      -- elegível = está no top 20%
      CASE WHEN priority_group = 1 THEN TRUE ELSE FALSE END AS is_elegivel_20,

      -- telefone válido (DDD + número, com 8 dígitos ou mais)
      CASE WHEN EXISTS (
      SELECT 1
      FROM `sinistralidade.mission_control_tables.phone` tl
      WHERE tl.person_id = ranked.person_id
      AND REGEXP_CONTAINS(
      CONCAT(
      COALESCE(CAST(tl.area_code AS STRING), ''),
      COALESCE(CAST(tl.number    AS STRING), '')
      ),
      r'^\d{8,}$'
      )
      AND NOT REGEXP_CONTAINS(tl.number, r'^(0+|9+)$')
      ) THEN TRUE ELSE FALSE END AS has_valid_phone

      FROM ranked
      ;;
  }

  dimension: person_id {
    primary_key: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: beneficiary_name {
    hidden: yes
    sql: ${TABLE}.name ;;
  }

  dimension: company_id {
    sql: ${TABLE}.company_id ;;
  }

  dimension: is_elegivel_20 {
    type: yesno
    sql: ${TABLE}.is_elegivel_20 ;;
  }

  dimension: has_valid_phone {
    type: yesno
    sql: ${TABLE}.has_valid_phone ;;
  }

  measure: Elegiveis {
    label: "Elegíveis"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [ is_elegivel_20: "yes" ]
  }

  measure: Elegiveis_Acionaveis {
    label: "Elegíveis Acionáveis"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [ is_elegivel_20: "yes", has_valid_phone: "yes" ]
  }

  measure: sem_telefone {
    label: "Não possui Telefone"
    type: count_distinct
    sql: ${person_id} ;;
    filters: [ is_elegivel_20: "yes", has_valid_phone: "no" ]
  }

}
