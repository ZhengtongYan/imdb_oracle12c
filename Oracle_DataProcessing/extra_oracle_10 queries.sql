
--114
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT t.title, t.production_year, cn.name
FROM cast_info ci, title t, char_name cn
WHERE ci.movie_id =t.id and cn.id=ci.person_role_id and t.kind_id = 1 AND ci.role_id = 2;
spool "C:\Users\stefa\Desktop\Work\114.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--115
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT min(t.title), max(t.production_year), min(cn.name)
FROM cast_info ci, title t, char_name cn
WHERE ci.movie_id =t.id and cn.id=ci.person_role_id and t.kind_id =3 AND ci.role_id = 1;
spool "C:\Users\stefa\Desktop\Work\115.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--116
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS uncredited_voiced_character, MIN(t.title) AS russian_movie 
FROM char_name chn, cast_info ci, movie_companies mc, role_type rt, title t 
WHERE ci.note  like '%(voice)%' and ci.note like '%(uncredited)%' AND t.production_year > 2003 
AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id ;
spool "C:\Users\stefa\Desktop\Work\116.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--117
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS uncredited_voiced_character, MIN(t.title) 
FROM char_name chn, cast_info ci, movie_companies mc, role_type rt, title t 
WHERE ci.note  not like '%(voice)%' and ci.note like '%(uncredited)%' AND t.production_year > 2010 
AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id ;
spool "C:\Users\stefa\Desktop\Work\117.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;




--118
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS mainstream_movie 
FROM  movie_companies mc, movie_info mi, movie_info_idx mi_idx, title t 
WHERE mi.info  in ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info  > '7.0' AND t.production_year  between 2000 and 2010 
AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\118.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--119
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS mainstream_movie 
FROM  movie_companies mc, movie_info mi, movie_info_idx mi_idx, title t 
WHERE mi.info  in ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info  > '5.0' AND t.production_year  between 2005 and 2010 
AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id 
spool "C:\Users\stefa\Desktop\Work\119.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--120
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS release_date, MIN(miidx.info) AS rating, MIN(t.title) AS hongkong_movie 
FROM company_name cn, company_type ct, info_type it, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx miidx, title t 
WHERE cn.country_code ='[hk]' AND ct.kind ='production companies' AND it.info ='rating' AND kt.kind ='movie' 
AND mi.movie_id = t.id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id 
AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\120.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;


--121
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS release_date, MIN(t.title) AS modern_internet_movie 
FROM aka_title at, movie_companies mc, movie_info mi, movie_keyword mk, title t 
WHERE mi.note  like '%internet%' AND mi.info  is not NULL and (mi.info like 'USA:% 199%' or mi.info like 'USA:% 200%') AND t.production_year  > 2000 
AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id ;
spool "C:\Users\stefa\Desktop\Work\121.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--122
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mc.note) AS production_note, MIN(t.title) AS movie_title, MIN(t.production_year) AS movie_year 
FROM company_type ct, movie_companies  mc,  title  t 
WHERE ct.kind = 'production companies' AND mc.note  not like '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year >2008 
AND ct.id = mc.company_type_id AND t.id = mc.movie_id ;
spool "C:\Users\stefa\Desktop\Work\122.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--123
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title 
FROM keyword k, movie_info mi, movie_keyword mk, title t 
WHERE k.keyword  like '%sequel%' AND mi.info  IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 
AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\123.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--124
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS movie_title 
FROM  movie_info_idx mi_idx, movie_keyword mk, title t 
WHERE mi_idx.info  > '2.0' AND t.production_year > 2005 
AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id;
spool "C:\Users\stefa\Desktop\Work\124.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--125 (extra long)
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn1.name) AS first_company, MIN(cn2.name) AS second_company, MIN(mi_idx1.info) AS first_rating, MIN(mi_idx2.info) AS second_rating, MIN(t1.title) AS first_movie, MIN(kt1.kind) AS type, MIN(t2.title) AS second_movie ,MIN(kt2.kind) AS type
FROM aka_title at1, aka_title at2,company_name cn1, company_name cn2, info_type it1, info_type it2, kind_type kt1, kind_type kt2,  movie_companies mc1, movie_companies mc2, movie_info_idx mi_idx1, movie_info_idx mi_idx2, movie_link  ml, title t1, title t2 
WHERE it1.info  = 'rating' AND it2.info  = 'rating' AND  mi_idx2.info  < '3.0' AND t2.production_year  <2007 AND at1.production_year >2000 AND at2.production_year >2000
AND at1.kind_id = t1.kind_id AND at2.kind_id = t2.kind_id AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND t1.id = mi_idx1.movie_id 
AND kt1.id = t1.kind_id AND cn1.id = mc1.company_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id 
AND mi_idx1.movie_id = mc1.movie_id AND it2.id = mi_idx2.info_type_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND cn2.id = mc2.company_id 
AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id;
spool "C:\Users\stefa\Desktop\Work\125.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--126 (extra long)
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn1.name) AS first_company, MIN(cn2.name) AS second_company, MIN(mi_idx1.info) AS first_rating, MIN(mi_idx2.info) AS second_rating, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie 
FROM aka_title at1, aka_title at2,company_name cn1, company_name cn2, info_type it1, info_type it2,  movie_companies mc1, movie_companies mc2, movie_info_idx mi_idx1, movie_info_idx mi_idx2, movie_link  ml, title t1, title t2 
WHERE it1.info  = 'rating' AND it2.info  = 'rating' AND  mi_idx2.info  < '3.0' 
AND at1.kind_id = t1.kind_id AND at2.kind_id = t2.kind_id AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND t1.id = mi_idx1.movie_id 
AND cn1.id = mc1.company_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id 
AND mi_idx1.movie_id = mc1.movie_id AND it2.id = mi_idx2.info_type_id AND t2.id = mi_idx2.movie_id AND cn2.id = mc2.company_id 
AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id;
spool "C:\Users\stefa\Desktop\Work\126.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;





