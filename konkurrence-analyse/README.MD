# 📊 Sintec - Competitor Sales & Market Share Analysis (Power BI Case Study)

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power_Query-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-Data_Analysis_Expressions-blue?style=for-the-badge)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

---

## 📌 Projektfokus & Formål

Dette Data Analytics-projekt er et omfattende business intelligence-studie udarbejdet for den fiktive fremstillingsvirksomhed **Sintec**. Hovedformålet med rapporten er at evaluere Sintecs produktperformance og salgsresultater i direkte sammenligning med nøglekonkurrenter på markedet.

Ved at kombinere interne salgsdata med eksterne konkurrentdata giver denne Power BI-rapport interessenter og beslutningstagere et strategisk beslutningsgrundlag. Rapporten belyser både interne nøgletal (omsætning, enhedssalg, vækstrater) og ekstern markedspositionering (Sintecs markedsandel pr. land, kategori og segment).

---

## 🔍 Nøglefunktioner & Højdepunkter i Rapporten

* **End-to-End ETL-workflow**: Integration, datarensning og datatransformation fra flere datakilder via **Power Query Editor**.
* **Dimensionel Datamodellering**: Opbygning af et optimeret **Stjerneschema (Star Schema)** for maksimal ydeevne og krystalklar relationsstruktur.
* **Avancerede DAX-beregninger**: Udvikling af KPI'er og tidsintelligente måleværdier (Omsætning, Prior Year Sales, Vækst %, Sintec Market Share).
* **AI-drevne visualiseringer**: Integration af Microsofts kunstige intelligens (Nedbrydningstræ / *Decomposition Tree* og Vigtigste påvirkningsfaktorer / *Key Drivers*).
* **Professionelt & Branded UI/UX Design**: Skræddersyet farvetema, interaktive producentlogo-slicere, bogmærke-navigation (*Bookmark Navigators*) og dynamiske KPI-kort.

---

## 📑 Rapportens Opbygning & Sider

Rapporten indeholder **2 interaktive hovedsider**, som hver adresseret specifikke forretningsbehov:

```
├── 1. Competitor Sales Analysis (Overblik & Konkurrenceanalyse)
└── 2. Advanced Insights (AI-analyse & Dybdegående Drivers)
```

---

### 1. Competitor Sales Analysis (Hoveddashboard)
Denne side fungerer som det primære ledelsesdashboard, der sammenholder Sintecs performance mod konkurrenterne.

#### Visuelle Elementer & Funktionalitet:
* **Gauges (Målere)**: 
  * *Total Revenue vs. PY Sales*: Viser aktuel samlet omsætning holdt op mod sidste års salg (Prior Year Target).
* **Line and Clustered Column Combo Chart (Kombinationsdiagram)**:
  * *Revenue & % Growth by Date*: Søjler viser samlet omsætning pr. dato/år, mens linjen illustrerer den procentuelle vækstrate over tid.
* **Clustered Column Chart (Søjlediagram)**:
  * *Revenue by Country & Manufacturer*: Sammenligning af salget pr. land opdelt på Sintec og de enkelte konkurrenter.
* **Matrix / Pivot Table (Produkthierarki)**:
  * Dybdegående tabelstruktureret oversigt opdelt efter *Category $
ightarrow$ Segment $
ightarrow$ Product*.
  * Viser nøgletal: **Total Revenue**, **PY Sales**, **% Growth** samt **Scopet Markedsandel (%)**.
* **KPI Card**:
  * Fremhæver **Sintec Market Share** for hurtigt overblik over markedspositionen.
* **Interaktive Slicere & Navigation**:
  * Slicere med visuelle producentlogoer (*Manufacturer.Logo*) samt dato/tidsfiltrering.
  * *Bookmark Navigator* for sømløs skift mellem forskellige visningsfunktioner.

---

### 2. Advanced Insights (Avancerede AI-Indsigter)
Denne side udnytter Power BI’s indbyggede AI-visuelle elementer til rotårsagsanalyse og mønstergenkendelse.

#### Visuelle Elementer & Funktionalitet:
* **Decomposition Tree (Nedbrydningstræ)**:
  * Gør det muligt for brugeren ad-hoc at nedbryde *Total Revenue* på tværs af produkthierarkiet (*Category $
ightarrow$ Segment $
ightarrow$ Product*) for at identificere de største salgsbidragsydere.
* **Key Drivers / Key Influencers (Vigtigste påvirkningsfaktorer)**:
  * AI-model der analyserer, hvilke faktorer (f.eks. specifikke producenter, produktkategorier, tidsperioder eller segmenter), der har den største statistiske indflydelse på at drive høje eller lave salgstal.
