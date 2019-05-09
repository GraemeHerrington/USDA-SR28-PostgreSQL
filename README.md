# USDA-SR28-PostgreSQL

Support for the legacy USDA food nutrients database. Final version SR28

This holds pretty much everything from the final version, under the current system, of the USDA Food Nutrients database held (previously...) at https://www.ars.usda.gov/northeast-area/beltsville-md-bhnrc/beltsville-human-nutrition-research-center/nutrient-data-laboratory/docs/sr28-download-files/

There are several support files. A comprehensive set of scripts, tuned to Postgres, to load up the database and do some basic interrogations. It also holds a set of reports which were removed from the online offering some time ago. They are derived from SR 18 which is the revision still accessible on pgfoundry (). For many people these reports which might otherwise lost, will be the best way of accessing the data because basic food items don't get revised that much compared to commercial items. Basically, broccoli just doesn't evolve that quickly!

The database in its various versions forms the backend of several commercial nutrition advice websites. Those who want the latest versions will find that they don't change structurally from one version to the next. For those new to it, there are SQL scripts which will create database objects; a database command which deals with the 'metric' issue of micro- versus mille- grams; and a suite of shell commands to load the data.

The platform addressed here is PostgreSQL on Linux. You may learn something by searching for similar offerings for sqlite, oracle, mysql and so on, but I have tried to be comprehensive. In particular, I have tried to be more careful about datatypes than I have seen in some other repos.
