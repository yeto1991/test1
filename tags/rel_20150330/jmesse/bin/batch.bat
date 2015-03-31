@echo off
mysql -ujmesse -pidsjmesse -h172.16.20.80 jmesse < summaryCountForFairCntTable.sql
mysql -ujmesse -pidsjmesse -h172.16.20.80 jmesse < summaryCountForFairDetailCntTable.sql
php -f getJsonIndustory.php
php -f getJsonMonthlyRanking.php
php -f getJsonNewMihonichi.php
php -f getJsonJeccMihonichi.php
php -f getJsonRegion.php
