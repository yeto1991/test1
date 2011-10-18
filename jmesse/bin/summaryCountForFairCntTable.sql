TRUNCATE TABLE  jm_fair_cnt;
insert into jm_fair_cnt(kbn_1, kbn_2, kbn_3, kbn_4, venue_kbn, fair_cnt)
select rap.kbn_1,rap.kbn_2,rap.kbn_3,rap.kbn_4,rap.venue_kbn,sum(fair_cnt) from (
select '003' as kbn_1,region as kbn_2,'000' as kbn_3,'000' as kbn_4,(case when region = '009' and country = '002' then '0' else '1' end) as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() group by region
 union all
select '003' as kbn_1,region as kbn_2,country as kbn_3,'000' as kbn_4,(case when region = '009' and country = '002' then '0' else '1' end) as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() group by region,country
 union all
select '003' as kbn_1,region as kbn_2,country as kbn_3,city as kbn_4,(case when region = '009' and country = '002' then '0' else '1' end) as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() group by region,country,city
 union all
select '002' as kbn_1, MAIN_INDUSTORY_1 as kbn_2, '000' as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' group by MAIN_INDUSTORY_1
 union all
select '002' as kbn_1, MAIN_INDUSTORY_1 as kbn_2, '000' as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' group by MAIN_INDUSTORY_1
 union all
select '002' as kbn_1, MAIN_INDUSTORY_2 as kbn_2, '000' as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_2 <> '' and MAIN_INDUSTORY_2 is not NULL group by MAIN_INDUSTORY_2
 union all
select '002' as kbn_1, MAIN_INDUSTORY_2 as kbn_2, '000' as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_2 <> '' and MAIN_INDUSTORY_2 is not NULL group by MAIN_INDUSTORY_2
 union all
select '002' as kbn_1, MAIN_INDUSTORY_3 as kbn_2, '000' as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_3 <> '' and MAIN_INDUSTORY_3 is not NULL group by MAIN_INDUSTORY_3
 union all
select '002' as kbn_1, MAIN_INDUSTORY_3 as kbn_2, '000' as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_3 <> '' and MAIN_INDUSTORY_3 is not NULL group by MAIN_INDUSTORY_3
 union all
select '002' as kbn_1, MAIN_INDUSTORY_4 as kbn_2, '000' as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_4 <> '' and MAIN_INDUSTORY_4 is not NULL group by MAIN_INDUSTORY_4
 union all
select '002' as kbn_1, MAIN_INDUSTORY_4 as kbn_2, '000' as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_4 <> '' and MAIN_INDUSTORY_4 is not NULL group by MAIN_INDUSTORY_4
 union all
select '002' as kbn_1, MAIN_INDUSTORY_5 as kbn_2, '000' as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_5 <> '' and MAIN_INDUSTORY_5 is not NULL group by MAIN_INDUSTORY_5
 union all
select '002' as kbn_1, MAIN_INDUSTORY_5 as kbn_2, '000' as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_5 <> '' and MAIN_INDUSTORY_5 is not NULL group by MAIN_INDUSTORY_5
 union all
select '002' as kbn_1, MAIN_INDUSTORY_6 as kbn_2, '000' as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_6 <> '' and MAIN_INDUSTORY_6 is not NULL group by MAIN_INDUSTORY_6
 union all
select '002' as kbn_1, MAIN_INDUSTORY_6 as kbn_2, '000' as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_6 <> '' and MAIN_INDUSTORY_6 is not NULL group by MAIN_INDUSTORY_6
 union all
select '002' as kbn_1, MAIN_INDUSTORY_1 as kbn_2, SUB_INDUSTORY_1 as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' group by MAIN_INDUSTORY_1,SUB_INDUSTORY_1
 union all
select '002' as kbn_1, MAIN_INDUSTORY_1 as kbn_2, SUB_INDUSTORY_1 as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' group by MAIN_INDUSTORY_1,SUB_INDUSTORY_1
 union all
select '002' as kbn_1, MAIN_INDUSTORY_2 as kbn_2, SUB_INDUSTORY_2 as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_2 <> '' and MAIN_INDUSTORY_2 is not NULL group by MAIN_INDUSTORY_2,SUB_INDUSTORY_2
 union all
select '002' as kbn_1, MAIN_INDUSTORY_2 as kbn_2, SUB_INDUSTORY_2 as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_2 <> '' and MAIN_INDUSTORY_2 is not NULL group by MAIN_INDUSTORY_2,SUB_INDUSTORY_2
 union all
select '002' as kbn_1, MAIN_INDUSTORY_3 as kbn_2, SUB_INDUSTORY_3 as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_3 <> '' and MAIN_INDUSTORY_3 is not NULL group by MAIN_INDUSTORY_3,SUB_INDUSTORY_3
 union all
select '002' as kbn_1, MAIN_INDUSTORY_3 as kbn_2, SUB_INDUSTORY_3 as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_3 <> '' and MAIN_INDUSTORY_3 is not NULL group by MAIN_INDUSTORY_3,SUB_INDUSTORY_3
 union all
select '002' as kbn_1, MAIN_INDUSTORY_4 as kbn_2, SUB_INDUSTORY_4 as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_4 <> '' and MAIN_INDUSTORY_4 is not NULL group by MAIN_INDUSTORY_4,SUB_INDUSTORY_4
 union all
select '002' as kbn_1, MAIN_INDUSTORY_4 as kbn_2, SUB_INDUSTORY_4 as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_4 <> '' and MAIN_INDUSTORY_4 is not NULL group by MAIN_INDUSTORY_4,SUB_INDUSTORY_4
 union all
select '002' as kbn_1, MAIN_INDUSTORY_5 as kbn_2, SUB_INDUSTORY_5 as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_5 <> '' and MAIN_INDUSTORY_5 is not NULL group by MAIN_INDUSTORY_5,SUB_INDUSTORY_5
 union all
select '002' as kbn_1, MAIN_INDUSTORY_5 as kbn_2, SUB_INDUSTORY_5 as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_5 <> '' and MAIN_INDUSTORY_5 is not NULL group by MAIN_INDUSTORY_5,SUB_INDUSTORY_5
 union all
select '002' as kbn_1, MAIN_INDUSTORY_6 as kbn_2, SUB_INDUSTORY_6 as kbn_3, '000' as kbn_4, '0' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region = '009' and country = '002' and MAIN_INDUSTORY_6 <> '' and MAIN_INDUSTORY_6 is not NULL group by MAIN_INDUSTORY_6,SUB_INDUSTORY_6
 union all
select '002' as kbn_1, MAIN_INDUSTORY_6 as kbn_2, SUB_INDUSTORY_6 as kbn_3, '000' as kbn_4, '1' as venue_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '-', date_to_mm, '-', date_to_dd) >= CURDATE() and region <> '009'and country <> '002' and MAIN_INDUSTORY_6 <> '' and MAIN_INDUSTORY_6 is not NULL group by MAIN_INDUSTORY_6,SUB_INDUSTORY_6
) rap group by rap.kbn_1,rap.kbn_2,rap.kbn_3,rap.kbn_4,rap.venue_kbn;








