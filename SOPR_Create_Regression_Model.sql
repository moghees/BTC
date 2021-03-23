#standardSQL
CREATE MODEL `crypto-ml-303521.bitcoinprice.btc_sopr_model`
OPTIONS
  (model_type='linear_reg',
    input_label_cols=['Closing_Price']) AS
SELECT
  p.Close as Closing_Price,
  s.v
FROM
        `crypto-ml-303521.bitcoinprice.bitcoindaily` p
JOIN    `crypto-ml-303521.BTC_SOPR.SOPR` s on datetime (p.date) = datetime (s._t_) 

WHERE 
p.Close is not null
AND RAND() < 0.001