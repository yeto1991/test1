@echo off
mysql -ujmesse -pidsjmesse -h192.168.0.229 jmesse < summaryCountForFairCntTable.sql
mysql -ujmesse -pidsjmesse -h192.168.0.229 jmesse < summaryCountForFairDetailCntTable.sql
php -f getJsonIndustory.php
php -f getJsonMonthlyRanking.php
php -f getJsonNewMihonichi.php
php -f getJsonJeccMihonichi.php
php -f getJsonRegion.php
