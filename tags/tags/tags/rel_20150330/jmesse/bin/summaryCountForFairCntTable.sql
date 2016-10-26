truncate table jm_fair_cnt;
insert
into jm_fair_cnt(kbn_1, kbn_2, kbn_3, kbn_4, venue_kbn, site_kbn, fair_cnt)
select rap.kbn_1, rap.kbn_2, rap.kbn_3, rap.kbn_4, rap.venue_kbn, rap.site_kbn, sum(fair_cnt) from
(
select '003' as kbn_1, region as kbn_2, '000' as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('0', '2') group by region
union all
select '003' as kbn_1, region as kbn_2, '000' as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('1', '2') group by region
union all
select '003' as kbn_1, region as kbn_2, country as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('0', '2') group by region, country
union all
select '003' as kbn_1, region as kbn_2, country as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('1', '2') group by region, country
union all
select '003' as kbn_1, region as kbn_2, country as kbn_3, city as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('0', '2') group by region, country, city
union all
select '003' as kbn_1, region as kbn_2, country as kbn_3, city as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('1', '2') group by region, country, city
union all
select '002' as kbn_1, main_industory_1 as kbn_2, sub_industory_1 as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('0', '2') group by main_industory_1, sub_industory_1
union all
select '002' as kbn_1, main_industory_1 as kbn_2, sub_industory_1 as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and select_language_info in ('1', '2') group by main_industory_1, sub_industory_1
union all
select '002' as kbn_1, main_industory_2 as kbn_2, sub_industory_2 as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_2 <> '' and main_industory_2 is not null and select_language_info in ('0', '2') group by main_industory_2, sub_industory_2
union all
select '002' as kbn_1, main_industory_2 as kbn_2, sub_industory_2 as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_2 <> '' and main_industory_2 is not null and select_language_info in ('1', '2') group by main_industory_2, sub_industory_2
union all
select '002' as kbn_1, main_industory_3 as kbn_2, sub_industory_3 as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_3 <> '' and main_industory_3 is not null and select_language_info in ('0', '2') group by main_industory_3, sub_industory_3
union all
select '002' as kbn_1, main_industory_3 as kbn_2, sub_industory_3 as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_3 <> '' and main_industory_3 is not null and select_language_info in ('1', '2') group by main_industory_3, sub_industory_3
union all
select '002' as kbn_1, main_industory_4 as kbn_2, sub_industory_4 as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_4 <> '' and main_industory_4 is not null and select_language_info in ('0', '2') group by main_industory_4, sub_industory_4
union all
select '002' as kbn_1, main_industory_4 as kbn_2, sub_industory_4 as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_4 <> '' and main_industory_4 is not null and select_language_info in ('1', '2') group by main_industory_4, sub_industory_4
union all
select '002' as kbn_1, main_industory_5 as kbn_2, sub_industory_5 as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_5 <> '' and main_industory_5 is not null and select_language_info in ('0', '2') group by main_industory_5, sub_industory_5
union all
select '002' as kbn_1, main_industory_5 as kbn_2, sub_industory_5 as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_5 <> '' and main_industory_5 is not null and select_language_info in ('1', '2') group by main_industory_5, sub_industory_5
union all
select '002' as kbn_1, main_industory_6 as kbn_2, sub_industory_6 as kbn_3, '000' as kbn_4, '' as venue_kbn, '0' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_6 <> '' and main_industory_6 is not null and select_language_info in ('0', '2') group by main_industory_6, sub_industory_6
union all
select '002' as kbn_1, main_industory_6 as kbn_2, sub_industory_6 as kbn_3, '000' as kbn_4, '' as venue_kbn, '1' as site_kbn, count(*) as fair_cnt from jm_fair where del_flg = '0' and confirm_flag = '1' and web_display_type = '1' and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate() and main_industory_6 <> '' and main_industory_6 is not null and select_language_info in ('1', '2') group by main_industory_6, sub_industory_6
) rap
group by
rap.kbn_1, rap.kbn_2, rap.kbn_3, rap.kbn_4, rap.venue_kbn, rap.site_kbn;
insert into jm_fair_cnt (kbn_1, kbn_2, kbn_3, kbn_4, venue_kbn, site_kbn, fair_cnt)
select '002', t.main_industory, '000', '000', '', t.site_kbn, count(*) fair_cnt from (
(select mihon_no, main_industory_1 main_industory, '0' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_1 <> '' and select_language_info in ('0', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_2 main_industory, '0' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_2 <> '' and select_language_info in ('0', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_3 main_industory, '0' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_3 <> '' and select_language_info in ('0', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_4 main_industory, '0' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_4 <> '' and select_language_info in ('0', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_5 main_industory, '0' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_5 <> '' and select_language_info in ('0', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_6 main_industory, '0' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_6 <> '' and select_language_info in ('0', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_1 main_industory, '1' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_1 <> '' and select_language_info in ('1', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_2 main_industory, '1' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_2 <> '' and select_language_info in ('1', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_3 main_industory, '1' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_3 <> '' and select_language_info in ('1', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_4 main_industory, '1' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_4 <> '' and select_language_info in ('1', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_5 main_industory, '1' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_5 <> '' and select_language_info in ('1', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
union
(select mihon_no, main_industory_6 main_industory, '1' site_kbn from jm_fair where web_display_type = '1' and confirm_flag = '1' and del_flg = '0' and main_industory_6 <> '' and select_language_info in ('1', '2') and concat(date_to_yyyy, '/', date_to_mm, '/', date_to_dd) >= curdate())
) t
group by t.main_industory, t.site_kbn;
