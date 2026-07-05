# PrimeTrade.ai-assignment<br>

# Objective
Analyze how market sentiment (Fear/Greed) relates to trader behavior and performance on Hyperliquid. Your goal is to uncover patterns that could inform smarter trading strategies.<br><br>

## Data Import and Cleaning

### Step 1
1. Imported the data using pandas.<br>
2. Checked the shape of the tables.<br>
3. Inspected the DataType of the tables.<br>
4. Made a overview document of the data with the help of `PandasProfiling` library, where i checked for missing values, duplicate rows, zero values, distinct values, correlations, etc.<br>
5. Handle the DATE data types.<br>
6. Exported the file to MySQL database for running queries, joining tables, etc.

### Step 2
1. Extreme Fear = (1-24)
2. Fear = (25-44)
3. Neutral = (45-54)
4. Greed = (55-74)
5. Extreme Greed = (75-100)<br><br>

## SQL Final

### Step 1
1. I filtered out the data which we will be needing for our current project objective.
2. SQL query file is saved in SQL_query folder.
3. The CSV files I dervied from it are given.
4. Main objective from SQL file handling was to segregate the data for our requirements and to join the Market Sentiment and Hyperliquid trade dataset.<br><br>

## Data Analysis (EDA) using Seaborn & Matplotlib

### Key insights I got:
#### Key Insight 1: The data is extremely right-skewed
The mean is much larger than the median for every sentiment.
| Classification | Count |      Mean |   Median |  Std. Dev. |
| -------------- | ----: | --------: | -------: | ---------: |
| Extreme Fear   |   160 | 44,645.68 | 5,414.21 | 126,476.72 |
| Extreme Greed  |   526 | 20,523.66 | 3,791.24 |  60,080.80 |
| Fear           |   630 | 43,464.85 | 4,704.41 | 140,545.85 |
| Greed          |   648 | 52,090.88 | 4,878.82 | 400,317.72 |
| Neutral        |   376 | 51,952.88 | 5,024.01 | 249,073.61 |

This indicates that a relatively small number of very large trades are pulling the average upward.<br><br>

#### Key Insight 2: Greed has the highest variability
Although the Greed period records the highest number of trades, it also has the highest average trade size (≈52.1K). This suggests that traders are not only more active during periods of greed but also tend to execute larger-value trades. The relatively flatter KDE curve for Greed supports this observation by indicating a wider spread of trade sizes, including more high-value transactions.<br><br>

#### Key Insight 3: Typical trade sizes are actually quite similar
Medians are much closer together than the means.
This tells us that the typical trader does not suddenly trade 10× more during Greed.
Instead, the difference in the mean is caused by large outlier trades.<br><br>

#### Key Conclusion: Greed VS Fear

While both Greed and Fear are associated with elevated trading frequency, Greed is characterized by significantly greater variability in trade sizes (Std. Dev. ≈ ₹400K vs. ₹141K in Fear). This indicates that periods of Greed include more high-value trades that increase the average trade size, whereas Fear exhibits comparatively more consistent and lower-value trading.<br><br>

#### Key Insight 4: Buy vs Sell
Buy activity dominates across all sentiment regimes, but in the Greed phase the buy/sell ratio weakens significantly, indicating increased profit-booking and distribution. This shift is followed by a rebound in buying activity in Extreme Greed, suggesting late-stage FOMO-driven participation.<br><br>

#### Key Conclusion: 
The increase in sell volume during the Greed phase, relative to both Fear and Neutral conditions, indicates a potential early distribution phase. This is followed by renewed buying pressure in Extreme Greed, consistent with late-stage FOMO behavior and potential exit liquidity dynamics.<br><br>


# Actionable output
## Strategy 1: Don't punish everyone during Greed — just watch the big trades
Here's the thing: when you look at median trade size, it barely changes across all five sentiment stages — everyone's typical trade stays around ₹4,000-5,000 no matter what the mood is. But the standard deviation during Greed is way higher than during Fear (₹4 lakh vs ₹1.4 lakh). That gap tells you something specific: it's not that everyone starts trading bigger when the market gets greedy. It's that a small number of people start placing much bigger bets.
So instead of a blanket rule like "reduce everyone's leverage during Greed," it makes more sense to only flag or restrict the unusually large trades — say, anything above the 90th percentile in size — and leave normal-sized trades alone. This way you're actually targeting the risky behavior instead of slowing down traders who aren't doing anything different than usual.

## Strategy 2: Use the Greed-phase buy/sell compression as an early distribution signal, and pair it with the PnL pattern for a tactical entry/exit window
Rule of thumb: "When the buy/sell ratio compresses during Greed (sell volume approaching or exceeding buy volume), treat it as an early distribution warning — tighten stops or trim exposure. When buying re-accelerates in Extreme Greed, that's the highest-PnL window historically, but it's also the point closest to a potential top — `so favor shorter holding periods and faster profit-taking rather than adding fresh long-term exposure."`
1. Buy dominance weakens specifically in Greed — a distribution signal.<br>
2. Buying rebounds sharply in Extreme Greed — FOMO.<br>
3. PnL is actually highest in Extreme Greed, not lowest, despite it being the "riskiest-looking" sentiment label.<br>


That last point is counterintuitive and worth leading with — it means the naive rule "de-risk when things look euphoric" would have cost you the best-performing window in your data. The more defensible strategy isn't "avoid Extreme Greed," it's "participate in Extreme Greed but with a shorter time horizon and tighter exit discipline," since it's a high-reward but late-cycle regime.
