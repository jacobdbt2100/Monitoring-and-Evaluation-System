# Monitoring and Evaluation System for a Smallholder Farm Productivity Programme

Monitoring & Evaluation | CommCare | Python | PostgreSQL | SQL | Excel | Power BI
___

## 1.0. Problem Statement

The **Smallholder Farm Productivity Programme (SFPP)** supports farmers through registration, agricultural training, input distribution, and extension services.

This project develops an end-to-end **Monitoring & Evaluation system** to help programme teams:

* Track programme implementation and beneficiary reach
* Monitor performance against targets
* Measure programme outputs and outcomes
* Assess beneficiary satisfaction and community needs
* Identify implementation and data-quality issues
* Support evidence-based programme decisions and reporting

The solution uses **CommCare** for data collection, **Python** for data processing, **PostgreSQL/SQL** for analysis, and **Power BI** for reporting.

## 2.0. Programme Background

The **SFPP** is a fictional agricultural development programme designed for this project.

## 3.0. Monitoring & Evaluation System Scope

- Data Collection
- Data Processing
- Data Analysis
- Reporting

## 4.0. Data Collection Approach

The programme will use **CommCare** as the primary data collection platform. Data will be collected through a combination of case management forms and standalone survey forms to support routine monitoring and programme evaluation.

### 4.1. Farmer Records (Case Management)

Each registered farmer has a unique case record that is created once and updated throughout the programme.

**1. Farmer Register (Case Creation) Form** ([farmer register.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/farmer%20records/farmer%20register.txt))

- Registers eligible farmers into the programme.
- Creates the Farmer case.

**2. Farmer Records (Case Follow-up) Forms**

- **Training Attendance** ([training attendance.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/farmer%20records/training%20attendance.txt))
    - Records participation in training sessions.
    - Updates the Farmer case.

- **Input Distribution** ([input distribution.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/farmer%20records/input%20distribution.txt))
    - Records agricultural inputs distributed to farmers.
    - Updates the Farmer case.

- **Farm Monitoring Visit** ([farm monitoring visit.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/farmer%20records/farm%20monitoring%20visit.txt))
    - Records observations made during routine farm visits.
    - Tracks adoption of recommended practices, crop and livestock performance, and field challenges.
    - Updates the Farmer case.

### 4.2. Programme Surveys (Standalone Survey Forms)

- **Community Needs Assessment** ([community needs assessment.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/programme%20surveys/community%20needs%20assessment.txt))
    - Collects baseline information on agricultural challenges and community priorities.

- **Farmer Satisfaction Survey** ([farmer satisfaction survey.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/programme%20surveys/farmer%20satisfaction%20survey.txt))
    - Measures farmers' satisfaction with programme services and support.

- **End-of-Season Programme Evaluation** ([end-of-season programme evaluation.txt](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/data%20collection%20forms/programme%20surveys/end-of-season%20programme%20evaluation.txt))
    - Assesses programme performance, outcomes, and lessons learned at the end of each farming season.

### 4.3. App Navigation

```text
Smallholder Farmer Productivity Improvement Programme (SFPIP)

Farmer Records
├── Farmer Register
├── Training Attendance
├── Input Distribution
└── Farm Monitoring Visit

Programme Surveys
├── Community Needs Assessment
├── Farmer Satisfaction Survey
└── End-of-Season Programme Evaluation
```

## 5.0. Synthetic Data Generation

Since this project uses a fictional agricultural programme, realistic synthetic data ([01_raw](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/tree/main/dataset/01_raw)) was generated using Python ([notebooks](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/tree/main/notebooks)) to simulate field data collected through digital data collection forms.

The synthetic data was designed to reflect common patterns observed in agricultural monitoring and evaluation programmes while remaining entirely fictional.

The data generation process included:
- Generating Farmer Registration, Farm Monitoring Visit, Training Attendance, and Input Distribution datasets;
- Producing realistic demographic, agricultural, and programme participation data;
- Creating unique CommCare-style identifiers and submission metadata;
- Preserving relationships between datasets using farmer case IDs;
- Generating realistic GPS coordinates for farms and monitoring visits; and
- Introducing controlled data quality issues in the Farmer Registration dataset to support subsequent data cleaning and validation exercises.

