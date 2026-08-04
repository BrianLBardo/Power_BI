# 🏥 HealthStat BI: Datadrevet Hospitalsoptimering og Effektivitetsanalyse i Power BI
> *En komplet Business Intelligence-løsning til analyse af hospitalers effektivitet, liggetid (LOS), kostafvigelser og nøglepåvirkere.*

Welcome to the GitHub repository for the **HealthStat Healthcare Analytics Case Study**. This project delivers an end-to-end Business Intelligence solution created in **Power BI** for the healthcare consulting firm **HealthStat**. 

The primary goal of this case study is to evaluate real-world hospital efficiency data, identify operational outliers, understand the underlying drivers behind patient length of stay (LOS) and cost per discharge, and formulate actionable, data-driven recommendations for hospital management.

---

## 🎯 Projektbeskrivelse

I sundhedssektoren er optimering af hospitalers effektivitet og omkostningsstyring afgørende for at opretholde en høj behandlingskvalitet. Som konsulent for **HealthStat** har opgaven været at gennemføre en dybdegående analyse af et sundhedsdatasæt for at besvare følgende centrale spørgsmål:
1. **Performance & Effektivitet:** Hvad er de overordnede tendenser for indlæggelser (Discharges), samlede omkostninger (Total Cost) og gennemsnitlig liggetid (LOS)?
2. **Identifikation af Outliers:** Hvilke hospitaler afviger negativt fra gennemsnittet med uforholdsmæssigt høj liggetid og høje omkostninger pr. udskrivning?
3. **Nøglepåvirkere (Driver Analysis):** Hvilke kliniske, demografiske og administrative faktorer har den største direkte indflydelse på forlænget liggetid og øgede patientomkostninger?

---

## 🛠 Datamodellering

Datasættet er struktureret i et optimeret **Stjerneschema (Star Schema)** for at sikre maksimal ydeevne og præcis kontekstfiltrering på tværs af rapportens visualiseringer:

* **Faktatabel:**
  * `Discharges`: Transaktionsdata for patientindlæggelser, inklusive `LengthOfStay`, `TotalCost`, `HospitalID`, `DateKey` og `DiagnosisID`.
* **Dimensionstabeller:**
  * `Hospitals`: Stamdata om hospitaler (navn, region, sengekapacitet, ejerskabstype).
  * `Calendar`: Dedikeret datotabel til tidsbaserede beregninger (YTD, trendanalyser).
  * `Diagnosis`: Diagnosekoder, sværhedsgrad (`SeverityOfIllness`) og medicinske specialer.

---

## 🧮 DAX-målinger & KPI'er

Rapporten benytter en række beregnede DAX-measures til at evaluere hospitalernes performance og udregne benchmark-afvigelser:

* **Total Discharges:** `COUNTROWS('Discharges')` – Samlet antal patientudskrivninger.
* **Total Cost:** `SUM('Discharges'[TotalCost])` – Samlede direkte patientomkostninger.
* **Avg Length of Stay (LOS):** `AVERAGE('Discharges'[LengthOfStay])` – Gennemsnitlig liggetid i dage.
* **Avg Cost per Discharge:** `DIVIDE([Total Cost], [Total Discharges], 0)` – Gennemsnitlig omkostning pr. udskrivning.
* **Avg Cost per Day:** `DIVIDE([Total Cost], SUM('Discharges'[LengthOfStay]), 0)` – Daglige gennemsnitlige behandlingsomkostninger.
* **LOS Variance vs Benchmark:** Beregning af det enkelte hospitals afvigelse i liggetid i forhold til det nationale eller regionale gennemsnit.

---

## 📊 Dashboard-struktur

Power BI-løsningen består af en **3-siders branded rapport** opbygget i HealthStats visuelle identitet:

### Side 1: Overordnet Ledelsesdashboard (Executive Overview)
- **KPI-oversigt:** Hurtigt overblik over `Total Discharges`, `Total Cost`, `Avg Length of Stay` og `Avg Cost per Discharge`.
- **Trendanalyse:** Kombinationsdiagram med månedlig udvikling i udskrivninger og gennemsnitlig liggetid over tid.
- **Omkostningsfordeling:** Treemap og kategoriske nedbrydninger af omkostninger pr. diagnosegruppe og indlæggelsestype.

### Side 2: Hospital Performance & Outliers
- **Outlier-identifikation (Scatter Chart):**
  - *X-akse:* Gennemsnitlig liggetid (LOS).
  - *Y-akse:* Gennemsnitlig omkostning pr. udskrivning (`Avg Cost per Discharge`).
  - Visuel fremhævning af hospitaler i top-højre kvaddel (kritiske afvigere).
- **Benchmarking-matrix:** Detaljeret overblik over alle hospitaler med betinget formatering og databarer for direkte sammenligning af effektivitet.

### Side 3: Driveranalyse & Nøglepåvirkere (Key Influencers)
- **Key Influencers Visual:** Avanceret Machine Learning-visualisering i Power BI, der afdækker de primære faktorer, som får `LengthOfStay` til at stige (f.eks. specifikke diagnosekoder, aldersgrupper eller akutmodtagelser).
- **Dekomponeringstræ (Decomposition Tree):** Interaktiv ad-hoc nedbrydning af samlede omkostninger fra overordnet region og diagnose ned til det enkelte hospital.

---

## 💡 Key Business Insights & Anbefalinger

1. **Fokus på kritiske afvigere:** Analysen identificerer en undergruppe af hospitaler, hvor liggetiden er over 20% højere end benchmark uden en tilsvarende stigning i patienternes kliniske sværhedsgrad.
2. **Administrative vs. Kliniske forsinkelser:** Nøglepåvirker-visuelen viser, at forlænget liggetid i mange tilfælde drives af administrative udskrivningsprocedurer frem for udelukkende kliniske årsager.
3. **Omkostningsbesparelse:** En målrettet reduktion af liggetiden med gennemsnitligt 0,5 dag på de svagest præsterende hospitaler vil medføre en betydelig årlig besparelse i de samlede driftsomkostninger for HealthStats klienter.

---

## 💻 Teknologier & Værktøjer

- **Power BI Desktop:** Datamodellering, DAX-beregninger og interaktivt rapportdesign.
- **Power Query (M):** ETL-proces og datarensning.
- **Key Influencers & AI Visuals:** Automatiseret driveranalyse i Power BI.
- **GitHub:** Versionsstyring og projektdokumentation.

---

## 🚀 Installation & Anvendelse

1. **Klon dette repository:**
   ```bash
   git clone https://github.com/dithandtag/healthstat-hospital-efficiency.git
