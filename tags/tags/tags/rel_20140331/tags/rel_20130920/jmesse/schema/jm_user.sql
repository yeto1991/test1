create table jmesse.jm_user(
  user_id int not null auto_increment
  , password varchar (8) not null
  , company_nm text not null
  , division_dept_nm varchar (255)
  , user_nm varchar (100) not null
  , gender_cd char (1) not null
  , email varchar (255) not null unique
  , post_code varchar (20)
  , address varchar (255) not null
  , tel varchar (100) not null
  , fax varchar (100)
  , url varchar (255)
  , use_language_cd char (1)
  , regist_result_notice_cd char (1)
  , auth_gen char (1)
  , auth_user char (1)
  , auth_fair char (1)
  , idpass_notice_cd char (1)
  , del_flg char (1)
  , del_date datetime
  , regist_user_id int
  , regist_date datetime
  , update_user_id int
  , update_date datetime
  , primary key (user_id)
) engine = innodb
