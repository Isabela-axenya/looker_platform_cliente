---
- dashboard: perfil_populacional
  title: Perfil Populacional
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  filters_location_top: false
  preferred_slug: 440lhP0DcETvQjkooflTJD
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="text-align:center;">
        <span style="font-size:33px; color:#3896b4; font-family:Roboto, sans-serif; font-weight:500;">
          Perfil Populacional
        </span>
      </div>
    row: 7
    col: 3
    width: 21
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="text-align:center;">
        <span style="font-size:33px; color:#3896b4; font-family:Roboto, sans-serif; font-weight:500;">
          Resumo
        </span>
      </div>
    row: 0
    col: 3
    width: 21
    height: 2
  - title: Beneficiários x Titularidade
    name: Beneficiários x Titularidade
    model: cliente
    explore: populacao_hub
    type: looker_grid
    fields: [populacao_hub.count_distinct_beneficiaries, average_of_beneficiary_age,
      populacao_hub.beneficiary_type]
    filters:
      populacao_hub.plan_type: "-NULL"
      populacao_hub.beneficiary_type: "-NULL"
    sorts: [populacao_hub.count_distinct_beneficiaries desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: populacao_hub.beneficiary_age
      expression: ''
      label: Average of Beneficiary Age
      measure: average_of_beneficiary_age
      type: average
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      populacao_hub.beneficiary_gender: Sexo
      populacao_hub.count_distinct_beneficiaries: Beneficiários
      average_of_beneficiary_age: Idade
      populacao_hub.beneficiary_type: Titularidade
    series_cell_visualizations:
      populacao_hub.count_distinct_beneficiaries:
        is_active: false
    series_text_format:
      populacao_hub.count_distinct_beneficiaries:
        align: center
      average_of_beneficiary_age:
        align: center
    series_value_format:
      average_of_beneficiary_age:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    defaults_version: 1
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 2
    col: 11
    width: 13
    height: 3
  - title: Beneficiários
    name: Beneficiários
    model: cliente
    explore: populacao_hub
    type: single_value
    fields: [populacao_hub.count_distinct_beneficiaries]
    filters:
      populacao_hub.plan_type: "-NULL"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: |-
      <div style="
        color: #3896b4;
        font-size: 16px;
        font-weight: 600;
        text-align: center;
        display: block;
        word-wrap: break-word;
        white-space: normal;
        line-height: 1.3;
        max-width: 100%;
      ">
        Beneficiários
      </div>
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 2
    col: 3
    width: 4
    height: 5
  - title: Beneficiários x Gênero
    name: Beneficiários x Gênero
    model: cliente
    explore: populacao_hub
    type: looker_grid
    fields: [populacao_hub.beneficiary_gender, populacao_hub.count_distinct_beneficiaries,
      average_of_beneficiary_age]
    filters:
      populacao_hub.plan_type: "-NULL"
      populacao_hub.beneficiary_gender: "-NULL"
    sorts: [populacao_hub.count_distinct_beneficiaries desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: populacao_hub.beneficiary_age
      expression: ''
      label: Average of Beneficiary Age
      measure: average_of_beneficiary_age
      type: average
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      populacao_hub.beneficiary_gender: Sexo
      populacao_hub.count_distinct_beneficiaries: Beneficiários
      average_of_beneficiary_age: Idade
    series_cell_visualizations:
      populacao_hub.count_distinct_beneficiaries:
        is_active: false
    series_text_format:
      populacao_hub.beneficiary_gender:
        align: center
      populacao_hub.count_distinct_beneficiaries:
        align: center
      average_of_beneficiary_age:
        align: center
    series_value_format:
      average_of_beneficiary_age:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    defaults_version: 1
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 5
    col: 13
    width: 9
    height: 2
  - name: Navegação
    type: text
    title_text: Navegação
    subtitle_text: ''
    body_text: |2-
        <div style="margin-top:8px;">
          <a href="https://axenya.cloud.looker.com/dashboards/103" style="background-color:#d1d0ce; color:#000; font-size:13px; font-weight:400;
             font-family:'Roboto Condensed', Arial, sans-serif; text-decoration:none;
             padding:10px 16px; border-radius:8px; text-align:center; display:block;
             margin-bottom:8px; box-shadow:0 2px 4px rgba(0,0,0,0.1);">Perfil Populacional</a>

          <a href="https://axenya.cloud.looker.com/dashboards/104" style="background-color:#d1d0ce; color:#000; font-size:13px; font-weight:400;
             font-family:'Roboto Condensed', Arial, sans-serif; text-decoration:none;
             padding:10px 16px; border-radius:8px; text-align:center; display:block;
             margin-bottom:8px; box-shadow:0 2px 4px rgba(0,0,0,0.1);">Resumo do Sinistro</a>

          <a href="https://axenya.cloud.looker.com/dashboards/105" style="background-color:#d1d0ce; color:#000; font-size:13px; font-weight:400;
             font-family:'Roboto Condensed', Arial, sans-serif; text-decoration:none;
             padding:10px 16px; border-radius:8px; text-align:center; display:block;
             margin-bottom:8px; box-shadow:0 2px 4px rgba(0,0,0,0.1);">Participação em Programas</a>

          <a href="https://axenya.cloud.looker.com/dashboards/106" style="background-color:#d1d0ce; color:#000; font-size:13px; font-weight:400;
             font-family:'Roboto Condensed', Arial, sans-serif; text-decoration:none;
             padding:10px 16px; border-radius:8px; text-align:center; display:block;
             box-shadow:0 2px 4px rgba(0,0,0,0.1);">Afastados e Saúde Ocupacional</a>
        </div>
    row: 0
    col: 0
    width: 3
    height: 7
  - title: Titulares por Data de Admissão
    name: Titulares por Data de Admissão
    model: cliente
    explore: populacao_hub
    type: looker_line
    fields: [populacao_hub.beneficiary_admission_month, populacao_hub.count_distinct_beneficiaries]
    fill_fields: [populacao_hub.beneficiary_admission_month]
    filters:
      populacao_hub.plan_type: "-NULL"
      populacao_hub.beneficiary_type: Titular
    sorts: [populacao_hub.beneficiary_admission_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: populacao_hub.count_distinct_beneficiaries,
            id: populacao_hub.count_distinct_beneficiaries, name: Titulares}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '24'
    label_value_format: ''
    series_labels:
      populacao_hub.count_distinct_beneficiaries: Titulares
    x_axis_datetime_label: "%m-%Y"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: |-
      <div style="
        color: #3896b4;
        font-size: 16px;
        font-weight: 600;
        text-align: left;
        display: block;
        word-wrap: break-word;
        white-space: normal;
        line-height: 1.3;
        max-width: 100%;
      ">
        Titulares por Data de Admissão
      </div>
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 9
    col: 3
    width: 21
    height: 6
  - title: Sexo x Faixa Etária
    name: Sexo x Faixa Etária
    model: cliente
    explore: populacao_hub
    type: looker_bar
    fields: [populacao_hub.beneficiary_age_range, populacao_hub.male_count_negative,
      populacao_hub.female_count, populacao_hub.age_range_order]
    filters:
      populacao_hub.beneficiary_age_range: "-NULL"
      populacao_hub.plan_type: "-NULL"
      populacao_hub.beneficiary_gender: "-NULL"
    sorts: [populacao_hub.age_range_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: populacao_hub.beneficiary_id
      expression: ''
      label: Count of Beneficiary ID
      measure: count_of_beneficiary_id
      type: count_distinct
    - category: table_calculation
      expression: abs(${populacao_hub.male_count_negative})
      label: male positive
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: male_positive
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: populacao_hub.male_count_negative,
            id: populacao_hub.male_count_negative, name: Masculino}, {axisId: populacao_hub.female_count,
            id: populacao_hub.female_count, name: Feminino}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    label_value_format: ''
    series_colors:
      populacao_hub.female_count: "#b8dae5"
    series_labels:
      populacao_hub.male_count_negative: Masculino
      populacao_hub.female_count: Feminino
    leftAxisLabelVisible: true
    leftAxisLabel: ''
    rightAxisLabelVisible: true
    rightAxisLabel: ''
    smoothedBars: true
    isStepped: false
    orientation: automatic
    labelPosition: left
    labelOverlap: false
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [populacao_hub.age_range_order]
    note_state: collapsed
    note_display: above
    note_text: |
      <font style="color:#3896b4; font-size:18px; font-weight:600; text-align:left; display:block;">
        Sexo por Faixa Etária
      </font>
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 15
    col: 3
    width: 10
    height: 12
  - title: Beneficiários Aposentados
    name: Beneficiários Aposentados
    model: cliente
    explore: populacao_hub
    type: single_value
    fields: [populacao_hub.count_distinct_beneficiaries]
    filters:
      populacao_hub.plan_type: "-NULL"
      populacao_hub.beneficiary_retiree: Sim
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: |-
      <div style="
        color: #3896b4;
        font-size: 16px;
        font-weight: 600;
        text-align: center;
        display: block;
        word-wrap: break-word;
        white-space: normal;
        line-height: 1.3;
        max-width: 100%;
      ">
        Aposentados
      </div>
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 2
    col: 7
    width: 4
    height: 5
  - title: Titularidade x Faixa Etária
    name: Titularidade x Faixa Etária
    model: cliente
    explore: populacao_hub
    type: looker_bar
    fields: [populacao_hub.beneficiary_age_range, populacao_hub.age_range_order, populacao_hub.titularidade_negativa,
      populacao_hub.dependencia_positiva]
    filters:
      populacao_hub.beneficiary_age_range: "-NULL"
      populacao_hub.plan_type: "-NULL"
      populacao_hub.beneficiary_type: "-NULL"
    sorts: [populacao_hub.age_range_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: populacao_hub.beneficiary_id
      expression: ''
      label: Count of Beneficiary ID
      measure: count_of_beneficiary_id
      type: count_distinct
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: count_of_beneficiary_id,
            id: count_of_beneficiary_id, name: Count of Beneficiary ID}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_colors:
      populacao_hub.titularidade_negativa: "#3896b4"
      populacao_hub.dependencia_positiva: "#b8dae5"
    series_labels:
      populacao_hub.dependencia_positiva: Dependentes
      populacao_hub.titularidade_negativa: Titulares
    leftAxisLabelVisible: true
    leftAxisLabel: ''
    rightAxisLabelVisible: true
    rightAxisLabel: ''
    smoothedBars: true
    isStepped: false
    orientation: automatic
    labelPosition: left
    labelOverlap: false
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [populacao_hub.age_range_order]
    note_state: collapsed
    note_display: above
    note_text: |
      <font style="color:#3896b4; font-size:18px; font-weight:600; text-align:left; display:block;">
        Titularidade por Faixa Etária
      </font>
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 15
    col: 14
    width: 10
    height: 12
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="text-align:center;">
        <span style="font-size:33px; color:#3896b4; font-family:Roboto, sans-serif; font-weight:500;">
          Beneficiários por Plano
        </span>
      </div>
    row: 27
    col: 3
    width: 21
    height: 2
  - title: Beneficiários por Tipo de Plano
    name: Beneficiários por Tipo de Plano
    model: cliente
    explore: populacao_hub
    type: looker_bar
    fields: [populacao_hub.count_distinct_beneficiaries, populacao_hub.plan_type_ajustado]
    filters:
      populacao_hub.plan_type: "-NULL"
    sorts: [populacao_hub.count_distinct_beneficiaries desc 0]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: populacao_hub.count_distinct_beneficiaries,
            id: populacao_hub.count_distinct_beneficiaries, name: Count Distinct Beneficiaries}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: |
      <font style="color:#3896b4; font-size:18px; font-weight:600; text-align:left; display:block;">
        Distribuição por Tipo de Plano
      </font>
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 38
    col: 3
    width: 21
    height: 5
  - title: Beneficiários por Plano
    name: Beneficiários por Plano
    model: cliente
    explore: populacao_hub
    type: looker_bar
    fields: [populacao_hub.plan_name, populacao_hub.count_distinct_beneficiaries]
    filters:
      populacao_hub.plan_type: "-NULL"
    sorts: [populacao_hub.count_distinct_beneficiaries desc 0]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: populacao_hub.count_distinct_beneficiaries,
            id: populacao_hub.count_distinct_beneficiaries, name: Count Distinct Beneficiaries}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: |
      <font style="color:#3896b4; font-size:18px; font-weight:600; text-align:left; display:block;">
        Distribuição por Plano
      </font>
    title_hidden: true
    listen:
      Faixa Etária: populacao_hub.beneficiary_age_range
      Status do Beneficiário: populacao_hub.beneficiary_status
      Sub-Estipulante: populacao_hub.subclient_name
      Sexo: populacao_hub.beneficiary_gender
      Titularidade: populacao_hub.beneficiary_type
      Empresa: populacao_hub.empresa
      Operadora: populacao_hub.operator_name
      Plano: populacao_hub.plan_name
      Cargo: populacao_hub.beneficiary_client_role
    row: 29
    col: 3
    width: 21
    height: 9
  filters:
  - name: Empresa
    title: Empresa
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Status do Beneficiário, Titularidade, Sexo, Faixa Etária,
      Cargo, Plano, Operadora, Sub-Estipulante]
    field: populacao_hub.empresa
  - name: Sub-Estipulante
    title: Sub-Estipulante
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Titularidade, Sexo, Faixa
        Etária, Cargo, Plano, Operadora]
    field: populacao_hub.subclient_name
  - name: Operadora
    title: Operadora
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Titularidade, Sexo, Faixa
        Etária, Cargo, Plano, Sub-Estipulante]
    field: populacao_hub.operator_name
  - name: Plano
    title: Plano
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Titularidade, Sexo, Faixa
        Etária, Cargo, Operadora, Sub-Estipulante]
    field: populacao_hub.plan_name
  - name: Cargo
    title: Cargo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Titularidade, Sexo, Faixa
        Etária, Plano, Operadora, Sub-Estipulante]
    field: populacao_hub.beneficiary_client_role
  - name: Faixa Etária
    title: Faixa Etária
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Titularidade, Sexo, Cargo,
      Plano, Operadora, Sub-Estipulante]
    field: populacao_hub.beneficiary_age_range
  - name: Sexo
    title: Sexo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Titularidade, Faixa Etária,
      Cargo, Plano, Operadora, Sub-Estipulante]
    field: populacao_hub.beneficiary_gender
  - name: Titularidade
    title: Titularidade
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Status do Beneficiário, Sexo, Faixa Etária, Cargo,
      Plano, Operadora, Sub-Estipulante]
    field: populacao_hub.beneficiary_type
  - name: Status do Beneficiário
    title: Status do Beneficiário
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cliente
    explore: populacao_hub
    listens_to_filters: [Empresa, Titularidade, Sexo, Faixa Etária, Cargo, Plano,
      Operadora, Sub-Estipulante]
    field: populacao_hub.beneficiary_status
