# Monitoring and Evaluation System for a Smallholder Farm Productivity Programme

## 1.0. Problem Statement

Smallholder farmers play a significant role in agricultural production, yet many face challenges that limit productivity and household income. These challenges include limited access to quality farm inputs, inadequate technical knowledge, poor adoption of improved farming practices, pests and diseases, and inconsistent extension support.

To address these challenges, an agricultural development programme is implemented to register farmers, provide agricultural training, distribute farm inputs, and conduct regular farm monitoring visits. While these activities are expected to improve farming practices and productivity, programme managers often struggle to determine whether resources are reaching the intended beneficiaries, activities are implemented as planned, and the programme is achieving its intended outcomes.

Without a structured monitoring and evaluation system, it becomes difficult to:

- Track programme implementation across communities.
- Monitor individual farmers throughout the programme.
- Measure key performance indicators consistently.
- Assess farmer satisfaction with programme services.
- Understand community agricultural needs.
- Evaluate whether programme objectives are being achieved.
- Produce timely reports for management and donors to support evidence-based decision-making.

This project develops an end-to-end monitoring and evaluation system that uses CommCare for digital data collection and case management, Python for data cleaning and transformation, PostgreSQL for data storage, Excel for operational analysis, and Power BI for executive reporting. The system enables programme managers to monitor activities, measure outcomes, evaluate programme performance, and make data-driven decisions to improve future interventions.

## 2.0. Programme Background

The **Smallholder Farm Productivity Programme (SFPP)** is a fictional agricultural development programme designed for this portfolio project. It aims to improve the productivity and livelihoods of smallholder farming households by increasing access to agricultural knowledge, quality farm inputs, and extension support.

The programme operates across selected rural communities and targets farmers who cultivate crops and/or rear livestock as their primary source of livelihood. It adopts a holistic approach by combining farmer registration, capacity building, farm input support, and continuous field monitoring throughout each farming season.

To ensure effective implementation, programme staff regularly collect data on beneficiary registration, training participation, input distribution, farm visits, and programme outcomes using digital data collection tools. Additional surveys are conducted to understand community needs, assess farmer satisfaction, and evaluate programme performance at the end of each farming season.

The programme recognises that successful implementation depends not only on delivering activities but also on measuring whether those activities lead to meaningful improvements in farming practices, agricultural productivity, household income, and food security. An integrated monitoring and evaluation system is therefore required to support routine monitoring, performance reporting, and evidence-based decision-making.

## 3.0. Programme Summary

| Item                     | Description                                            |
| ------------------------ | ------------------------------------------------------ |
| Programme Name           | Smallholder Farm Productivity Programme (SFPP)         |
| Sector                   | Agriculture                                            |
| Programme Type           | Agricultural Development Programme                     |
| Target Beneficiaries     | Smallholder farmers (crop and livestock)               |
| Geographic Coverage      | 7 Communities *(fictional)*                            |
| Programme Duration       | 3 years                                                |
| Monitoring Frequency     | Continuous throughout each farming season              |
| Evaluation Frequency     | End of each farming season and end of programme        |
| Data Collection Platform | CommCare                                               |
| Data Storage             | PostgreSQL                                             |
| Data Processing          | Python                                                 |
| Operational Analysis     | Excel                                                  |
| Executive Reporting      | Power BI                                               |

## 4.0. Implementing Organisation

The Green Harvest Initiative (GHI) is a fictional non-governmental organisation implementing the Smallholder Farm Productivity Programme (SFPP). The organisation works with rural farming communities to improve agricultural productivity, strengthen household livelihoods, and promote sustainable farming practices through training, input support, and extension services.

To manage programme implementation effectively, GHI requires a robust Monitoring and Evaluation (M&E) system that supports digital data collection, case management, performance monitoring, and evidence-based reporting.

## 5.0. Stakeholders and their Information Needs

