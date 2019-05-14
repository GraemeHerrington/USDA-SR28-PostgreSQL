/**

USDA_Comments.sql Graeme Herrington, May 2019.

Taken from the descriptions provided in sr28_doc.pdf
The comments describe the contents of individual columns in the Nutritional databases tables.
Alphabetically ordered; Can be applied at any time. Ought to run as a single script.

**/

-- data_src

COMMENT ON TABLE data_src IS 'Provides a citation to the DataSrc_ID in the Sources of Data Link table.';
COMMENT ON COLUMN data_src.datasrc_id IS 'Unique ID identifying the reference/source.';
COMMENT ON COLUMN data_src.authors IS 'List of authors for a journal article or name of sponsoring organization for other documents.';
COMMENT ON COLUMN data_src.title IS 'Title of article or name of document, such as a report from a company or trade association.';
COMMENT ON COLUMN data_src.year IS 'Year article or document was published.';
COMMENT ON COLUMN data_src.journal IS 'Name of the journal in which the article was published.';
COMMENT ON COLUMN data_src.vol_city IS 'Volume number for journal articles, books, or reports; city where sponsoring organization is located.';
COMMENT ON COLUMN data_src.issue_state IS 'Issue number for journal article; State where the sponsoring organization is located.';
COMMENT ON COLUMN data_src.start_page IS 'Starting page number of article/document.';
COMMENT ON COLUMN data_src.end_page IS 'Ending page number of article/document.';

-- datsrcln

COMMENT ON TABLE datsrcln IS 'Used to link the Nutrient Data table with the Sources of Data table. It is needed to resolve the many-to-many relationship between the two tables.';
COMMENT ON COLUMN datsrcln.ndb_no IS '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
COMMENT ON COLUMN datsrcln.nutr_no IS 'Unique 3-digit identifier code for a nutrient.';
COMMENT ON COLUMN datsrcln.datasrc_id IS 'Unique ID identifying the reference/source.';

-- deriv_cd

COMMENT ON TABLE deriv_cd IS 'Provides information on how the nutrient values were determined. The table contains the derivation codes and their descriptions.';
COMMENT ON COLUMN deriv_cd.deriv_cd IS 'Derivation Code.';
COMMENT ON COLUMN derivcd_cd.deriv_desc IS 'Description of derivation code giving specific information on how the value was determined.';

-- fd_group

COMMENT ON TABLE fd_group IS 'A support file to the Food Description table and contains a list of food groups used in SR28 and their descriptions.';
COMMENT ON COLUMN fd_group.fdgrp_cd IS '4-digit code identifying a food group. Only the first 2 digits are currently assigned. In the future, the last 2 digits may be used. Codes may not be consecutive.';
COMMENT ON COLUMN fd_group.fdgrp_desc IS 'Name of food group.';

-- food_des

COMMENT ON TABLE food_des IS 'Contains long and short descriptions and food group designators for all food items, along with common names, manufacturer name, scientific name, percentage and description of refuse, and factors used for calculating protein and kilocalories, if applicable. Items used in the FNDDS are also identified by value of "Y" in the Survey field.';
COMMENT ON COLUMN food_des.ndb_no IS '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
COMMENT ON COLUMN food_des.fdgrp_cd IS '4-digit code indicating food group to which a food item belongs.';
COMMENT ON COLUMN food_des.long_desc IS '200-character description of food item.';
COMMENT ON COLUMN food_des.shrt_desc IS '60-character abbreviated description of food item. Generated from the 200-character description using abbreviations in Appendix A. If short description is longer than 60 characters, additional abbreviations are made.';
COMMENT ON COLUMN food_des.comname IS 'Other names commonly used to describe a food, including local or regional names for various foods, for example, "soda" or "pop" for "carbonated beverages".';
COMMENT ON COLUMN food_des.manufacname IS 'Indicates the company that manufactured the product, when appropriate.';
COMMENT ON COLUMN food_des.survey IS 'Indicates if the food item is used in the USDA Food and Nutrient Database for Dietary Studies (FNDDS) and thus has a complete nutrient profile for the 65 FNDDS nutrients.';
COMMENT ON COLUMN food_des.ref_desc IS 'Description of inedible parts of a food item (refuse), such as seeds or bone.';
COMMENT ON COLUMN food_des.refuse IS 'Percentage of refuse.';
COMMENT ON COLUMN food_des.sciname IS 'Scientific name of the food item. Given for the least processed form of the food (usually raw), if applicable.';
COMMENT ON COLUMN food_des.n_factor IS 'Factor for converting nitrogen to protein.';
COMMENT ON COLUMN food_des.pro_factor IS 'Factor for calculating calories from protein.';
COMMENT ON COLUMN food_des.fat_factor IS 'Factor for calculating calories from fat.';
COMMENT ON COLUMN food_des.cho_factor IS 'Factor for calculating calories from carbohydrate.';

-- footnote