## 6.0. Data Cleaning & Validation

Python was used to clean, validate, and standardize the synthetic datasets ([notebooks](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/tree/main/notebooks)) before data transformation and modelling.

The cleaning and validation process includes:
- Basic data profiling;
- Removing duplicate records;
- Standardising phone number formats;
- Standardising text capitalization;
- Validating GPS coordinates against the expected project area; and
- Validating the remaining datasets before loading them into the cleaned data layer.

## 7.0. Data Transformation & Loading

Python was used to create analysis-ready datasets ([09_data_transformation_&_loading.ipynb](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/notebooks/09_data_transformation_%26_loading.ipynb)) by deriving reusable fields before SQL modelling and reporting. This preserves lineage and makes debugging easier.

The transformation process includes:
- Loading the cleaned datasets;
- Calculating farmer age and form completion durations;
- Extracting latitude and longitude from GPS coordinates;
- Joining Farmer Registration and Farm Monitoring Visit data using `form.case.@case_id`;
- Calculating the distance between registration and monitoring visit GPS coordinates;
- Creating a GPS validation flag based on the calculated distance; and
- Exporting the transformed datasets to the 03_transformed layer for SQL modelling and reporting.

## 8.0. Data Modelling

The data model follows a layered approach:

- **Staging ([01_staging](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/tree/main/sql%20models/01_staging))**: cleaned and standardized datasets exposed primarily as **views**, preserving the transformed data structure while providing a consistent interface for downstream models.
- **Marts ([02_marts](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/tree/main/sql%20models/02_marts))**: reporting-focused **tables** designed around the grain and metrics required by specific analytical outputs.
- **Lineage**: staging models retain the underlying dataset structure where practical, with derived fields added only where required. This preserves lineage and makes debugging easier.
- **Materialization**: views are used where lightweight, continuously reflected transformations are sufficient; tables are used for marts where stable, reusable datasets improve reporting performance and downstream access.
- **Reporting**: marts provide the datasets used by Power BI and Excel, with each mart clearly aligned to its intended reporting purpose.

## 9.0. Data Quality Assessment

Data quality was assessed using field-agent-level monitoring measures from the `mart_field_agent_kpi_and_data_quality` model.

The assessment ([data_quality_assessment.csv](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/excel%20reports/data_quality_assessment.csv)) focused on:

* Average GPS distance from registration location (m).
* GPS records outside the expected range.
* Average monitoring form completion time (minutes).

**Other Quality Checks**

Periodic **sample-based checks** of monitoring photographs against the recorded crop or livestock condition can help verify that field agents correctly classify observations.

The results were exported to a separate **data_quality_assessment** CSV for field-agent-level review. The assessment covers the seven field agents represented in the synthetic dataset.

## 10.0. Programme Overview & Performance Analysis

The programme overview ([01_programme overview.jpg](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/power%20bi%20report/01_programme%20overview.jpg)) and performance ([02_programme performance.jpg](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/power%20bi%20report/02_programme%20performance.jpg)) reports provide a summary of programme results and performance.

### 10.1. Programme Overview

**Farmer profile and participation**

The overview ([01_programme overview.jpg](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/power%20bi%20report/01_programme%20overview.jpg)) uses the farmer-level `mart_programme_overview` model to summarise:

* Registered farmers
* Farmers trained
* Farmers receiving inputs
* Farmers monitored
* Farmers with recorded adoption
* Farmers by community
* Gender distribution
* Age distribution

**Crop analysis**

The `crops_cultivated` field contains multiple crop selections in a single cell, making it unsuitable for direct categorical counting. However, the separate crop-area columns provide structured fields for both farmer participation and cultivated-area analysis.

Disconnected `Crop` and `Livestock` tables were therefore created in Power BI to provide clean categorical axes. Measures use the corresponding structured columns rather than counting the multi-select text fields.