| Stakeholder                      | Role                                         | Information Needed                                                    |
| -------------------------------- | -------------------------------------------- | --------------------------------------------------------------------- |
| Programme Manager                | Oversees programme implementation            | Overall programme performance, KPIs, progress against targets         |
| M&E Manager                      | Manages monitoring and evaluation activities | Data quality, indicator performance, reporting, survey completion     |
| Field Supervisors                | Supervise field teams                        | Enumerator performance, completed visits, pending activities          |
| Enumerators / Extension Officers | Collect field data                           | Assigned farmers, scheduled visits, submitted forms                   |
| Logistics Officer                | Coordinates input distribution               | Stock distribution records, beneficiaries served, remaining inventory |
| Training Coordinator             | Organises farmer training                    | Attendance, participation, training coverage                          |
| Farmers                          | Programme beneficiaries                      | Training, farm inputs, advisory support                               |
| Community Leaders                | Represent participating communities          | Community participation, local programme progress                     |
| Donors                           | Provide programme funding                    | Programme outputs, outcomes, impact, accountability reports           |
| Organisation Management          | Strategic oversight                          | Executive summaries, trends, risks, programme success                 |

## 6.0. Programme Goal

To improve the productivity, resilience, and livelihoods of smallholder farming households through increased access to agricultural knowledge, quality farm inputs, and continuous extension support.

## 7.0. Programme Objectives

The programme aims to:

1. Register eligible smallholder farmers into the programme.
2. Deliver agricultural training that improves farmers' knowledge and skills.
3. Distribute quality farm inputs to eligible farmers in a timely manner.
4. Conduct regular farm monitoring visits to support farmers and track progress.
5. Increase the adoption of recommended crop and livestock management practices.
6. Improve agricultural productivity among participating farmers.
7. Increase household agricultural income.
8. Improve household food security.
9. Measure beneficiary satisfaction with programme services.
10. Generate reliable evidence to support programme management, reporting, and future planning.

## 8.0. Project Scope

This project will develop a complete end-to-end Monitoring and Evaluation data solution covering:

- **Programme Design**
    - Programme framework
    - Results framework
    - Indicators
    - Data collection strategy

- **Digital Data Collection**
    - Farmer Register (Case Creation)
    - Training Attendance
    - Input Distribution
    - Farm Monitoring Visit
    - Farmer Satisfaction Survey
    - Community Needs Assessment
    - End-of-Season Programme Evaluation

- **Data Processing**
    - Generate realistic sample data
    - Clean and validate data using Python
    - Transform and enrich data
    - Load cleaned data into PostgreSQL
    - Create SQL views for reporting

- **Data Analysis**
    - Operational analysis in Excel
    - Executive dashboards in Power BI
    - KPI tracking
    - Trend analysis
    - Geographic analysis
    - Beneficiary analysis
    - Data quality analysis

- **Reporting**
    - Programme performance
    - Activity monitoring
    - Outcome measurement
    - Impact assessment
    - Recommendations

## 9.0. Key Reporting Questions

- **Programme Reach**
    - How many farmers have been registered?
    - How many farmers are actively participating in the programme?
    - Which communities have the highest participation?
    - What is the demographic profile of registered farmers?

- **Programme Performance**
  - Are programme activities meeting planned targets?
  - Which locations are performing above or below expectations?
  - What are the overall programme performance trends?

- **Training**
  - How many training sessions have been conducted?
  - How many farmers attended training?
  - What is the training attendance rate?
  - Which training topics have the highest participation?

- **Input Distribution**
  - Which agricultural inputs were distributed?
  - Were inputs distributed on time?
  - How many farmers received agricultural inputs?
  - Which farmers have not yet received planned inputs?

- **Farm Monitoring**
  - How many monitoring visits were completed?
  - Which farmers missed scheduled visits?
  - What are the most common farm challenges reported?
  - What operational challenges are being reported during monitoring visits?

- **Outcomes**
  - What percentage of farmers adopted recommended farming practices?
  - How have crop yields changed?
  - How has livestock productivity changed?
  - Has household agricultural income improved?
  - Has household food security improved?