* **KPI Summary Cards**:
  * Dedikerede KPI-kort for **Total Revenue**, **PY Sales**, **Total Units** og **% Growth**.
* **Action Buttons**:
  * Navigationsknapper til hurtigt skift tilbage til hovedoverblikket.

---

## 📐 Datamodel & Arkitektur

Datamodellen er bygget op omkring et klassisk og skalerbart **Stjerneschema (Star Schema)** for at sikre hurtig filtrering og korrekt sammenstilling af salgs- og konkurrentdata.

```
       +------------------+
       |   Date (Dim)     |
       +--------+---------+
                | (1:N)
                v
+---------------+----------------+       +---------------------+
|      Sales (Fact Table)        |<------| Products (Dim)      |
+---------------+----------------+ (N:1) +---------------------+
                ^
                | (N:1)
       +--------+---------+
       | Manufacturer (Dim)|
       +------------------+
```

### Tabeloversigt:
1. **Sales (Faktatabel)**: Indeholder alle transaktionsdata, herunder `Revenue`, `Units`, `Country`, og links til dimensionerne.
2. **Products (Dimensionstabeller)**: Indeholder produktdetaljer og det hierarkiske niveau `Category Hierarchy` (*Category $
ightarrow$ Segment $
ightarrow$ Product*).
3. **Manufacturer (Dimensionstabeller)**: Indeholder oplysninger om Sintec og konkurrerende producenter samt billed-URL'er til logoer (`Logo`).
4. **Date (Datodimension)**: Standard datotabel med indbygget datohierarki (*Year, Quarter, Month, Day*) til tidsintelligens.

---

## 🧮 DAX Måleværdier & Formler

Projektsamlingen anvender præcise og effektive DAX-formler til sammenligning af tidsmæssig performance og markedsandele:

### 1. Samlet Omsætning (Total Revenue)
```dax
Total Revenue = SUM(Sales[Revenue])
```

### 2. Samlet Enhedssalg (Total Units)
```dax
Total Units = SUM(Sales[Units])
```

### 3. Sidste Års Salg (Prior Year Sales)
```dax
PY Sales = 
CALCULATE(
    SUM(Sales[Revenue]),
    SAMEPERIODLASTYEAR('Date'[Date])
)
```

### 4. Procentuel Vækst (% Growth)
```dax
% Growth = 
DIVIDE(
    [Total Revenue] - [PY Sales],
    [PY Sales],
    0
)
```

### 5. Sintecs Markedsandel (Sintec Market Share)
```dax
Sintec Market Share = 
DIVIDE(
    CALCULATE(
        SUM(Sales[Revenue]),
        Manufacturer[Manufacturer] = "Sintec"
    ),
    CALCULATE(
        SUM(Sales[Revenue]),
        ALL(Manufacturer)
    ),
    0
)
```

---

## 💡 Vigtigste Business Takeaways & Indsigter

1. **Markedspositionering**: Sintecs markedsandel kan kontinuerligt overvåges mod konkurrenterne i de enkelte geografiske markeder (Lande).
2. **Kategori- og Segmentperformance**: Ved hjælp af produkthierarkiet og nedbrydningstræet kan produktchefer identificere underperformende segmenter og fokusere marketingindsatsen.
3. **AI-drevet beslutningstagning**: Key Drivers-modellen afdækker skjulte mønstre i data, f.eks. hvilke producenter og kategorier der er de primære katalysatorer for vækst.
4. **Tidsmæssigudvikling**: Sammenligningen mellem `Total Revenue` og `PY Sales` viser tydeligt, om Sintec opnår sine årlige salgsmål.

---

## 🚀 Kom godt i gang

### Forudsætninger
* [Microsoft Power BI Desktop](https://powerbi.microsoft.com/desktop/) (Nyeste version anbefales).

### Installation & Brug
1. Klon dette repository til din lokale maskine:
   ```bash
   git clone https://github.com/DIT_BRUGERNAVN/Sintec-Competitor-Sales-Analysis.git
   ```
2. Åbn rapportfilen `konkurrencea-analyse.pbix` i Power BI Desktop.
3. Interager med rapporten via logo-slicerne, datofilteret eller AI-visualiseringerne.

---

## 📁 Repository Struktur

```
.
├── konkurrencea-analyse.pbix    # Power BI Rapportfil indeholdende datamodel og visualiseringer
├── README.md                    # Dokumentation for GitHub repository
└── assets/                      # Skærmbilleder og grafiske elementer (valgfrit)
```
