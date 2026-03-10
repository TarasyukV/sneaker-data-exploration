With avgdp as 
(
  Select
    avg(damage_percent) as avg_dp
    , avg(sales_percent) avg_sp
  FROM sneakers
)
, brand as 
(
  Select 
	  name
	  , type
	  , avg(damage_percent) as avg_dp
	  , avg(sales_percent) avg_sp
	  , sum(revenue) as total_revenue
	FROM sneakers
	GROUP BY name, type
)

  Select 
    b.name
    , b.type 
    , b.total_revenue
    , ROUND(b.avg_sp, 1) as avg_sales_percent
    , ROUND(b.avg_dp, 1) as avg_damaged_persent
  FROM brand b 
  CROSS JOIN avgdp a
  Where b.avg_dp < a.avg_dp
  AND b.avg_sp > a.avg_sp
  ORDER BY b.total_revenue  DESC 
  LIMIT 10