- **Beneficiary Feedback**
  - How satisfied are farmers with programme services?
  - What improvements do beneficiaries recommend?
  - What are the most common agricultural needs identified by communities?

- **Programme Evaluation**
  - Did the programme achieve its intended objectives by the end of the season?
  - Which interventions appear to have had the greatest impact?
  - What lessons learned can inform future programme implementation?

## 10.0. Results Framework

| Level          | Description                                                                                                                                                                                                                                                           |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Impact**     | Improved food security, agricultural productivity, and livelihoods of smallholder farming households.                                                                                                                                                                 |
| **Outcomes**   | Increased adoption of recommended farming practices, improved crop and livestock productivity, increased household agricultural income, and improved household food security.                                                                                         |
| **Outputs**    | Farmers registered, training sessions conducted, farmers trained, agricultural inputs distributed, farm monitoring visits completed, community needs assessments conducted, farmer satisfaction surveys completed, and end-of-season programme evaluations completed. |
| **Activities** | Register farmers, conduct community needs assessments, organise and deliver farmer training, distribute agricultural inputs, conduct farm monitoring visits, administer farmer satisfaction surveys, and conduct end-of-season programme evaluations.                 |
| **Inputs**     | Funding, programme staff, enumerators, extension officers, trainers, agricultural inputs, vehicles, mobile devices, data collection and analysis tools (CommCare, Python, PostgreSQL, Excel, Power BI), and internet connectivity.                                                                         |

## 11.0. Indicators

| Indicator                                  | Definition                                                                           | Formula                                                   | Reporting Frequency | Data Source                                |
| ------------------------------------------ | ------------------------------------------------------------------------------------ | --------------------------------------------------------- | ------------------- | ------------------------------------------ |
| Number of Farmers Registered               | Total number of farmers enrolled in the programme.                                   | Count of registered farmers                               | Monthly             | Farmer Registration                        |
| Active Farmers                             | Number of registered farmers actively participating in programme activities.         | Count of active farmer cases                              | Monthly             | Farmer Registration, Farm Monitoring Visit |
| Number of Training Sessions Conducted      | Total training sessions delivered during the reporting period.                       | Count of training sessions                                | Monthly             | Training Attendance                        |
| Training Attendance Rate                   | Percentage of registered farmers who attended at least one training session.         | (Farmers Trained ÷ Registered Farmers) × 100              | Monthly             | Farmer Registration, Training Attendance   |
| Number of Farmers Trained                  | Total farmers who attended one or more training sessions.                            | Count of unique farmers trained                           | Monthly             | Training Attendance                        |
| Number of Farmers Receiving Inputs         | Total farmers who received programme inputs.                                         | Count of farmers receiving inputs                         | Monthly             | Input Distribution                         |
| Input Distribution Coverage                | Percentage of registered farmers who received planned inputs.                        | (Farmers Receiving Inputs ÷ Registered Farmers) × 100     | Monthly             | Farmer Registration, Input Distribution    |
| Number of Monitoring Visits Completed      | Total farm monitoring visits conducted.                                              | Count of completed visits                                 | Monthly             | Farm Monitoring Visit                      |
| Monitoring Coverage                        | Percentage of active farmers visited during the reporting period.                    | (Farmers Visited ÷ Active Farmers) × 100                  | Monthly             | Farm Monitoring Visit                      |
| Adoption Rate of Recommended Practices     | Percentage of monitored farmers implementing recommended practices.                  | (Farmers Adopting Practices ÷ Farmers Monitored) × 100    | Quarterly           | Farm Monitoring Visit                      |
| Average Crop Yield                         | Average crop yield recorded per hectare.                                             | Total Yield ÷ Total Cultivated Area                       | Seasonal            | Farm Monitoring Visit                      |
| Average Livestock Productivity             | Average production per livestock enterprise (e.g., milk, eggs, weight gain).         | Total Production ÷ Number of Relevant Animals             | Seasonal            | Farm Monitoring Visit                      |
| Average Household Agricultural Income      | Average agricultural income earned by participating households.                      | Total Agricultural Income ÷ Number of Households          | Seasonal            | Farm Monitoring Visit                      |
| Household Food Security Rate               | Percentage of households reporting adequate food availability throughout the season. | (Food Secure Households ÷ Surveyed Households) × 100      | Seasonal            | End-of-Season Programme Evaluation         |
| Farmer Satisfaction Rate                   | Percentage of farmers satisfied with programme services.                             | (Satisfied Farmers ÷ Surveyed Farmers) × 100              | Seasonal            | Farmer Satisfaction Survey                 |
| Community Needs Assessment Completion Rate | Percentage of target communities where needs assessments were completed.             | (Communities Assessed ÷ Target Communities) × 100         | Annual              | Community Needs Assessment                 |
| Programme Objective Achievement Rate       | Percentage of programme objectives achieved during the reporting period.             | (Objectives Achieved ÷ Planned Objectives) × 100          | Seasonal            | End-of-Season Programme Evaluation         |
| Enumerator Form Completion Rate            | Percentage of assigned forms successfully submitted by enumerators.                  | (Submitted Forms ÷ Assigned Forms) × 100                  | Monthly             | CommCare Submission Logs                   |
| Data Completeness Rate                     | Percentage of mandatory data fields completed.                                       | (Completed Required Fields ÷ Total Required Fields) × 100 | Monthly             | CommCare Forms                             |
| Data Submission Timeliness                 | Percentage of forms submitted within the expected reporting period.                  | (On-time Submissions ÷ Total Submissions) × 100           | Monthly             | CommCare Submission Logs                   |

