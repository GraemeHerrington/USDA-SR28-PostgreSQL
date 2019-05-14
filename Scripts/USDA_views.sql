/**

USDA_views.sql Graeme Herrington, May 2019.

Examples to show how to access the individual tables
The final view on Lysine gives an idea of how to track a specific nutrient.

Run either as queries, or install as views against the completed database.
**/


--Create a view to provide basic food stats by metric

CREATE OR REPLACE VIEW vwfdgrpstats AS 
 SELECT g.fddrp_desc AS item_name, g.fddrp_desc AS food_group, 
 nutr_def.nutrdesc AS metric, round(avg(nut_data.nutr_val)::numeric, 3) AS avgnutritionalvalue, 
 nutr_def.units
   FROM food_des f
   JOIN fd_group g ON f.fdgrp_cd = g.fdgrp_cd
   JOIN nut_data ON nut_data.ndb_no = f.ndb_no
   JOIN nutr_def ON nutr_def.nutr_no = nut_data.nutr_no
   WHERE nutr_def.nutrdesc NOT LIKE '%:%'
  GROUP BY g.fddrp_desc, nutr_def.nutrdesc, nutr_def.units;

--Create view to get average stats about food groups by unit and metric

CREATE OR REPLACE VIEW vwfoodstats AS 
 SELECT initcap(f.shrt_desc) AS item_name, f.shrt_desc AS food_name, 
 g.fddrp_desc AS food_group, nutr_def.nutrdesc AS metric, 
 round(avg(nut_data.nutr_val::numeric), 3) AS avgnutritionalvalue, 
 nutr_def.units
   FROM food_des f
   JOIN nut_data ON nut_data.ndb_no = f.ndb_no
   JOIN nutr_def ON nutr_def.nutr_no = nut_data.nutr_no
   JOIN fd_group g ON f.fdgrp_cd = g.fdgrp_cd
     WHERE nutr_def.nutrdesc NOT LIKE '%:%'
  GROUP BY f.shrt_desc, g.fddrp_desc, nutr_def.nutrdesc, nutr_def.units;

--Pull up Lysine alone

CREATE VIEW AS
 SELECT initcap(f.shrt_desc) AS item_name, f.shrt_desc AS food_name, g.fddrp_desc AS food_group, nutr_def.nutrdesc AS metric, round(avg(nut_data.nutr_val::numeric), 3) AS avgnutritionalvalue, nutr_def.units
   FROM food_des f
   JOIN nut_data ON nut_data.ndb_no = f.ndb_no
   JOIN nutr_def ON nutr_def.nutr_no = nut_data.nutr_no
   JOIN fd_group g ON f.fdgrp_cd = g.fdgrp_cd
  WHERE nutr_def.nutrdesc !~~ '%:%'::text
	and nutr_def.nutrdesc like '%Lysine%'
	GROUP BY f.shrt_desc, g.fddrp_desc, nutr_def.nutrdesc, nutr_def.units;
