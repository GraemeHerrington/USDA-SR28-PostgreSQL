/**

USDA_ConstraintsAndIndexes.sql Graeme Herrington, May 2019.

Taken from the descriptions provided in sr28_doc.pdf

**/

﻿--
-- Name: data_src_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY data_src
    ADD CONSTRAINT data_src_pkey PRIMARY KEY (datasrc_id);


--
-- Name: datsrcln_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY datsrcln
    ADD CONSTRAINT datsrcln_pkey PRIMARY KEY (ndb_no, nutr_no, datasrc_id);


--
-- Name: deriv_cd_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY deriv_cd
    ADD CONSTRAINT deriv_cd_pkey PRIMARY KEY (deriv_cd);


--
-- Name: fd_group_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY fd_group
    ADD CONSTRAINT fd_group_pkey PRIMARY KEY (fdgrp_cd);


--
-- Name: food_des_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY food_des
    ADD CONSTRAINT food_des_pkey PRIMARY KEY (ndb_no);


--
-- Name: nut_data_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY nut_data
    ADD CONSTRAINT nut_data_pkey PRIMARY KEY (ndb_no, nutr_no);


--
-- Name: nutr_def_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY nutr_def
    ADD CONSTRAINT nutr_def_pkey PRIMARY KEY (nutr_no);


--
-- Name: src_cd_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY src_cd
    ADD CONSTRAINT src_cd_pkey PRIMARY KEY (src_cd);


--
-- Name: weight_pkey; Type: CONSTRAINT;
--

ALTER TABLE ONLY weight
    ADD CONSTRAINT weight_pkey PRIMARY KEY (ndb_no, seq);


--
-- Name: datsrcln_datasrc_id_idx; Type: INDEX;
--

CREATE INDEX datsrcln_datasrc_id_idx ON datsrcln USING btree (datasrc_id);


--
-- Name: food_des_fdgrp_cd_idx; Type: INDEX;
--

CREATE INDEX food_des_fdgrp_cd_idx ON food_des USING btree (fdgrp_cd);


--
-- Name: footnote_ndb_no_idx; Type: INDEX
--

CREATE INDEX footnote_ndb_no_idx ON footnote USING btree (ndb_no, nutr_no);


--
-- Name: nut_data_deriv_cd_idx; Type: INDEX 
--

CREATE INDEX nut_data_deriv_cd_idx ON nut_data USING btree (deriv_cd);


--
-- Name: nut_data_nutr_no_idx; Type: INDEX;
--

CREATE INDEX nut_data_nutr_no_idx ON nut_data USING btree (nutr_no);


--
-- Name: nut_data_src_cd_idx; Type: INDEX;
--

CREATE INDEX nut_data_src_cd_idx ON nut_data USING btree (src_cd);


--
-- Name: datsrcln_datasrc_id_fkey; Type: FK CONSTRAINT;-
--

ALTER TABLE ONLY datsrcln
    ADD CONSTRAINT datsrcln_datasrc_id_fkey FOREIGN KEY (datasrc_id) REFERENCES data_src(datasrc_id);


--
-- Name: datsrcln_ndb_no_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY datsrcln
    ADD CONSTRAINT datsrcln_ndb_no_fkey FOREIGN KEY (ndb_no, nutr_no) REFERENCES nut_data(ndb_no, nutr_no);


--
-- Name: food_des_fdgrp_cd_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY food_des
    ADD CONSTRAINT food_des_fdgrp_cd_fkey FOREIGN KEY (fdgrp_cd) REFERENCES fd_group(fdgrp_cd);


--
-- Name: footnote_ndb_no_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY footnote
    ADD CONSTRAINT footnote_ndb_no_fkey FOREIGN KEY (ndb_no) REFERENCES food_des(ndb_no);

### broken from here?
--
-- Name: footnote_nutr_no_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY footnote
    ADD CONSTRAINT footnote_nutr_no_fkey FOREIGN KEY (nutr_no) REFERENCES nutr_def(nutr_no);


--
-- Name: nut_data_deriv_cd_fkey; Type: FK CONSTRAINT; 
--

ALTER TABLE ONLY nut_data
    ADD CONSTRAINT nut_data_deriv_cd_fkey FOREIGN KEY (deriv_cd) REFERENCES deriv_cd(deriv_cd);

## to here
--
-- Name: nut_data_ndb_no_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY nut_data
    ADD CONSTRAINT nut_data_ndb_no_fkey FOREIGN KEY (ndb_no) REFERENCES food_des(ndb_no);


--
-- Name: nut_data_nutr_no_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY nut_data
    ADD CONSTRAINT nut_data_nutr_no_fkey FOREIGN KEY (nutr_no) REFERENCES nutr_def(nutr_no);


--
-- Name: nut_data_src_cd_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY nut_data
    ADD CONSTRAINT nut_data_src_cd_fkey FOREIGN KEY (src_cd) REFERENCES src_cd(src_cd);


--
-- Name: weight_ndb_no_fkey; Type: FK CONSTRAINT;
--

ALTER TABLE ONLY weight
    ADD CONSTRAINT weight_ndb_no_fkey FOREIGN KEY (ndb_no) REFERENCES food_des(ndb_no);