## 12.0. Data Collection Approach

The programme will use **CommCare** as the primary data collection platform. Data will be collected through a combination of case management forms and standalone survey forms to support routine monitoring and programme evaluation.

### 12.1. Farmer Records (Case Management)

The Farmer will serve as the primary case. Each registered farmer will have a unique case record that is created once and updated throughout the programme.

**1. Farmer Register (Case Creation) Form**

- Registers eligible farmers into the programme.
- Creates the Farmer case.

**2. Farmer Records (Case Follow-up) Forms**

- **Training Attendance**
    - Records participation in training sessions.
    - Updates the Farmer case.

- **Input Distribution**
    - Records agricultural inputs distributed to farmers.
    - Updates the Farmer case.

- **Farm Monitoring Visit**
    - Records observations made during routine farm visits.
    - Tracks adoption of recommended practices, crop and livestock performance, and field challenges.
    - Updates the Farmer case.

### 12.2. Programme Surveys (Standalone Survey Forms)

- **Community Needs Assessment**
    - Collects baseline information on agricultural challenges and community priorities.

- **Farmer Satisfaction Survey**
    - Measures farmers' satisfaction with programme services and support.

- **End-of-Season Programme Evaluation**
    - Assesses programme performance, outcomes, and lessons learned at the end of each farming season.

### 12.3. App Navigation

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

### 12.4. Data Collection Frequency

- **Farmer Register**
    - Conducted once for each farmer.

- **Training Attendance**
    - Conducted whenever a training session takes place.

- **Input Distribution**
    - Conducted whenever agricultural inputs are distributed.

- **Farm Monitoring Visit**
    - Conducted during scheduled monitoring visits throughout the farming season.

- **Community Needs Assessment**
    - Conducted before programme implementation and updated when necessary.

- **Farmer Satisfaction Survey**
    - Conducted towards the end of each farming season.

- **End-of-Season Programme Evaluation**
    - Conducted at the end of each farming season.

### 12.5. Data Collection Personnel
- **Enumerators**: Register farmers and administer standalone surveys.

- **Extension Officers**: Conduct farm monitoring visits and provide technical support.

