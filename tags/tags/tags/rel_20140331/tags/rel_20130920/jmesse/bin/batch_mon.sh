#!/bin/bash

# SHELL変数
PHP_HOME=/usr/local/php
JMESSE_HOME=/home/jmesse1112/app/jmesse

# Batch開始時刻
echo ▼▼▼ [`date`]【開始】バッチ

# 月間アクセスランキング情報生成バッチ
echo ▼▼▼ [`date`]【開始】月間アクセスランキング情報生成バッチ
$PHP_HOME/bin/php -f $JMESSE_HOME/bin/getJsonMonthlyRanking.php
echo $?
echo ▲▲▲ [`date`]【終了】月間アクセスランキング情報生成バッチ

# Batch終了時刻
echo ▲▲▲ [`date`]【終了】バッチ

# EOF
