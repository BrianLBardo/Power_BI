# 🐾 Whiskique BI: Datadrevet E-Handelsanalyse og Logistikoptimering i Power BI

Dette projekt repræsenterer en komplet Business Intelligence-løsning udviklet i **Power BI** for e-handelsvirksomheden **Whiskique**, som sælger kæledyrsartikler online. 

Formålet med projektet er at omdanne rå transaktionsdata til strategisk og operationel indsigt for virksomhedens ledelse (Executive Team) ved hjælp af avanceret datatransformation i Power Query, stærk datamodellering og DAX-beregninger samt interaktive dashboards.

---

## 🎯 Projektbeskrivelse

Whiskique oplever stigning i transaktionsvolumen på tværs af stater og produktkategorier. For at understøtte strategiske beslutninger om vækst, fragtoptimering og kundeloyalitet har ledelsen haft brug for et konsolideret BI-dashboard, der svarer på følgende spørgsmål:
1. **Salg & Performance:** Hvor performer virksomheden bedst geografisk og produktmæssigt?
2. **Kunderelationer:** Hvad er kundernes levetidsværdi (LTV), og hvor befinder de primære kundesegmenter sig?
3. **Fragtoptimering (What-If Scenarier):** Hvordan påvirker ændringer i forsendelsesmængder de samlede logistik- og fragtomkostninger?
4. **Market Basket Analysis:** Hvilke produkter købes hyppigt sammen, og hvor ligger de højeste avancer?

---

## 🛠 Datatransformation (Power Query)

Gennem Power Query er datasættet blevet undersøgt, renset og struktureret:
- **Datarensning & Validering:** Håndtering af manglende værdier, korrektion af datatyper og fjernelse af duplikater.
- **Geografisk Mapping:** Oprettelse af relaterede tabeller for stater og regioner (`State Mapping`) for præcis geokodning.
- **Aggregering:** Generering af faktura-stammelinjer (`Invoice Totals`) og kategorisering af produkter.

---

## 🧮 Datamodel & DAX Measures

Rapporten er opbygget omkring et effektivt stjerneskema (Star Schema) med klare relationer mellem transaktionsdata (`Sales`), stamdata (`Customers`, `Products`, `State Mapping`) og hjælpetabeller (`Market Basket`, `What-if quantity`).

### Centrale DAX Measures & Beregninger:
- **Total Sales:** `SUM(Sales[Sales])` – Virksomhedens samlede omsætning.
- **Profit %:** `DIVIDE([Total Sales] - [Total Cost], [Total Sales])` – Samlet dækningsgrad i procent.
- **Customer LTV (avg):** Gennemsnitlig levetidsværdi pr. unikt kunde-ID.
- **What-If Shipping Analysis:** Dynamic DAX-measures (`Shipping (What-if)`, `Shipping (Difference)`, `What-if running total`), som beregner de simulerede fragtomkostninger baseret på ledelsens valgte parametre.

---

## 📊 Dashboard Struktur

Power BI-rapporten indeholder 7 dedikerede sider:

### 1. 🧹 Data Clean Up
- Overblik over transaktionsvolumen, samlede datarækker (`Total_Rows`) og fakturanumre.
- Validering af datakvalitet og konsistens på tværs af kunde- og statstabeller.

### 2. 👥 Customer Info
- **Geografisk fordeling:** Interaktivt USA-kort over antal kunder fordelt på regioner og stater.
- **Customer LTV:** Søjlediagram over gennemsnitlig kundeværdi pr. delstat til målretning af marketinginitiativer.

### 3. 📦 Product Info
- Procentvis fordeling af solgte mængder pr. produktbeskrivelse.
- Analyse af enhedsfragtstørrelser (f.eks. fragtomkostning pr. 1000 miles).
- Treemap-visualisering af salg fordelt på overordnede produktkategorier.

### 4. 📈 Quantity Info
- Ordrestørrelsesanalyse: Sammenhæng mellem solgt kvantitet (`Total Quantity`) og samlet omsætning pr. faktura.

### 5. 👑 Executive Summary (Hoveddashboard)
- Top-level KPI-kort: **Total Sales**, **Baseline Profit**, **Profit %** og **Baseline Shipping Cost**.
- Shape Map over det samlede salg pr. delstat.
- Treemap og bar-charts over dækningsgrad og salg opdelt på kategori og beskrivelse.

### 6. 🚚 Shipping Metrics (Hvad-nu-hvis Analyse)
- **What-If Parameter Slicer:** Giver ledelsen mulighed for dynamisk at simulere ændringer i forsendelsesmængder.
- **Omkostningspåvirkning:** Kombinationsdiagrammer og Area Charts, der viser forskellen (*Difference*) mellem baseline-fragtomkostninger og det simulerede scenarie over tid.
- Geografisk kortlægning af fragtomkostninger pr. region.

### 7. 🛒 Market Basket Analysis
- Identifikation af ofte samkøbte varer (*Combination of Purchased Items*) til brug for cross-selling og mersalg.
- Kombinationsdiagram med salg i forhold til dækningsgrad (`Profit %`) for identificering af strategiske helteprodukter.

---

## 💡 Key Business Insights

- **Regional koncentration:** Størstedelen af omsætningen drives af specifikke nøgleregioner, hvilket giver mulighed for lageroptimering tættere på slutkunden.
- **Logistikfølsomhed:** What-if scenarieanalysen viser, at optimering af forsendelsesmængder kan reducere logistikomkostningerne markant uden at forringe leveringstiderne.
- **Produktsynergier:** Market basket-analysen har fremhævet stærke produktpar (f.eks. tilbehør og foder), som med fordel kan pakkes som "bundles" for at øge ordreværdien.

---

## 💻 Teknologier & Værktøjer

- **Power BI Desktop:** Rapportdesign, dataviews og visuals.
- **Power Query (M):** ETL-proces (Extract, Transform, Load).
- **DAX (Data Analysis Expressions):** Avancerede måleværdier og tidsseriefunktioner.
- **GitHub:** Versionsstyring og projektdokumentation.

---

## 🚀 Installation & Anvendelse

1. **Klon repositoret:**
   ```bash
   git clone [https://github.com/dithandtag/whiskique-ecommerce-analysis.git](https://github.com/dithandtag/whiskique-ecommerce-analysis.git)
