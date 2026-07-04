CREATE TABLE final_analysis AS
SELECT
    d.Account,
    d.trade_date,

    d.daily_volume,
    d.daily_fee,
    d.num_trades,
    d.avg_trade_size,
    d.buy_volume,
    d.sell_volume,
    d.net_flow,

    f.fear_greed_index,
    f.classification

FROM daily_trader_behavior d
LEFT JOIN fear_greed f
ON d.trade_date = f.date;



CREATE TABLE daily_trade_history AS
SELECT
    Account,
    DATE(start_time) AS trade_date,

    round(SUM(total_size_usd), 2) AS daily_volume,
    round(SUM(total_fee), 2) AS daily_fee,
    COUNT(*) AS total_trades,
    round(AVG(total_size_usd), 2) AS avg_trade_size,

    round(SUM(CASE WHEN Side = 'BUY' THEN total_size_usd ELSE 0 END), 2) AS buy_volume,
    round(SUM(CASE WHEN Side = 'SELL' THEN total_size_usd ELSE 0 END), 2) AS sell_volume,
    
    round(((SUM(CASE WHEN Side = 'BUY' THEN total_size_usd ELSE 0 END)
     - SUM(CASE WHEN Side = 'SELL' THEN total_size_usd ELSE 0 END)
    )), 2) AS net_flow

FROM trade.trade_table
GROUP BY Account, DATE(start_time);




CREATE TABLE final_analysis AS
SELECT
    d.Account,
    d.trade_date,

    d.daily_volume,
    d.daily_fee,
    d.total_trades,
    d.avg_trade_size,
    d.buy_volume,
    d.sell_volume,
    d.net_flow,

    f.value,
    f.classification

FROM daily_trade_history d
LEFT JOIN fear_greed f
ON d.trade_date = f.date;