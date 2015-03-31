create table jmesse.tmp_user_id( 
  old_user_id varchar (64) not null
  , user_id int not null
  , use_language_cd char(1) not null
  , primary key (old_user_id)
) engine = innodb


