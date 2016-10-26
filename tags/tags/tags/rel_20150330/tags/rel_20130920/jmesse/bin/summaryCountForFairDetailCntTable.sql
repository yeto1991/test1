truncate table jm_fair_detail_cnt; 

insert 
into jm_fair_detail_cnt( 
  select
    main_industory i_kbn_2
    , '000' i_kbn_3
    , '000' i_kbn_4
    , region v_kbn_2
    , '000' v_kbn_3
    , '000' v_kbn_4
    , site_kbn
    , count(*) fair_cnt 
  from
    ( 
      ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      )
    ) mr 
  group by
    main_industory
    , region
    , site_kbn
) 
union ( 
  select
    main_industory i_kbn_2
    , '000' i_kbn_3
    , '000' i_kbn_4
    , region v_kbn_2
    , country v_kbn_3
    , '000' v_kbn_4
    , site_kbn
    , count(*) fair_cnt 
  from
    ( 
      ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and country is not null 
          and country <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      )
    ) mo 
  group by
    main_industory
    , region
    , country
    , site_kbn
) 
union ( 
  select
    main_industory i_kbn_2
    , '000' i_kbn_3
    , '000' i_kbn_4
    , region v_kbn_2
    , country v_kbn_3
    , city v_kbn_4
    , site_kbn
    , count(*) fair_cnt 
  from
    ( 
      ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and city is not null 
          and city <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      )
    ) mi 
  group by
    main_industory
    , region
    , country
    , city
    , site_kbn
) 
union ( 
  select
    main_industory i_kbn_2
    , sub_industory i_kbn_3
    , '000' i_kbn_4
    , region v_kbn_2
    , '000' v_kbn_3
    , '000' v_kbn_4
    , site_kbn
    , count(*) fair_cnt 
  from
    ( 
      ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , sub_industory_1 sub_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and sub_industory_1 is not null 
          and sub_industory_1 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , sub_industory_2 sub_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and sub_industory_2 is not null 
          and sub_industory_2 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , sub_industory_3 sub_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and sub_industory_3 is not null 
          and sub_industory_3 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , sub_industory_4 sub_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and sub_industory_4 is not null 
          and sub_industory_4 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , sub_industory_5 sub_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and sub_industory_5 is not null 
          and sub_industory_5 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , sub_industory_6 sub_industory
          , region
          , country
          , city
          , '0' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and sub_industory_6 is not null 
          and sub_industory_6 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('0', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_1 main_industory
          , sub_industory_1 sub_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_1 is not null 
          and main_industory_1 <> '' 
          and sub_industory_1 is not null 
          and sub_industory_1 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_2 main_industory
          , sub_industory_2 sub_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_2 is not null 
          and main_industory_2 <> '' 
          and sub_industory_2 is not null 
          and sub_industory_2 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_3 main_industory
          , sub_industory_3 sub_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_3 is not null 
          and main_industory_3 <> '' 
          and sub_industory_3 is not null 
          and sub_industory_3 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_4 main_industory
          , sub_industory_4 sub_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_4 is not null 
          and main_industory_4 <> '' 
          and sub_industory_4 is not null 
          and sub_industory_4 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_5 main_industory
          , sub_industory_5 sub_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_5 is not null 
          and main_industory_5 <> '' 
          and sub_industory_5 is not null 
          and sub_industory_5 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      ) 
      union ( 
        select
          mihon_no
          , main_industory_6 main_industory
          , sub_industory_6 sub_industory
          , region
          , country
          , city
          , '1' site_kbn 
        from
          jm_fair 
        where
          del_flg = '0' 
          and main_industory_6 is not null 
          and main_industory_6 <> '' 
          and sub_industory_6 is not null 
          and sub_industory_6 <> '' 
          and region is not null 
          and region <> '' 
          and confirm_flag = '1' 
          and web_display_type = '1' 
          and select_language_info in ('1', '2') 
          and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate()
      )
    ) sr 
  group by
    main_industory
    , sub_industory
    , region
    , site_kbn
); 

