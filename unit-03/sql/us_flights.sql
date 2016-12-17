--SQL querying us_flights and flight_revenue datasets on Mode Analytics
--Access Mode Analytics goto https://modeanalytics.com to access the dataset and SQL editor
select
  f.unique_carrier,
  f.dest,
  sum(fr.cargo_rev) as total_cargo_rev,
  sum(fr.first_class_rev) as total_1st_class_rev,
  sum(fr.business_class_rev) as total_biz_class_rev,
  sum(fr.coach_rev) as total_coach_rev
from
  tutorial.us_flights as f
  join tutorial.flight_revenue as fr
    on f.dest = fr.destination_airport
where
  f.actual_elapsed_time >= 138
group by
  f.unique_carrier,
  f.dest
order by
  f.unique_carrier,
  total_cargo_rev desc,
  total_coach_rev desc,
  f.dest
limit 120;
