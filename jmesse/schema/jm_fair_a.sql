create table jmesse.jm_fair_a( 
  q_id int (5) not null
  , a_id int (3) not null
  , a_jp varchar (500) not null
  , a_en varchar (500) not null
  , regist_user_id int
  , regist_date datetime
  , update_user_id int
  , update_date datetime
  , primary key (q_id, a_id)
) engine = innodb
