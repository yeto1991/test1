create table jmesse.jm_code_m( 
  kbn_1 varchar (3) not null
  , kbn_2 varchar (3) not null
  , kbn_3 varchar (3) not null
  , kbn_4 varchar (3) not null
  , discription_jp varchar (255)
  , discription_en varchar (255)
  , disp_cd varchar (10)
  , disp_num int (5)
  , reserve_1 varchar (10)
  , reserve_2 varchar (10)
  , reserve_3 varchar (10)
  , reserve_4 varchar (255)
  , reserve_5 varchar (255)
  , reserve_6 varchar (255)
  , primary key (kbn_1, kbn_2, kbn_3, kbn_4)
) engine = innodb
