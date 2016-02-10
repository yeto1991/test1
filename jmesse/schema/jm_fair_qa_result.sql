create table jmesse.jm_fair_qa_result( 
  q_id int (5) not null
  , a_id int (3) not null
  , a_cnt_jp int (10) not null
  , a_cnt_en int (10) not null
  , primary key (q_id, a_id)
) engine = innodb
