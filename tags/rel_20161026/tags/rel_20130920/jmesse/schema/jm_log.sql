create table jmesse.jm_log(
  log_id int not null auto_increment
  , user_id int not null
  , ope_kbn char (1) not null
  , info_kbn char (1) not null
  , remarks text
  , reg_date datetime
  , primary key (log_id)
) engine = innodb
