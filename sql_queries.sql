CREATE OR REPLACE TABLE `datamodel-453518.tlc_data_main.tbl_analytics` AS
SELECT 
  f.trip_id,
  f.VendorID,
  d.tpep_pickup_datetime,
  d.tpep_dropoff_datetime,
  p.passenger_count,
  t.trip_distance,
  r.rate_code_name,
  pick.pickup_latitude,
  pick.pickup_longitude,
  dloc.dropoff_latitude,
  dloc.dropoff_longitude,
  pay.payment_type_name,
  f.fare_amount,
  f.extra,
  f.mta_tax,
  f.tip_amount,
  f.tolls_amount,
  f.improvement_surcharge,
  f.total_amount
FROM `datamodel-453518.tlc_data_main.fact_table` f
JOIN `datamodel-453518.tlc_data_main.datetime_dim` d
  ON f.datetime_id = d.datetime_id
JOIN `datamodel-453518.tlc_data_main.passenger_count_dim` p
  ON f.passenger_count_id = p.passenger_count_id
JOIN `datamodel-453518.tlc_data_main.trip_distance_dim` t
  ON f.trip_distance_id = t.trip_distance_id
JOIN `datamodel-453518.tlc_data_main.rate_code_dim` r
  ON f.rate_code_id = r.rate_code_id
JOIN `datamodel-453518.tlc_data_main.pickup_location_dim` pick
  ON f.pickup_location_id = pick.pickup_location_id
JOIN `datamodel-453518.tlc_data_main.dropoff_location_dim` dloc
  ON f.dropoff_location_id = dloc.dropoff_location_id
JOIN `datamodel-453518.tlc_data_main.payment_type_dim` pay
  ON f.payment_type_id = pay.payment_type_id;
