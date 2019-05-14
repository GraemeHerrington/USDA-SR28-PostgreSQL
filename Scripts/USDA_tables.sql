/**

USDA_tables.sql Graeme Herrington, May 2019.

Derived from the descriptions provided in sr28_doc.pdf

Should run as one script.

**/

--
-- USDA Nutrition Database SR28
--
BEGIN;

--
-- Name: data_src; Type: TABLE;
--

CREATE TABLE data_src (
    datasrc_id character(6) NOT NULL,
    authors text,
    title text NOT NULL,
    "year" integer,
    journal text,
    vol_city text,
    issue_state text,
    start_page text,
    end_page text
);


--
-- Name: datsrcln; Type: TABLE
--

CREATE TABLE datsrcln (
    ndb_no character(5) NOT NULL,
    nutr_no character(3) NOT NULL,
    datasrc_id character(6) NOT NULL
);


--
-- Name: deriv_cd; Type: TABLE
--

CREATE TABLE deriv_cd (
    deriv_cd text NOT NULL,
    derivcd_desc text NOT NULL
);


--
-- Name: fd_group; Type: TABLE
--

CREATE TABLE fd_group (
    fdgrp_cd character(4) NOT NULL,
    fdgrp_desc text NOT NULL
);


--
-- Name: food_des; Type: TABLE
--

CREATE TABLE food_des (
    ndb_no character(5) NOT NULL,
    fdgrp_cd character(4) NOT NULL,
    long_desc text NOT NULL,
    shrt_desc text NOT NULL,
    comname text,
    manufacname text,
    survey character(1),
    ref_desc text,
    refuse integer,
    sciname text,
    n_factor double precision,
    pro_factor double precision,
    fat_factor double precision,
    cho_factor double precision
);


--
-- Name: footnote; Type: TABLE
--

CREATE TABLE footnote (
    ndb_no character(5) NOT NULL,
    footnt_no character(4) NOT NULL,
    footnt_typ character(1) NOT NULL,
    nutr_no character(3),
    footnt_txt text NOT NULL
);


--
-- Name: nut_data; Type: TABLE
--

CREATE TABLE nut_data (
    ndb_no character(5) NOT NULL,
    nutr_no character(3) NOT NULL,
    nutr_val double precision NOT NULL,
    num_data_pts double precision NOT NULL,
    std_error double precision,
    src_cd integer NOT NULL,
    deriv_cd text,
    ref_ndb_no character(5),
    add_nutr_mark character(1),
    num_studies integer,
    min double precision,
    max double precision,
    df integer,
    low_eb double precision,
    up_eb double precision,
    stat_cmt text,
    addmod_date text,
    cc character(1)
);


--
-- Name: nutr_def; Type: TABLE 
--

CREATE TABLE nutr_def (
    nutr_no character(3) NOT NULL,
    units text NOT NULL,
    tagname text,
    nutrdesc text,
    num_dec smallint,
    sr_order integer
);


--
-- Name: src_cd; Type: TABLE
--

CREATE TABLE src_cd (
    src_cd integer NOT NULL,
    srccd_desc text NOT NULL
);


--
-- Name: weight; Type: TABLE
--

CREATE TABLE weight (
    ndb_no character(5) NOT NULL,
    seq character(2) NOT NULL,
    amount double precision NOT NULL,
    msre_desc text NOT NULL,
    gm_wgt double precision NOT NULL,
    num_data_pts integer,
    std_dev double precision
);

COMMIT;