- **Training Coordinators**: Record training attendance.

- **Logistics Officers**: Record agricultural input distribution.

- **M&E Team**: Review submitted data, perform quality checks, and prepare reports.

### 12.6. Data Flow

1. Data is collected using CommCare.
2. Data is exported from CommCare.
3. Python cleans, validates, and transforms the raw data.
4. Cleaned data is loaded into PostgreSQL.
5. SQL models are created for reporting.
6. Excel is used for operational analysis.
7. Power BI connects to PostgreSQL to produce executive reports/dashboards.

## 13.0. Synthetic Data Generation

Since this project uses a fictional agricultural programme, realistic synthetic data was generated using Python to simulate field data collected through digital data collection forms.

The synthetic data was designed to reflect common patterns observed in agricultural monitoring and evaluation programmes while remaining entirely fictional.

The data generation process included:
- Generating Farmer Registration, Farm Monitoring Visit, Training Attendance, and Input Distribution datasets;
- Producing realistic demographic, agricultural, and programme participation data;
- Creating unique CommCare-style identifiers and submission metadata;
- Preserving relationships between datasets using farmer case IDs;
- Generating realistic GPS coordinates for farms and monitoring visits; and
- Introducing controlled data quality issues in the Farmer Registration dataset to support subsequent data cleaning and validation exercises.

## 14.0. Data Cleaning & Validation

Python was used to clean, validate, and standardize the synthetic datasets before data transformation and modelling.

The cleaning and validation process includes:
- Basic data profiling;
- Removing duplicate records;
- Standardising phone number formats;
- Standardising text capitalization;
- Validating GPS coordinates against the expected project area; and
- Validating the remaining datasets before loading them into the cleaned data layer.

## 15.0. Data Transformation & Loading

Python was used to create analysis-ready datasets by deriving reusable fields before SQL modelling and reporting. This preserves lineage and makes debugging easier.

The transformation process includes:
- Loading the cleaned datasets;
- Calculating farmer age and form completion durations;
- Extracting latitude and longitude from GPS coordinates;
- Joining Farmer Registration and Farm Monitoring Visit data using `form.case.@case_id`;
- Calculating the distance between registration and monitoring visit GPS coordinates;
- Creating a GPS validation flag based on the calculated distance; and
- Exporting the transformed datasets to the 03_transformed layer for SQL modelling and reporting.

In a production environment, transformed data would typically be loaded into a database using connectors such as **SQLAlchemy** or **pyodbc**, with pipeline orchestration managed by tools such as **Apache Airflow, Azure Data Factory (ADF)**, or cloud-native orchestration services, while large-scale data transformations may be performed using frameworks such as **dbt** or **Apache Spark**, depending on the architecture.

## 16.0. Data Modelling

## 17.0. Data Quality Assessment

## 18.0. Programme Performance Analysis & Reporting
The programme performance reports are designed to operationalise the **Results Framework** and **Indicators** defined in **Sections 10** and **11**. Each KPI and visual represents one or more programme indicators, enabling stakeholders to monitor implementation progress, assess programme performance, and support evidence-based decision-making.

## 19.0. Insights & Recommendations

## 20.0. Repository Structure

```text
Monitoring-and-Evaluation-System/
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
│
├── sql models/
│   ├── 01_staging/
│   │   ├── stg_farm_monitoring_visit.sql
│   │   ├── stg_farmer_registration.sql
│   │   ├── stg_input_distribution.sql
│   │   └── stg_training_attendance.sql
│   │
│   ├── 02_marts/     
│   │   ├── mart_field_agent_performance.sql
│   │   └── mart_programme_performance.sql
│   │        
│   └── database_objects_creation_scripts/
│       ├── database_schema.sql
│       ├── farm_monitoring_visit_transformed table.sql
│       ├── farmer_registration_transformed table.sql
│       ├── input_distribution_transformed table.sql
│       └── training_attendance_transformed table.sql
│        
└── README.md
```
