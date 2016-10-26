create table jmesse.jm_err_mail(
  yyyymmdd varchar (8) not null
  , email varchar (255) not null
  , err_kind char (1) not null
  , mail_contents text
  , index (yyyymmdd, email, err_kind)
) engine = innodb