For crops, **total cultivated area** is the primary measure because it provides a more useful basis for programme planning, including estimation of seed and fertilizer requirements using recommended quantities per hectare. **Farmers by crop** is retained for secondary analysis or tooltips.

**Livestock analysis**

The same approach is applied to livestock using the structured `number_of_goats` and `number_of_rabbits` fields. **Total livestock count** is the primary measure, while **farmers by livestock** is retained for secondary analysis or tooltips.

### 10.2. Programme Performance

The `mart_programme_performance` model provides activity-level data for analysing programme implementation ([02_programme performance.jpg](https://github.com/jacobdbt2100/Monitoring-and-Evaluation-System/blob/main/power%20bi%20report/02_programme%20performance.jpg)), including:

* Training sessions conducted
* Training attendance
* Farmers trained
* Input quantities distributed
* Farm monitoring visits
* Adoption of recommended practices
* Crop condition
* Livestock condition

Training sessions are identified using the combination of **training date, training topic, and training venue** because the source data does not contain a dedicated session identifier. A derived training-session key allows each session to be counted once regardless of the number of farmer-level records associated with it.

Input analysis uses the structured quantity fields rather than the multi-select `input_type` field. Seed and fertilizer quantities are analysed in kilograms, while livestock distributions are analysed as animal counts.

**Crop & Livestock Condition Reporting**

Crop and livestock condition fields were handled separately from the main mart for reporting purposes. A Power Query **reference** of `mart_programme_performance` was created so the original mart and its existing analysis remained unchanged. The crop-condition fields (`crop_condition_maize`, `crop_condition_rice`, and `crop_condition_groundnuts`) and livestock-condition fields (`goat_condition` and `rabbit_condition`) were then unpivoted into common **Crop–Condition** and **Livestock–Condition** structures respectively. This provides cleaner categorical axes for slicers and condition visuals without introducing increasingly complex DAX measures.

### 10.3. Data Limitations

The synthetic dataset contains known limitations documented in the project notes, particularly around training-session participation. These are retained rather than hidden so that future revisions can improve the data-generation logic without altering the analytical definitions established in the current project.

## 11.0. Insights & Recommendations

**Key Findings Visualised:**

<img src="https://raw.githubusercontent.com/jacobdbt2100/Monitoring-and-Evaluation-System/main/power%20bi%20report/01_programme%20overview.jpg" width="1200">

<img src="https://raw.githubusercontent.com/jacobdbt2100/Monitoring-and-Evaluation-System/main/power%20bi%20report/02_programme%20performance.jpg" width="1200">

**Key Insights**

- **Programme reach:** 1,000 farmers registered; 779 trained and 834 received inputs.
- **Adoption:** 823 farmers have recorded adoption, giving an **82% adoption rate**.
- **Crop focus:** Maize accounts for the largest cultivated area (**2,365 ha of 5,016 ha**).
- **Livestock Owned by Farmers:** Goats represent the larger share of recorded livestock (**6,168 of 10,766**).
- **Training:** 845 sessions were recorded, but **99 had no recorded attendees**, highlighting an attendance/data-quality issue.
- **Field monitoring:** 2,012 monitoring visits provide substantial coverage for assessing adoption and crop/livestock condition.

**Recommendations**

- Follow up on **farmers not yet trained** and investigate sessions with zero recorded attendance.
- Use **cultivated area and livestock counts** to strengthen input and resource planning.
- Prioritise technical follow-up where **poor crop/livestock conditions** are recorded.
- Continue periodic **data-quality checks** and strengthen the synthetic-data generation logic in future revisions.

## 12.0. Repository Structure

```text
Monitoring-and-Evaluation-System/
│
├── analyses/
│   ├── validate_training_session_grain.sql
│   └── validate_training_sessions_without_attendance.sql
│ 
├── data collection forms/
│   ├── farmer records/
│   │   ├── farm monitoring visit.txt
│   │   ├── farmer register.txt
│   │   ├── input distribution.txt
│   │   └── training attendance.txt
│   │
│   └── programme surveys/
│       ├── community needs assessment.txt
│       ├── end-of-season programme evaluation.txt
│       └── farmer satisfaction survey.txt
│
├── dataset/
│   ├── 01_raw/
│   │   ├── farm_monitoring_visit_raw.csv
│   │   ├── farmer_registration_raw.csv
│   │   ├── input_distribution_raw.csv
│   │   └── training_attendance_raw.csv
│   │
│   ├── 02_cleaned/
│   │   ├── farm_monitoring_visit_clean.csv
│   │   ├── farmer_registration_clean.csv
│   │   ├── input_distribution_clean.csv
│   │   └── training_attendance_clean.csv
│   │
│   └── 03_transformed/
│       ├── farm_monitoring_visit_transformed.csv
│       ├── farmer_registration_transformed.csv
│       ├── input_distribution_transformed.csv
│       └── training_attendance_transformed.csv
│
├── excel reports/
│   ├── data_quality_assessment.csv
│   └── field_agent_performance.csv
│
├── notebooks/
│   ├── 01_farmer_registration_data_generation.ipynb
│   ├── 02_farmer_registration_cleaning.ipynb
│   ├── 03_farm_monitoring_visit_data_generation.ipynb
│   ├── 04_farm_monitoring_visit_cleaning.ipynb
│   ├── 05_training_attendance_data_generation.ipynb
│   ├── 06_training_attendance_cleaning.ipynb
│   ├── 07_input_distribution_data_generation.ipynb
│   ├── 08_input_distribution_cleaning.ipynb
│   └── 09_data_transformation_&_loading.ipynb
│
├── power bi report/
│   ├── 01_programme overview.jpg
│   ├── 02_programme performance.jpg
│   └── smallholder_farm_productivity_programme_report.pbix
│
├── sql models/
│   ├── 01_staging/
│   │   ├── stg_farm_monitoring_visit.sql
│   │   ├── stg_farmer_registration.sql
│   │   ├── stg_input_distribution.sql
│   │   └── stg_training_attendance.sql
│   │
│   ├── 02_marts/     
│   │   ├── mart_field_agent_kpi_and_data_quality.sql
│   │   ├── mart_programme_overview.sql
│   │   └── mart_programme_performance.sql
│   │        
│   └── database_objects_creation_scripts/
│       ├── database_schema.sql
│       ├── farm_monitoring_visit_transformed table.sql
│       ├── farmer_registration_transformed table.sql
│       ├── input_distribution_transformed table.sql
│       └── training_attendance_transformed table.sql
│
├── agriculture.jpeg
├── PROJECT FILES NAVIGATION GUIDE.md
└── README.md
```

## 13.0. Project Updates

This section documents **issues, observations, and design improvements** identified during or after project implementation. Updates will be made periodically rather than for every individual observation, particularly where changes would require extensive revisions to completed components.

The purpose is to preserve lessons from the current project for future implementations and avoid repeating identified issues when developing similar systems for actual programmes.

### 13.1. Data Collection Forms

**Training Attendance**

Question 5, **“Did the farmer attend the training?”**, can be omitted from the Training Attendance form. Where the form is completed only for farmers who attended, the question is redundant because attendance is already established by the submission. **Attendance Status** (Full Attendance or Partial Attendance) is sufficient for recording the level of attendance.

### 13.2. Synthetic Data Generation

**Training Attendance**

The current synthetic data generation logic should be refined to better reflect realistic training-session participation. The generated data contains **845 training sessions but only 779 training attendance records**, with **99 sessions having no recorded attendees** and some other sessions having only a very small number of farmer records.

Future revisions should generate multiple farmer-level attendance records per training session, with realistic session sizes and attendance outcomes. This will produce a more credible relationship between **Training Sessions Conducted**, **Training Attendance Records**, and **Farmers Trained**.

### 13.3. Date Slicer

Enable Filtering by Follow-Up Date