# 🏦 Mortgage Trading BI: Datadrevet Realkredithandel og Porteføljeoptimering i Power BI
> *En komplet Business Intelligence-løsning til analyse af realkreditlån, budevaluering, handelsudførelse og AI-drevet indtægtsanalyse.*

Welcome to the GitHub repository for the **Mortgage Trading Analysis Case Study in Power BI**. In this project, I act as a Junior Trader on a trading desk at a mortgage originator, analyzing mortgage populations, evaluating bids from investment banks and institutional buyers, executing trades, and uncovering key profit drivers.

---

## 🎯 Projektbeskrivelse

Finansielle strømme bevæger sig fra store investeringsbanker, gennem realkreditinstitutter og ud til de enkelte låntagere. Som trader er hovedopgaven at sikre den optimale prissætning, kvalitet og eksekvering ved salg af låneporteføljer på sekundærmarkedet.

Projektet løser tre centrale finansielle udfordringer:
1. **Portefølje- og Elegibilitetsanalyse:** Hvilke lån opfylder kravene til handel (audit, dokumentation, custodian-status), og hvad er deres aktuelle balancer?
2. **Bud- og Benchmarkevaluering:** Hvordan matcher de modtagne købertilbud (`Bids`) markedets benchmark-priser (`UMBS Price`), og hvilken modpart tilbyder den højeste samlede præmie?
3. **Handelsudførelse & Driveranalyse:** Hvilke faktorer (f.eks. FICO-score, LTV, DTI) påvirker bruttomarginen og handelsfortjenesten mest?

---

## 🛠 Datamodellering

Modelstrukturen forbinder lånestatus, balancer, prissætning og modpartsinformation i et effektivt **Stjerneschema (Star Schema)**:

* **Faktatabeller:**
  * `loan_data`: Oplysninger om lånebeløb, FICO-score, LTV (Loan to Value), DTI (Debt to Income), modpart (`Counterparty`), budpriser og fortjeneste.
  * `loan_balance`: Løbende balancer (`current_balance`, `Scheduled Principal Balance`) og betalingsdatoer.
  * `loan_status`: Dokumentationsstatus, revisorgodkendelse (`file_in_audit`), opbevaringsstatus (`file_at_custodian`) og handelsstatus (`Trade Status`).

---

## 🧮 DAX-målinger & Finansielle KPI'er

Rapporten anvender en række avancerede DAX-beregninger til finansiel evaluering:

* **Weighted Average Price (WA Price):** Vægtet gennemsnitlig handelspris i forhold til lånebalancen.
* **Trade Price ($) & Trade Premium:** Samlet salgspris i dollars samt den overskydende handelspræmie over hovedstolen.
* **Scheduled Principal Balance:** Samlet beregnet hovedstol for de handlede lånestammar.
* **Loan Gross Profit & Profit Margin:** `[Total Loan Revenue] - [Cost]` samt beregning af den procentvise overskudsgrad mod målsætningen (`Target Profit Margin`).
* **Benchmark Test:** Dynamisk DAX-test, der sammenligner modpartens bud mod UMBS-markedsindekset for at sikre favorabel eksekvering.

---

## 📊 Dashboard-struktur

Power BI-rapporten er opbygget af 5 specialiserede dashboards, der følger hele arbejdsprocessen for en mortgage trader:

### 1. 📑 Loan Status
- Overblik over handelsklare lån.
- Sporing af dokumentation gennem audit, godkendelse og indlevering til depotbank (`Custodian`).
- Pie-chart visualisering af lånefordeling på `Trade Status`.

### 2. 💳 Loan Balances
- Detaljeret balanceopgørelse over `current_balance` og `Scheduled Principal Balance`.
- Filtrering på betalingsdatoer og handelsstatus for præcis udvælgelse af lånepuljer.

### 3. ⚖️ Trade Analysis
- Evaluering af indkomne bud fra modparter (`Counterparties`).
- Sammenligning af tilbudte priser mod `UMBS Price` benchmark.
- Visualisering af vægtet gennemsnitspris (**WA Price**) og samlet handel volumen.

### 4. 🚀 Trade Execution
- Detaljeret overblik over gennemførte handler opdelt på modparter.
- 100% Stacked Bar Charts og Søjlediagrammer, der viser fordelingen af `Trade Premium` og `Dollar Price Amount` pr. køber.

### 5. 💡 Profit Analysis & Driver Analysis
- Opgørelse af samlet omsætning (`Total Loan Revenue`), bruttoprofit (`Loan Gross Profit`) og `Loan Profit Margin` mod målsætningen (`target_profit`).
- **Key Influencers Visual (AI/ML):** Automatiseret driveranalyse af, hvad der mest påvirker fortjenesten (f.eks. `median_fico_score`, `Loan to Value Ratio`, `Debt to Income Ratio` og `loan_amount`).

---

## 💡 Key Financial Insights & Konklusioner

1. **Optimal Modpartseksekvering:** Budanalysen viser, at visse modparter konsekvent byder over UMBS-benchmark for specifikke låneprofiler, hvilket muliggør målrettet auktionering.
2. **Kreditkvalitetens Betydning:** Key Influencers-analysen bekræfter, at højere `median_fico_score` kombineret med en moderat `Loan to Value Ratio (LTV)` giver de største handelspræmier (`Trade Premium`).
3. **Dokumentations-flaskehalse:** Hurtig eksekvering i audit- og custodian-fasen er afgørende for at reducere kapitalomkostninger og udnytte gunstige markedsvinduer.

---

## 💻 Teknologier & Værktøjer

- **Power BI Desktop:** Finansiel datamodellering, DAX-beregninger og interaktivt rapportdesign.
- **Power Query (M):** Datatransformation og konsolidering af lånedata.
- **Key Influencers & AI Visuals:** Driveranalyse af fortjenestemarginaler.
- **GitHub:** Versionsstyring og projektdokumentation.

---

## 🚀 Installation & Anvendelse

1. **Klon dette repository:**
   ```bash
   git clone [https://github.com/dithandtag/mortgage-trading-analysis.git](https://github.com/dithandtag/mortgage-trading-analysis.git)
