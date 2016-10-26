create table jmesse.jm_fair_q( 
  q_id int (5) not null
  , q_jp varchar (500) not null
  , q_en varchar (500) not null
  , start_date datetime not null
  , finish_date datetime not null
  , regist_user_id int
  , regist_date datetime
  , update_user_id int
  , update_date datetime
  , primary key (q_id)
) engine = innodb
