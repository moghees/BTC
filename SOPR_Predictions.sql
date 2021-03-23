SELECT
  *
FROM
  ML.PREDICT(MODEL `crypto-ml-303521.bitcoinprice.btc_sopr_model`,
    (
    SELECT
      p.Close AS Closing_Price,
      s.v
    FROM
      `crypto-ml-303521.bitcoinprice.bitcoindaily` p
    RIGHT OUTER JOIN
      `crypto-ml-303521.BTC_SOPR.SOPR` s
    ON
      datetime (p.date) = datetime (s._t_)
    WHERE
      s.v = 1.01516082424846 ) )