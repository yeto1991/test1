create table jmesse.jm_fair(
  user_id varchar (16) not null
  , date_of_application datetime not null
  , date_of_registration datetime not null
  , fair_title_jp varchar (255) not null
  , fair_title_en varchar (255)
  , abbrev_title varchar (100)
  , fair_url varchar (255)
  , mihon_no int not null auto_increment
  , profile_jp varchar (200)
  , profile_en varchar (200)
  , detailed_information_jp text(800)
  , detailed_information_en text(800)
  , date_from_yyyy varchar (4) not null
  , date_from_mm varchar (2) not null
  , date_from_dd varchar (2) not null
  , date_to_yyyy varchar (4) not null
  , date_to_mm varchar (2) not null
  , date_to_dd varchar (2) not null
  , frequency varchar (3) not null
  , main_industory_1 varchar (3) not null
  , sub_industory_1 varchar (3) not null
  , main_industory_2 varchar (3)
  , sub_industory_2 varchar (3)
  , main_industory_3 varchar (3)
  , sub_industory_3 varchar (3)
  , main_industory_4 varchar (3)
  , sub_industory_4 varchar (3)
  , main_industory_5 varchar (3)
  , sub_industory_5 varchar (3)
  , main_industory_6 varchar (3)
  , sub_industory_6 varchar (3)
  , exhibits_jp text(300) not null
  , exhibits_en text(300) not null
  , region varchar (3) not null
  , country varchar (3) not null
  , city varchar (3) not null
  , other_city_jp varchar (100) not null
  , other_city_en varchar (100) not null
  , venue_jp varchar (255) not null
  , venue_en varchar (255) not null
  , venue_url varchar (255)
  , gross_floor_area int (10)
  , transportation_jp varchar (255)
  , transportation_en varchar (255)
  , open_to varchar (3) not null
  , admission_ticket_1 char (1)
  , admission_ticket_2 char (1)
  , admission_ticket_3 char (1)
  , admission_ticket_4 char (1)
  , other_admission_ticket_jp varchar (100)
  , other_admission_ticket_en varchar (100)
  , year_of_the_trade_fair varchar (4)
  , total_number_of_visitor int (10)
  , number_of_foreign_visitor int (10)
  , total_number_of_exhibitors int (10)
  , number_of_foreign_exhibitors int (10)
  , net_square_meters int (10)
  , spare_field1 varchar (255)
  , app_dead_yyyy varchar (4)
  , app_dead_mm varchar (2)
  , app_dead_dd varchar (2)
  , organizer_jp varchar (255) not null
  , organizer_en varchar (255) not null
  , organizer_tel varchar (20) not null
  , organizer_fax varchar (20) not null
  , organizer_email varchar (255) not null
  , organizer_addr varchar (255) not null
  , organizer_div varchar (255) not null
  , organizer_pers varchar (100) not null
  , agency_in_japan_jp varchar (255)
  , agency_in_japan_en varchar (255)
  , agency_in_japan_tel varchar (20)
  , agency_in_japan_fax varchar (20)
  , agency_in_japan_email varchar (255)
  , agency_in_japan_addr varchar (255)
  , agency_in_japan_div varchar (255)
  , agency_in_japan_pers varchar (100)
  , photos_1 varchar (255)
  , photos_2 varchar (255)
  , photos_3 varchar (255)
  , select_language_info char (1) not null
  , report_link varchar (255)
  , venue_link varchar (255)
  , keyword varchar (100)
  , jetro_suport varchar (100)
  , jetro_suport_url varchar (255)
  , use_language_flag char (1)
  , web_display_type char (1)
  , regist_type char (1)
  , note_for_system_manager text(400)
  , note_for_data_manager text(400)
  , confirm_flag char (1)
  , negate_comment varchar (400)
  , mail_send_flag char (1)
  , del_flg char (1)
  , del_date datetime
  , regist_user_id varchar (16) not null
  , regist_date datetime not null
  , update_user_id varchar (16)
  , update_date datetime
  , primary key (mihon_no)
  , index (user_id, date_of_application)
) engine = innodb

