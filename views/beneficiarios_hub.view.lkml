view: beneficiarios_hub {
  derived_table: {
    sql:
      SELECT
        beneficiary_id,
        client_id,
        client_name,
        beneficiary_type,
        beneficiary_gender,
        beneficiary_age_range,
        beneficiary_status
      FROM `hub-crm-integration.hubspot.view_hs_full_card_beneficiary`
      GROUP BY 1, 2, 3, 4, 5, 6, 7 ;;
  }

  dimension: age_range_order {
    type: number
    sql:
    CASE
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "59") THEN 0
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "54") THEN 1
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "49") THEN 2
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "44") THEN 3
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "39") THEN 4
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "34") THEN 5
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "29") THEN 6
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "24") THEN 7
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "19") THEN 8
      WHEN CONTAINS_SUBSTR(${beneficiary_age_range}, "18") THEN 9
      WHEN ${beneficiary_age_range} IS NULL THEN 10
    END ;;
  }

  dimension: beneficiary_age_range {
    type: string
    sql: ${TABLE}.beneficiary_age_range ;;
  }

  dimension: beneficiary_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.beneficiary_id ;;
  }

  dimension: beneficiary_type {
    type: string
    sql: ${TABLE}.beneficiary_type ;;
  }

  dimension: beneficiary_gender {
    type: string
    sql: ${TABLE}.beneficiary_gender ;;
  }

  dimension: beneficiary_status {
    type: string
    sql: ${TABLE}.beneficiary_status ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }
}
