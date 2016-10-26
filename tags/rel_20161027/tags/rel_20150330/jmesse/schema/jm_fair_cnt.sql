create table jmesse.jm_fair_cnt(
  kbn_1 varchar (3) not null
  , kbn_2 varchar (3) not null
  , kbn_3 varchar (3) not null
  , kbn_4 varchar (3) not null
  , venue_kbn char (1) not null
  , site_kbn char (1) not null
  , fair_cnt int not null
  , primary key (kbn_1, kbn_2, kbn_3, kbn_4, venue_kbn, site_kbn)
) engine = innodb
