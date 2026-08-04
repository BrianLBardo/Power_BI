# 🍕 Tenate Industries: Supply Chain Analytics & Make vs. Buy Decision Tool i Power BI
> *En komplet Business Intelligence-løsning til leverandør-tilbudsanalyse, dynamiske volumen-scenarier, intern produktionskapacitet og Make vs. Buy beslutningsstøtte.*

## 🎯 Projektbeskrivelse

Tenate Industries er specialiseret i reservedele til industrielle pizzaovne. Når nye komponenter skal fremskaffes eller eksisterende produktion skal opskaleres, står forsyningskædeteamet over for det strategiske valg: **Skal reservedelen fremstilles internt (Make), eller skal produktionen udliciteres til eksterne leverandører (Buy)?**

Dette case-study transformerer traditionelle statiske regneark til en dynamisk og skalerbar BI-model, som adresserer følgende hovedområder:
1. **Tilbudsanalyse (Quote Analysis):** Evaluering af eksterne leverandørtilbud baseret på stykpriser (`Unit Cost`) og engangsomkostninger (`Non-Recurring Expenses / NRE`).
2. **Dynamisk Volumenscenarie-analyse:** Simulering af totale forsyningsomkostninger ved skiftende produktionsvolumener.
3. **Kapacitets- og Investeringsintegration:** Opgørelse af intern maskinkapacitet, behov for udvidelsesinvesteringer (`Capital Investment`) og direkte fremstillingsomkostninger.
4. **Make vs. Buy Beslutningsmatrix:** Automatiseret beregning af den mest omkostningseffektive strategi samt opgørelse af opnået besparelse (`Cost Avoidance`).

---

## 🛠 Datamodellering & RLS

Modelstrukturen samler eksterne tilbud, interne produktionsressourcer og produktstamdata i et velstruktureret **Stjerneschema (Star Schema)**:

  * **Faktatabeller & Hjælpetabeller:**
  * `Quotes`: Leverandørtilbud opdelt på leverandør (`Supplier`), reservedelsnummer (`Part_Number`), volumenstørrelse (`Volume`), `Unit_Cost`, `Non_recurring_expenses`, `Extended Cost` og `Full Cost`.
  * `Internal_Mfg_Resource_Estimates`: Interne produktionsestimater inkl. maskinmodel (`Machine_Model`), eksisterende kapacitet (`Existing_Capacity`), enhedskapacitet (`Unit_Capacity`) og påkrævede kapitalinvesteringer.
  * `Scenario Volume` / `Scenario Volumes (All)`: What-if parametre til dynamisk simulering af produktionsmængder.
  * **Dimensionstabeller:**
  * `Product_Dimension`: Stamdata for reservedele (`Part_Number`, `Part_Name`).

### Row-Level Security (RLS)
For at beskytte følsomme leverandøraftaler og interne omkostningsstrukturer er der implementeret **Row-Level Security (RLS)**, som sikrer, at indkøbere og produktionsansvarlige kun ser data for deres relevante produktkategorier og leverandørgrupper.

---

## 🧮 DAX-målinger & Omkostningsscenarier

Rapporten anvender en række avancerede DAX-measures til at sammensætte de fulde omkostningskurver:

* **Extended Cost:** `[Unit Cost] * [Scenario Volume]` – Samlede variable stykomkostninger ved det valgte volumen.
* **Full Cost (Buy Scenario):** `[Extended Cost] + [Non-Recurring Expenses]` – Samlede eksterne omkostninger inklusiv opstartsudgifter.
* **Additional Unit Capacity Required:** Beregning af, hvor mange ekstra maskinenheder der skal investeres i for at dække det simulerede produktionsvolumen.
* **Make Scenario Full Cost:** Samlede interne fremstillingsomkostninger inklusiv afskrivning af den påkrævede kapitalinvestering.
* **Make vs. Buy Verdict:** Dynamisk DAX-evaluering:
  $$\text{Make vs Buy} = \text{IF}([Make\ Scenario\ Full\ Cost] < [Buy\ Scenario\ Full\ Cost], \text{"Make"}, \text{"Buy"})$$
* **Cost Avoidance:** Den beregnede økonomiske besparelse ved at vælge den mest optimale strategi frem for det dyrere alternativ.

---

## 📊 Dashboard-struktur

Power BI-rapporten består af 3 specialiserede dashboards, der følger beslutningsprocessen i Supply Chain-afdelingen:

### 1. 🏷️ Supplier Selection (Tilbudsanalyse)
- Detaljeret sammenligning af eksterne leverandører pr. reservedelsnummer.
- Visualisering af stykprisudvikling (*Unit Cost*) og engangsomkostninger (*NRE*) på tværs af volumenintervaller.
- *Cost Breakdown* diagram over samlede udgifter for at identificere den mest konkurrencedygtige leverandør.

### 2. 📈 Scenario Analysis - Suppliers (Volumensimulering)
- **What-If Slicer:** Muliggør øjeblikkelig justering af det forventede produktionsvolumen.
- Omkostningskurver for leverandører, der viser skæringspunkterne (Break-even points), hvor en leverandør med høje opstartsomkostninger men lave stykpriser bliver billigere end konkurrenterne.

### 3. 🏭 Make versus Buy (Beslutningsværktøj)
- Integreret analyse af den interne produktionskapacitet mod de samlede eksterne indkøbsomkostninger.
- Opgørelse af den påkrævede kapitalinvestering (*Capital Investment Required*) ved intern fremstilling.
- Præsentation af **Make vs. Buy** anbefalingen samt den præcise omkostningsbesparelse (*Cost Avoidance*) for den valgte reservedel.

---

## 💡 Key Supply Chain Insights & Strategiske Konklusioner

1. **Volumenfølsomme Skæringspunkter:** Ved lave produktionsvolumener er ekstern udlicitering (*Buy*) næsten altid mest fordelagtig grundet tunge interne maskininvesteringer. Ved højere volumener opvejer den interne stykprisbesparelse kapitalinvesteringen.
2. **NRE-påvirkning:** Leverandører med høje engangsomkostninger (*Non-Recurring Expenses*) fremstår ofte dyre ved første øjekast, men visse leverandører viser sig at være de billigste ved volumener over 10.000 enheder.
3. **Kapacitetsudnyttelse:** Toolmæssig identifikation af eksisterende overskudskapacitet i maskinparken gør det muligt at vælge "Make" uden behov for nye kapitalinvesteringer.

---

## 💻 Teknologier & Værktøjer

- **Power BI Desktop:** Datamodellering, What-if parametre og interaktivt rapportdesign.
- **Power Query (M):** Datatransformation og konsolidering af tilbuds- og produktionsdata.
- **DAX (Data Analysis Expressions):** Dynamiske scenarieberegninger og beslutningslogik.
- **Row-Level Security (RLS):** Rollebaseret datadeling.
- **GitHub:** Versionsstyring og projektdokumentation.

---

## 🚀 Installation & Anvendelse

1. **Klon dette repository:**
   ```bash
   git clone [https://github.com/dithandtag/tenate-supply-chain-analytics.git](https://github.com/dithandtag/tenate-supply-chain-analytics.git)