COMMENT ON TABLE footnote IS 'Contains additional information about the food item, household weight, and nutrient value.';
COMMENT ON COLUMN footnote.ndb_no IS '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
COMMENT ON COLUMN footnote.footnt_no IS 'Sequence number. If a given footnote applies to more than one nutrient number, the same footnote number is used. As a result, this table cannot be indexed and there is no primary key.';
COMMENT ON COLUMN footnote.footnt_typ IS 'Type of footnote:
D = footnote adding information to the food description;
M = footnote adding information to measure description;
N = footnote providing additional information on a nutrient value.
If the Footnt_typ = N, the Nutr_No will also be filled in.';
COMMENT ON COLUMN footnote.nutr_no IS 'Unique 3-digit identifier code for a nutrient to which footnote applies.';
COMMENT ON COLUMN footnote.footnt_txt IS 'Footnote text.';

-- nut_data

COMMENT ON TABLE nut_data IS 'Contains the nutrient values and information about the values, including expanded statistical information.';
COMMENT ON COLUMN nut_data.ndb_no IS '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
COMMENT ON COLUMN nut_data.nutr_no IS 'Unique 3-digit identifier code for a nutrient.';
COMMENT ON COLUMN nut_data.nutr_val IS 'Amount in 100 grams, edible portion.';
COMMENT ON COLUMN nut_data.num_data_pts IS 'Number of data points is the number of analyses used to calculate the nutrient value. If the number of data points is 0, the value was calculated or imputed.';
COMMENT ON COLUMN nut_data.std_error IS 'Standard error of the mean. Null if cannot be calculated. The standard error is also not given if the number of data points is less than three.';
COMMENT ON COLUMN nut_data.src_cd IS 'Code indicating type of data.';
COMMENT ON COLUMN nut_data.deriv_cd IS 'Data Derivation Code giving specific information on how the value is determined. This field is populated only for items added or updated starting with SR14. This field may not be populated if older records were used in the calculation of the mean value.';
COMMENT ON COLUMN nut_data.ref_ndb_no IS 'NDB number of the item used to calculate a missing value. Populated only for items added or updated starting with SR14.';
COMMENT ON COLUMN nut_data.add_nutr_mark IS 'Indicates a vitamin or mineral added for fortification or enrichment. This field is populated for ready-to-eat breakfast cereals and many brand-name hot cereals in food group 08.';
COMMENT ON COLUMN nut_data.num_studies IS 'Number of studies.';
COMMENT ON COLUMN nut_data.min IS 'Minimum value.';
COMMENT ON COLUMN nut_data.max IS 'Maximum value.';
COMMENT ON COLUMN nut_data.df IS 'Degrees of freedom.';
COMMENT ON COLUMN nut_data.low_eb IS 'Lower 95% error bound.';
COMMENT ON COLUMN nut_data.up_eb IS 'Upper 95% error bound.';
COMMENT ON COLUMN nut_data.stat_cmt IS 'Statistical comments. See definitions below.';
COMMENT ON COLUMN nut_data.addmod_date IS 'Indicates when a value was either added to the database or last modified.';
COMMENT ON COLUMN nut_data.cc IS 'Confidence Code indicating data quality, based on evaluation of sample plan, sample handling, analytical method, analytical quality control, and number of samples analyzed. Not included in this release, but is planned for future releases.';

-- nutr_def 

COMMENT ON TABLE nutr_def IS 'A support table to the Nutrient Data table. It provides the 3-digit nutrient code, unit of measure, INFOODS tagname, and description.';
COMMENT ON COLUMN nutr_def.nutr_no IS 'Unique 3-digit identifier code for a nutrient.';
COMMENT ON COLUMN nutr_def.units IS 'Units of measure.';
COMMENT ON COLUMN nutr_def.tagname IS 'International Network of Food Data Systems (INFOODS) Tagnames.';
COMMENT ON COLUMN nutr_def.nutrdesc IS 'Name of nutrient/food component.';
COMMENT ON COLUMN nutr_def.num_dec IS 'Number of decimal places to which a nutrient value is rounded.';
COMMENT ON COLUMN nutr_def.sr_order IS 'Used to sort nutrient records in the same order as various reports produced from SR.';

-- src_cd

COMMENT ON TABLE src_cd IS 'Contains codes indicating the type of data (analytical, calculated, assumed zero, and so on) in the Nutrient Data table. To improve the usability of the database and to provide values for the FNDDS, NDL staff imputed nutrient values for a number of proximate components, total dietary fiber, total sugar, and vitamin and mineral values.';
COMMENT ON COLUMN src_cd.src_cd IS 'A 2-digit code indicating type of data.';
COMMENT ON COLUMN src_cd.srccd_desc IS 'Description of source code that identifies the type of nutrient data.';

-- weight

COMMENT ON TABLE weight IS 'Contains the weight in grams of a number of common measures for each food item.';
COMMENT ON COLUMN weight.ndb_no IS '5-digit Nutrient Databank number that uniquely identifies a food item. If this field is defined as numeric, the leading zero will be lost.';
COMMENT ON COLUMN weight.seq IS 'Sequence number.';
COMMENT ON COLUMN weight.amount IS 'Unit modifier (for example, 1 in "1 cup").';
COMMENT ON COLUMN weight.msre_desc IS 'Description (for example, cup, diced, and 1-inch pieces).';
COMMENT ON COLUMN weight.gm_wgt IS 'Gram weight.';
COMMENT ON COLUMN weight.num_data_pts IS 'Number of data points.';
COMMENT ON COLUMN weight.std_dev IS 'Standard deviation.';


