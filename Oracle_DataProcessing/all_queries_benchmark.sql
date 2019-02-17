--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS uncredited_voiced_character, MIN(t.title) AS russian_movie FROM char_name chn, cast_info ci, company_name cn, company_type ct, movie_companies mc, role_type rt, title t WHERE ci.note  like '%(voice)%' and ci.note like '%(uncredited)%' AND cn.country_code  = '[ru]' AND rt.role  = 'actor' AND t.production_year > 2005 AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\1.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;


--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS character, MIN(t.title) AS russian_mov_with_actor_producer FROM char_name chn, cast_info ci, company_name cn, company_type ct, movie_companies mc, role_type rt, title t WHERE ci.note  like '%(producer)%' AND cn.country_code  = '[ru]' AND rt.role  = 'actor' AND t.production_year > 2010 AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\2.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;


alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS character, MIN(t.title) AS movie_with_american_producer FROM char_name chn, cast_info ci, company_name cn, company_type ct, movie_companies mc, role_type rt, title t WHERE ci.note  like '%(producer)%' AND cn.country_code  = '[us]' AND t.production_year > 1990 AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\3.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;


alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS from_company, MIN(lt.link) AS movie_link_type, MIN(t.title) AS non_polish_sequel_movie FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_keyword mk, movie_link ml, title t WHERE cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND t.production_year BETWEEN 1950 AND 2000 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\4.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;


alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS from_company, MIN(lt.link) AS movie_link_type, MIN(t.title) AS sequel_movie FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_keyword mk, movie_link ml, title t WHERE cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follows%' AND mc.note IS NULL AND t.production_year  = 1998 and t.title like '%Money%' AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\5.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;










--6
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS from_company, MIN(mc.note) AS production_note, MIN(t.title) AS movie_based_on_book FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_keyword mk, movie_link ml, title t WHERE cn.country_code  !='[pl]' and (cn.name like '20th Century Fox%' or cn.name like 'Twentieth Century Fox%') AND ct.kind  != 'production companies' and ct.kind is not NULL AND k.keyword  in ('sequel', 'revenge', 'based-on-novel') AND mc.note  is not NULL AND t.production_year  > 1950 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\6.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--7
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS from_company, MIN(mc.note) AS production_note, MIN(t.title) AS movie_based_on_book FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_keyword mk, movie_link ml, title t WHERE cn.country_code  != '[pl]' AND ct.kind  != 'production companies' and ct.kind is not NULL AND k.keyword  in ('sequel', 'revenge', 'based-on-novel') AND mc.note  is not NULL AND t.production_year  > 1950 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\7.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--8
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS drama_horror_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, movie_companies mc, movie_info mi, movie_info_idx mi_idx, title t WHERE cn.country_code  = '[us]' AND ct.kind  = 'production companies' AND it1.info = 'genres' AND it2.info = 'rating' AND mi.info  in ('Drama', 'Horror') AND mi_idx.info  > '8.0' AND t.production_year  between 2005 and 2008 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id;
spool "C:\Users\stefa\Desktop\Work\8.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--9
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS budget, MIN(t.title) AS unsuccsessful_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, movie_companies mc, movie_info mi, movie_info_idx mi_idx, title t WHERE cn.country_code ='[us]' AND ct.kind  is not NULL and (ct.kind ='production companies' or ct.kind = 'distributors') AND it1.info ='budget' AND it2.info ='bottom 10 rank' AND t.production_year >2000 AND (t.title LIKE 'Birdemic%' OR t.title LIKE '%Movie%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id;
spool "C:\Users\stefa\Desktop\Work\9.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--10
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS mainstream_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, movie_companies mc, movie_info mi, movie_info_idx mi_idx, title t WHERE cn.country_code  = '[us]' AND ct.kind  = 'production companies' AND it1.info = 'genres' AND it2.info = 'rating' AND mi.info  in ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info  > '7.0' AND t.production_year  between 2000 and 2010 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND t.id = mc.movie_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id;
spool "C:\Users\stefa\Desktop\Work\10.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--11
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS release_date, MIN(miidx.info) AS rating, MIN(t.title) AS german_movie FROM company_name cn, company_type ct, info_type it, info_type it2, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx miidx, title t WHERE cn.country_code ='[de]' AND ct.kind ='production companies' AND it.info ='rating' AND it2.info ='release dates' AND kt.kind ='movie' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\11.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--12
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS producing_company, MIN(miidx.info) AS rating, MIN(t.title) AS movie_about_winning FROM company_name cn, company_type ct, info_type it, info_type it2, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx miidx, title t WHERE cn.country_code ='[us]' AND ct.kind ='production companies' AND it.info ='rating' AND it2.info ='release dates' AND kt.kind ='movie' AND t.title  != '' AND (t.title LIKE '%Champion%' OR t.title LIKE '%Loser%') AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\12.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--13
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS producing_company, MIN(miidx.info) AS rating, MIN(t.title) AS movie_about_winning FROM company_name cn, company_type ct, info_type it, info_type it2, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx miidx, title t WHERE cn.country_code ='[us]' AND ct.kind ='production companies' AND it.info ='rating' AND it2.info ='release dates' AND kt.kind ='movie' AND t.title  != '' AND (t.title LIKE 'Champion%' OR t.title LIKE 'Loser%') AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\13.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--14
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS producing_company, MIN(miidx.info) AS rating, MIN(t.title) AS movie FROM company_name cn, company_type ct, info_type it, info_type it2, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx miidx, title t WHERE cn.country_code ='[us]' AND ct.kind ='production companies' AND it.info ='rating' AND it2.info ='release dates' AND kt.kind ='movie' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\14.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--15
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS northern_dark_movie FROM info_type it1, info_type it2, keyword k, kind_type kt, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  < '8.5' AND t.production_year  > 2010 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\15.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--16
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS western_dark_production FROM info_type it1, info_type it2, keyword k, kind_type kt, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title') AND kt.kind  = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  > '6.0' AND t.production_year  > 2010 and (t.title like '%murder%' or t.title like '%Murder%' or t.title like '%Mord%') AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\16.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--17
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS north_european_dark_production FROM info_type it1, info_type it2, keyword k, kind_type kt, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  is not null and k.keyword in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  < '8.5' AND t.production_year  > 2005 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\17.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--18
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS release_date, MIN(t.title) AS internet_movie FROM aka_title at, company_name cn, company_type ct, info_type it1, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, title t WHERE cn.country_code  = '[us]' AND it1.info  = 'release dates' AND mc.note  like '%(200%)%' and mc.note like '%(worldwide)%' AND mi.note  like '%internet%' AND mi.info  like 'USA:% 200%' AND t.production_year  > 2000 AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\18.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--19
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS release_date, MIN(t.title) AS youtube_movie FROM aka_title at, company_name cn, company_type ct, info_type it1, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, title t WHERE cn.country_code  = '[us]' and cn.name = 'YouTube' AND it1.info  = 'release dates' AND mc.note  like '%(200%)%' and mc.note like '%(worldwide)%' AND mi.note  like '%internet%' AND mi.info  like 'USA:% 200%' AND t.production_year  between 2005 and 2010 AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\19.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--20
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS release_date, MIN(t.title) AS modern_american_internet_movie FROM aka_title at, company_name cn, company_type ct, info_type it1, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, title t WHERE cn.country_code  = '[us]' AND it1.info  = 'release dates' AND mi.note  like '%internet%' AND mi.info  is not NULL and (mi.info like 'USA:% 199%' or mi.info like 'USA:% 200%') AND t.production_year  > 1990 AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\20.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--21
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(at.title) AS aka_title, MIN(t.title) AS internet_movie_title FROM aka_title at, company_name cn, company_type ct, info_type it1, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, title t WHERE cn.country_code  = '[us]' AND it1.info  = 'release dates' AND mi.note  like '%internet%' AND t.production_year  > 1990 AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id;
spool "C:\Users\stefa\Desktop\Work\21.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--22
SELECT MIN(an.name) AS cool_actor_pseudonym, MIN(t.title) AS series_named_after_char FROM aka_name an, cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND t.episode_nr >= 50 AND t.episode_nr < 100 AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\22.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--23
SELECT MIN(an.name) AS cool_actor_pseudonym, MIN(t.title) AS series_named_after_char FROM aka_name an, cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\23.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--24
SELECT MIN(an.name) AS cool_actor_pseudonym, MIN(t.title) AS series_named_after_char FROM aka_name an, cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND t.episode_nr < 100 AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\24.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--25
SELECT MIN(an.name) AS cool_actor_pseudonym, MIN(t.title) AS series_named_after_char FROM aka_name an, cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND t.episode_nr >= 5 AND t.episode_nr < 100 AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\25.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--26
SELECT MIN(n.name) AS member_in_charnamed_american_movie, MIN(n.name) AS a1 FROM cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND n.name  LIKE 'B%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\26.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--27
SELECT MIN(n.name) AS member_in_charnamed_movie, MIN(n.name) AS a1 FROM cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE k.keyword ='character-name-in-title' AND n.name  LIKE 'Z%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\27.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--28
SELECT MIN(n.name) AS member_in_charnamed_movie, MIN(n.name) AS a1 FROM cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE k.keyword ='character-name-in-title' AND n.name  LIKE 'X%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\28.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--29
SELECT MIN(n.name) AS member_in_charnamed_movie FROM cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE k.keyword ='character-name-in-title' AND n.name  LIKE '%Bert%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\29.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--30
SELECT MIN(n.name) AS member_in_charnamed_movie FROM cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\30.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;


--31
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS member_in_charnamed_movie FROM cast_info ci, company_name cn, keyword k, movie_companies mc, movie_keyword mk, name n, title t WHERE k.keyword ='character-name-in-title' AND n.name  LIKE '%B%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\31.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--32
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(t.title) AS movie_title FROM cast_info ci, info_type it1, info_type it2, movie_info mi, movie_info_idx mi_idx, name  n, title  t WHERE ci.note  in ('(producer)', '(executive producer)') AND it1.info  = 'budget' AND it2.info  = 'votes' AND n.gender  = 'm' and n.name like '%Tim%' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\32.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
--33
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(t.title) AS movie_title FROM cast_info ci, info_type it1, info_type it2, movie_info mi, movie_info_idx mi_idx, name  n, title  t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'rating' AND mi.info  in ('Horror', 'Thriller') and mi.note is NULL AND mi_idx.info  > '8.0' AND n.gender  is not null and n.gender = 'f' AND t.production_year  between 2008 and 2014 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\33.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--34
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(t.title) AS movie_title FROM cast_info ci, info_type it1, info_type it2, movie_info mi, movie_info_idx mi_idx, name n, title t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND mi.info  in ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender  = 'm' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\34.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--35
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS voicing_actress, MIN(t.title) AS voiced_movie FROM aka_name an, char_name chn, cast_info ci, company_name cn, info_type it, movie_companies mc, movie_info mi, name n, role_type rt, title t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND mc.note  is not NULL and (mc.note like '%(USA)%' or mc.note like '%(worldwide)%') AND mi.info  is not null and (mi.info like 'Japan:%200%' or mi.info like 'USA:%200%') AND n.gender ='f' and n.name like '%Ang%' AND rt.role ='actress' AND t.production_year  between 2005 and 2009 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id;
spool "C:\Users\stefa\Desktop\Work\35.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--36
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS voicing_actress, MIN(t.title) AS kung_fu_panda FROM aka_name an, char_name chn, cast_info ci, company_name cn, info_type it, movie_companies mc, movie_info mi, name n, role_type rt, title t WHERE ci.note  = '(voice)' AND cn.country_code ='[us]' AND it.info  = 'release dates' AND mc.note  like '%(200%)%' and (mc.note like '%(USA)%' or mc.note like '%(worldwide)%') AND mi.info  is not null and (mi.info like 'Japan:%2007%' or mi.info like 'USA:%2008%') AND n.gender ='f' and n.name like '%Angel%' AND rt.role ='actress' AND t.production_year  between 2007 and 2008 and t.title like '%Kung%Fu%Panda%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id;
spool "C:\Users\stefa\Desktop\Work\36.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--37
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS voicing_actress, MIN(t.title) AS jap_engl_voiced_movie FROM aka_name an, char_name chn, cast_info ci, company_name cn, info_type it, movie_companies mc, movie_info mi, name n, role_type rt, title t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND mi.info  is not null and (mi.info like 'Japan:%200%' or mi.info like 'USA:%200%') AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND t.production_year  > 2000 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id;
spool "C:\Users\stefa\Desktop\Work\37.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--38
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS voicing_actress, MIN(t.title) AS jap_engl_voiced_movie FROM aka_name an, char_name chn, cast_info ci, company_name  cn, info_type  it, movie_companies  mc, movie_info  mi, name  n, role_type  rt, title  t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND n.gender ='f' AND rt.role ='actress' AND t.production_year  > 2000 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id;
spool "C:\Users\stefa\Desktop\Work\38.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--39
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mc.note) AS production_note, MIN(t.title) AS movie_title, MIN(t.production_year) AS movie_year FROM company_type  ct, info_type  it, movie_companies  mc, movie_info_idx mi_idx, title  t WHERE ct.kind = 'production companies' AND it.info = 'top 250 rank' AND mc.note  not like '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note like '%(co-production)%' or mc.note like '%(presents)%') AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\39.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--40
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mc.note) AS production_note, MIN(t.title) AS movie_title, MIN(t.production_year) AS movie_year FROM company_type ct, info_type  it, movie_companies  mc, movie_info_idx mi_idx, title  t WHERE ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND mc.note  not like '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year between 2005 and 2010 AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\40.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--41
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mc.note) AS production_note, MIN(t.title) AS movie_title, MIN(t.production_year) AS movie_year FROM company_type  ct, info_type  it, movie_companies  mc, movie_info_idx mi_idx, title  t WHERE ct.kind = 'production companies' AND it.info = 'top 250 rank' AND mc.note  not like '%(as Metro-Goldwyn-Mayer Pictures)%' and (mc.note like '%(co-production)%') AND t.production_year >2010 AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\41.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--42
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mc.note) AS production_note, MIN(t.title) AS movie_title, MIN(t.production_year) AS movie_year FROM company_type ct, info_type  it, movie_companies  mc, movie_info_idx mi_idx, title  t WHERE ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND mc.note  not like '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year >2000 AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\42.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--43
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS complete_downey_ironman_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info  ci, keyword  k, kind_type  kt, movie_keyword  mk, name  n, title  t WHERE cct1.kind  = 'cast' AND cct2.kind  like '%complete%' AND chn.name  not like '%Sherlock%' and (chn.name like '%Tony%Stark%' or chn.name like '%Iron%Man%') AND k.keyword  in ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND kt.kind  = 'movie' AND t.production_year  > 1950 AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\43.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--44
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS complete_downey_ironman_movie FROM complete_cast  cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, keyword k, kind_type kt, movie_keyword mk, name n, title t WHERE cct1.kind  = 'cast' AND cct2.kind  like '%complete%' AND chn.name  not like '%Sherlock%' and (chn.name like '%Tony%Stark%' or chn.name like '%Iron%Man%') AND k.keyword  in ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND kt.kind  = 'movie' AND n.name  LIKE '%Downey%Robert%' AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\44.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--45
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS cast_member, MIN(t.title) AS complete_dynamic_hero_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, keyword k, kind_type kt, movie_keyword mk, name n, title t WHERE cct1.kind  = 'cast' AND cct2.kind  like '%complete%' AND chn.name  is not NULL and (chn.name like '%man%' or chn.name like '%Man%') AND k.keyword  in ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND kt.kind  = 'movie' AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\45.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--46
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS company_name, MIN(lt.link) AS link_type, MIN(t.title) AS western_follow_up FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_info mi, movie_keyword mk, movie_link ml, title t WHERE cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year BETWEEN 1950 AND 2000 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id;
spool "C:\Users\stefa\Desktop\Work\46.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--47
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS company_name, MIN(lt.link) AS link_type, MIN(t.title) AS german_follow_up FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_info mi, movie_keyword mk, movie_link ml, title t WHERE cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Germany', 'German') AND t.production_year BETWEEN 2000 AND 2010 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id;
spool "C:\Users\stefa\Desktop\Work\47.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--48
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS company_name, MIN(lt.link) AS link_type, MIN(t.title) AS western_follow_up FROM company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_info mi, movie_keyword mk, movie_link ml, title t WHERE cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'English') AND t.production_year BETWEEN 1950 AND 2010 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id;
spool "C:\Users\stefa\Desktop\Work\48.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--49
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS western_violent_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies  mc, movie_info  mi, movie_info_idx mi_idx, movie_keyword mk, title  t WHERE cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mc.note  not like '%(USA)%' and mc.note like '%(200%)%' AND mi.info IN ('Germany', 'German', 'USA', 'American') AND mi_idx.info  < '7.0' AND t.production_year  > 2008 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\49.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--50
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS western_violent_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mc.note  not like '%(USA)%' and mc.note like '%(200%)%' AND mi.info IN ('Germany', 'German', 'USA', 'American') AND mi_idx.info  < '7.0' AND t.production_year  > 2009 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\50.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--51
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS western_violent_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mc.note  not like '%(USA)%' and mc.note like '%(200%)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  < '8.5' AND t.production_year  > 2005 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\51.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--52
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS western_violent_movie FROM company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  < '8.5' AND t.production_year  > 2005 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\52.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--53
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(kt.kind) AS movie_kind, MIN(t.title) AS complete_us_internet_movie FROM complete_cast cc, comp_cast_type cct1, company_name cn, company_type ct, info_type it1, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_keyword mk, title t WHERE cct1.kind  = 'complete+verified' AND cn.country_code  = '[us]' AND it1.info  = 'release dates' AND kt.kind  in ('movie') AND mi.note  like '%internet%' AND mi.info  is not NULL and (mi.info like 'USA:% 199%' or mi.info like 'USA:% 200%') AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\53.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--54
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(kt.kind) AS movie_kind, MIN(t.title) AS complete_nerdy_internet_movie FROM complete_cast cc, comp_cast_type cct1, company_name cn, company_type ct, info_type it1, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_keyword mk, title t WHERE cct1.kind  = 'complete+verified' AND cn.country_code  = '[us]' AND it1.info  = 'release dates' AND k.keyword  in ('nerd', 'loner', 'alienation', 'dignity') AND kt.kind  in ('movie') AND mi.note  like '%internet%' AND mi.info  like 'USA:% 200%' AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\54.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--55
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(kt.kind) AS movie_kind, MIN(t.title) AS complete_us_internet_movie FROM complete_cast cc, comp_cast_type cct1, company_name cn, company_type ct, info_type it1, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_keyword mk, title  t WHERE cct1.kind  = 'complete+verified' AND cn.country_code  = '[us]' AND it1.info  = 'release dates' AND kt.kind  in ('movie', 'tv movie', 'video movie', 'video game') AND mi.note  like '%internet%' AND mi.info  is not NULL and (mi.info like 'USA:% 199%' or mi.info like 'USA:% 200%') AND t.production_year  > 1990 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND cct1.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\55.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--56
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS voiced_char_name, MIN(n.name) AS voicing_actress_name, MIN(t.title) AS voiced_action_movie_jap_eng FROM aka_name an, char_name chn, cast_info ci, company_name cn, info_type it, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, name n, role_type  rt, title  t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND k.keyword  in ('hero', 'martial-arts', 'hand-to-hand-combat') AND mi.info  is not null and (mi.info like 'Japan:%201%' or mi.info like 'USA:%201%') AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND t.production_year  > 2010 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\56.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--57
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS voiced_char_name, MIN(n.name) AS voicing_actress_name, MIN(t.title) AS kung_fu_panda FROM aka_name an, char_name chn, cast_info  ci, company_name  cn, info_type  it, keyword  k, movie_companies  mc, movie_info  mi, movie_keyword  mk, name  n, role_type  rt, title  t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND cn.name  = 'DreamWorks Animation' AND it.info  = 'release dates' AND k.keyword  in ('hero', 'martial-arts', 'hand-to-hand-combat', 'computer-animated-movie') AND mi.info  is not null and (mi.info like 'Japan:%201%' or mi.info like 'USA:%201%') AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND t.production_year  > 2010 AND t.title like 'Kung Fu Panda%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\57.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--58
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS male_writer, MIN(t.title) AS violent_movie_title FROM cast_info  ci, info_type it1, info_type it2, keyword  k, movie_info  mi, movie_info_idx mi_idx, movie_keyword  mk, name  n, title  t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info  = 'Horror' AND n.gender  = 'm' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\58.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--59
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS male_writer, MIN(t.title) AS violent_movie_title FROM cast_info ci, info_type it1, info_type it2, keyword k, movie_info mi, movie_info_idx mi_idx, movie_keyword  mk, name  n, title t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'blood', 'gore', 'death', 'female-nudity') AND mi.info  = 'Horror' AND n.gender   = 'm' AND t.production_year  > 2010 AND t.title  like 'Vampire%' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\59.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--60
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS male_writer, MIN(t.title) AS violent_movie_title FROM cast_info ci, info_type it1, info_type it2, keyword k, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info  in ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender   = 'm' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\60.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--61
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS character_name, MIN(mi_idx.info) AS rating, MIN(n.name) AS playing_actor, MIN(t.title) AS complete_hero_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, info_type it2, keyword k, kind_type kt, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE cct1.kind  = 'cast' AND cct2.kind  like '%complete%' AND chn.name  is not NULL and (chn.name like '%man%' or chn.name like '%Man%') AND it2.info  = 'rating' AND k.keyword  in ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND kt.kind  = 'movie' AND mi_idx.info  > '7.0' AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\61.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--62
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS character_name, MIN(mi_idx.info) AS rating, MIN(t.title) AS complete_hero_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, info_type it2, keyword k, kind_type kt, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE cct1.kind  = 'cast' AND cct2.kind  like '%complete%' AND chn.name  is not NULL and (chn.name like '%man%' or chn.name like '%Man%') AND it2.info  = 'rating' AND k.keyword  in ('superhero', 'marvel-comics', 'based-on-comic', 'fight') AND kt.kind  = 'movie' AND mi_idx.info  > '8.0' AND t.production_year  > 2005 AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\62.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--63
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS character_name, MIN(mi_idx.info) AS rating, MIN(t.title) AS complete_hero_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, info_type it2, keyword k, kind_type kt, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE cct1.kind  = 'cast' AND cct2.kind  like '%complete%' AND chn.name  is not NULL and (chn.name like '%man%' or chn.name like '%Man%') AND it2.info  = 'rating' AND k.keyword  in ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND kt.kind  = 'movie' AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND it2.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\63.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--64
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS producing_company, MIN(lt.link) AS link_type, MIN(t.title) AS complete_western_sequel FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_info mi, movie_keyword mk, movie_link ml, title t WHERE cct1.kind  in ('cast', 'crew') AND cct2.kind  = 'complete' AND cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Germany','Swedish', 'German') AND t.production_year BETWEEN 1950 AND 2000 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND mi.movie_id = t.id AND t.id = cc.movie_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id;
spool "C:\Users\stefa\Desktop\Work\64.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--65
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS producing_company, MIN(lt.link) AS link_type, MIN(t.title) AS complete_western_sequel FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_info mi, movie_keyword mk, movie_link ml, title t WHERE cct1.kind  in ('cast', 'crew') AND cct2.kind  = 'complete' AND cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Germany','Swedish', 'German') AND t.production_year  = 1998 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND mi.movie_id = t.id AND t.id = cc.movie_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id;
spool "C:\Users\stefa\Desktop\Work\65.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--66
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS producing_company, MIN(lt.link) AS link_type, MIN(t.title) AS complete_western_sequel FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, company_name cn, company_type ct, keyword k, link_type lt, movie_companies mc, movie_info mi, movie_keyword mk, movie_link ml, title t WHERE cct1.kind  = 'cast' AND cct2.kind  like 'complete%' AND cn.country_code !='[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind ='production companies' AND k.keyword ='sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'English') AND t.production_year BETWEEN 1950 AND 2010 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND mi.movie_id = t.id AND t.id = cc.movie_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id;
spool "C:\Users\stefa\Desktop\Work\66.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--67
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS complete_euro_dark_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE cct1.kind  = 'crew' AND cct2.kind  != 'complete+verified' AND cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mc.note  not like '%(USA)%' and mc.note like '%(200%)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  < '8.5' AND t.production_year  > 2000 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\67.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--68
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS complete_euro_dark_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE cct1.kind  = 'crew' AND cct2.kind  != 'complete+verified' AND cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mc.note  not like '%(USA)%' and mc.note like '%(200%)%' AND mi.info  IN ('Sweden', 'Germany', 'Swedish', 'German') AND mi_idx.info  > '6.5' AND t.production_year  > 2005 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\68.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--69
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn.name) AS movie_company, MIN(mi_idx.info) AS rating, MIN(t.title) AS complete_euro_dark_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, company_name cn, company_type ct, info_type it1, info_type it2, keyword k, kind_type kt, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, title t WHERE cct1.kind  = 'cast' AND cct2.kind  = 'complete' AND cn.country_code  != '[us]' AND it1.info  = 'countries' AND it2.info  = 'rating' AND k.keyword  in ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind  in ('movie', 'episode') AND mc.note  not like '%(USA)%' and mc.note like '%(200%)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info  < '8.5' AND t.production_year  > 2005 AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\69.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--70
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS voiced_char, MIN(n.name) AS voicing_actress, MIN(t.title) AS voiced_animation FROM aka_name an, complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, company_name cn, info_type it, info_type it3, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, name n, person_info pi, role_type rt, title t WHERE cct1.kind  ='cast' AND cct2.kind  ='complete+verified' AND chn.name  = 'Queen' AND ci.note  in ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND it3.info  = 'trivia' AND k.keyword  = 'computer-animation' AND mi.info  is not null and (mi.info like 'Japan:%200%' or mi.info like 'USA:%200%') AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND t.title  = 'Shrek 2' AND t.production_year  between 2000 and 2010 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND it3.id = pi.info_type_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\70.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--71
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS voiced_char, MIN(n.name) AS voicing_actress, MIN(t.title) AS voiced_animation FROM aka_name an, complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, company_name cn, info_type it, info_type it3, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, name n, person_info pi, role_type rt, title t WHERE cct1.kind  ='cast' AND cct2.kind  ='complete+verified' AND chn.name  = 'Queen' AND ci.note  in ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND it3.info  = 'height' AND k.keyword  = 'computer-animation' AND mi.info  like 'USA:%200%' AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND t.title  = 'Shrek 2' AND t.production_year  between 2000 and 2005 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND it3.id = pi.info_type_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\71.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--72
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(chn.name) AS voiced_char, MIN(n.name) AS voicing_actress, MIN(t.title) AS voiced_animation FROM aka_name an, complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, char_name chn, cast_info ci, company_name cn, info_type it, info_type it3, keyword k, movie_companies mc, movie_info mi, movie_keyword mk, name n, person_info pi, role_type rt, title t WHERE cct1.kind  ='cast' AND cct2.kind  ='complete+verified' AND ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND it.info  = 'release dates' AND it3.info  = 'trivia' AND k.keyword  = 'computer-animation' AND mi.info  is not null and (mi.info like 'Japan:%200%' or mi.info like 'USA:%200%') AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND t.production_year  between 2000 and 2010 AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND cn.id = mc.company_id AND it.id = mi.info_type_id AND n.id = ci.person_id AND rt.id = ci.role_id AND n.id = an.person_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND it3.id = pi.info_type_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\72.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--73
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM company_name cn, keyword k, movie_companies mc, movie_keyword mk, title t WHERE cn.country_code ='[de]' AND k.keyword ='character-name-in-title' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\73.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--74
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM company_name cn, keyword k, movie_companies mc, movie_keyword mk, title t WHERE cn.country_code ='[nl]' AND k.keyword ='character-name-in-title' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\74.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--75
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM company_name cn, keyword k, movie_companies mc, movie_keyword mk, title t WHERE cn.country_code ='[sm]' AND k.keyword ='character-name-in-title' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\75.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--76
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM company_name cn, keyword k, movie_companies mc, movie_keyword mk, title t WHERE cn.country_code ='[us]' AND k.keyword ='character-name-in-title' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id;
spool "C:\Users\stefa\Desktop\Work\76.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--77
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer, MIN(t.title) AS complete_violent_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, cast_info ci, info_type it1, info_type it2, keyword k, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE cct1.kind  in ('cast', 'crew') AND cct2.kind  ='complete+verified' AND ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info  in ('Horror', 'Thriller') AND n.gender  = 'm' AND t.production_year  > 2000 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\77.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--78
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer, MIN(t.title) AS complete_gore_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, cast_info ci, info_type it1, info_type it2, keyword k, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE cct1.kind  in ('cast', 'crew') AND cct2.kind  ='complete+verified' AND ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info  in ('Horror', 'Thriller') AND n.gender  = 'm' AND t.production_year  > 2000 and (t.title like '%Freddy%' or t.title like '%Jason%' or t.title like 'Saw%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\78.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--79
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer, MIN(t.title) AS complete_violent_movie FROM complete_cast cc, comp_cast_type cct1, comp_cast_type cct2, cast_info ci, info_type it1, info_type it2, keyword k, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE cct1.kind  = 'cast' AND cct2.kind  ='complete+verified' AND ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info  in ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender  = 'm' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id;
spool "C:\Users\stefa\Desktop\Work\79.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--80
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer, MIN(t.title) AS violent_liongate_movie FROM cast_info ci, company_name cn, info_type it1, info_type it2, keyword k, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.name  like 'Lionsgate%' AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info  in ('Horror', 'Thriller') AND n.gender   = 'm' AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\80.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--81
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer, MIN(t.title) AS violent_liongate_movie FROM cast_info ci, company_name cn, info_type it1, info_type it2, keyword k, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.name  like 'Lionsgate%' AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mc.note  like '%(Blu-ray)%' AND mi.info  in ('Horror', 'Thriller') AND n.gender  = 'm' AND t.production_year  > 2000 and (t.title like '%Freddy%' or t.title like '%Jason%' or t.title like 'Saw%') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\81.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--82
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi.info) AS movie_budget, MIN(mi_idx.info) AS movie_votes, MIN(n.name) AS writer, MIN(t.title) AS violent_liongate_movie FROM cast_info ci, company_name cn, info_type it1, info_type it2, keyword k, movie_companies mc, movie_info mi, movie_info_idx mi_idx, movie_keyword mk, name n, title t WHERE ci.note  in ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.name  like 'Lionsgate%' AND it1.info  = 'genres' AND it2.info  = 'votes' AND k.keyword  in ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info  in ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND k.id = mk.keyword_id AND cn.id = mc.company_id;
spool "C:\Users\stefa\Desktop\Work\82.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--83
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(lt.link) AS link_type, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie FROM keyword k, link_type lt, movie_keyword mk, movie_link ml, title t1, title t2 WHERE k.keyword ='10,000-mile-club' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id;
spool "C:\Users\stefa\Desktop\Work\83.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--84
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(lt.link) AS link_type, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie FROM keyword k, link_type lt, movie_keyword mk, movie_link ml, title t1, title t2 WHERE k.keyword ='character-name-in-title' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id;
spool "C:\Users\stefa\Desktop\Work\84.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--85
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn1.name) AS first_company, MIN(cn2.name) AS second_company, MIN(mi_idx1.info) AS first_rating, MIN(mi_idx2.info) AS second_rating, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie FROM company_name cn1, company_name cn2, info_type it1, info_type it2, kind_type kt1, kind_type kt2, link_type lt, movie_companies mc1, movie_companies mc2, movie_info_idx mi_idx1, movie_info_idx mi_idx2, movie_link  ml, title  t1, title  t2 WHERE cn1.country_code  = '[us]' AND it1.info  = 'rating' AND it2.info  = 'rating' AND kt1.kind  in ('tv series') AND kt2.kind  in ('tv series') AND lt.link  in ('sequel', 'follows', 'followed by') AND mi_idx2.info  < '3.0' AND t2.production_year  between 2005 and 2008 AND lt.id = ml.link_type_id AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND t1.id = mi_idx1.movie_id AND kt1.id = t1.kind_id AND cn1.id = mc1.company_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND it2.id = mi_idx2.info_type_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND cn2.id = mc2.company_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id;
spool "C:\Users\stefa\Desktop\Work\85.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--86
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn1.name) AS first_company, MIN(cn2.name) AS second_company, MIN(mi_idx1.info) AS first_rating, MIN(mi_idx2.info) AS second_rating, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie FROM company_name cn1, company_name cn2, info_type it1, info_type it2, kind_type kt1, kind_type kt2, link_type  lt, movie_companies mc1, movie_companies mc2, movie_info_idx mi_idx1, movie_info_idx mi_idx2, movie_link  ml, title  t1, title  t2 WHERE cn1.country_code  = '[nl]' AND it1.info  = 'rating' AND it2.info  = 'rating' AND kt1.kind  in ('tv series') AND kt2.kind  in ('tv series') AND lt.link  LIKE '%follow%' AND mi_idx2.info  < '3.0' AND t2.production_year  = 2007 AND lt.id = ml.link_type_id AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND t1.id = mi_idx1.movie_id AND kt1.id = t1.kind_id AND cn1.id = mc1.company_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND it2.id = mi_idx2.info_type_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND cn2.id = mc2.company_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id;
spool "C:\Users\stefa\Desktop\Work\86.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--87
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(cn1.name) AS first_company, MIN(cn2.name) AS second_company, MIN(mi_idx1.info) AS first_rating, MIN(mi_idx2.info) AS second_rating, MIN(t1.title) AS first_movie, MIN(t2.title) AS second_movie FROM company_name cn1, company_name cn2, info_type it1, info_type it2, kind_type kt1, kind_type kt2, link_type lt, movie_companies mc1, movie_companies mc2, movie_info_idx mi_idx1, movie_info_idx mi_idx2, movie_link ml, title t1, title t2 WHERE cn1.country_code  != '[us]' AND it1.info  = 'rating' AND it2.info  = 'rating' AND kt1.kind  in ('tv series', 'episode') AND kt2.kind  in ('tv series', 'episode') AND lt.link  in ('sequel', 'follows', 'followed by') AND mi_idx2.info  < '3.5' AND t2.production_year  between 2000 and 2010 AND lt.id = ml.link_type_id AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND t1.id = mi_idx1.movie_id AND kt1.id = t1.kind_id AND cn1.id = mc1.company_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND it2.id = mi_idx2.info_type_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND cn2.id = mc2.company_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id;
spool "C:\Users\stefa\Desktop\Work\87.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--88
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM keyword k, movie_info mi, movie_keyword mk, title t WHERE k.keyword  like '%sequel%' AND mi.info  IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\88.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--89
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM keyword k, movie_info mi, movie_keyword mk, title t WHERE k.keyword  like '%sequel%' AND mi.info  IN ('Bulgaria') AND t.production_year > 2010 AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\89.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--90
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS movie_title FROM keyword k, movie_info mi, movie_keyword mk, title t WHERE k.keyword  like '%sequel%' AND mi.info  IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id;
spool "C:\Users\stefa\Desktop\Work\90.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--91
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS movie_title FROM info_type it, keyword k, movie_info_idx mi_idx, movie_keyword mk, title t WHERE it.info ='rating' AND k.keyword  like '%sequel%' AND mi_idx.info  > '5.0' AND t.production_year > 2005 AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\91.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--92
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS movie_title FROM info_type it, keyword k, movie_info_idx mi_idx, movie_keyword mk, title t WHERE it.info ='rating' AND k.keyword  like '%sequel%' AND mi_idx.info  > '9.0' AND t.production_year > 2010 AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\92.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--93
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(mi_idx.info) AS rating, MIN(t.title) AS movie_title FROM info_type it, keyword k, movie_info_idx mi_idx, movie_keyword mk, title t WHERE it.info ='rating' AND k.keyword  like '%sequel%' AND mi_idx.info  > '2.0' AND t.production_year > 1990 AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id;
spool "C:\Users\stefa\Desktop\Work\93.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--94
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS typical_european_movie FROM company_type ct, info_type it, movie_companies mc, movie_info mi, title t WHERE ct.kind  = 'production companies' AND mc.note  like '%(theatrical)%' and mc.note like '%(France)%' AND mi.info  IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id;
spool "C:\Users\stefa\Desktop\Work\94.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--95
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS american_vhs_movie FROM company_type ct, info_type it, movie_companies mc, movie_info mi, title t WHERE ct.kind  = 'production companies' AND mc.note  like '%(VHS)%' and mc.note like '%(USA)%' and mc.note like '%(1994)%' AND mi.info  IN ('USA', 'America') AND t.production_year > 2010 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id;
spool "C:\Users\stefa\Desktop\Work\95.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--96
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(t.title) AS american_movie FROM company_type ct, info_type it, movie_companies mc, movie_info mi, title t WHERE ct.kind  = 'production companies' AND mc.note  not like '%(TV)%' and mc.note like '%(USA)%' AND mi.info  IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id;
spool "C:\Users\stefa\Desktop\Work\96.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--97
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(k.keyword) AS movie_keyword, MIN(n.name) AS actor_name, MIN(t.title) AS marvel_movie FROM cast_info ci, keyword k, movie_keyword mk, name n, title t WHERE k.keyword = 'marvel-cinematic-universe' AND n.name LIKE '%Downey%Robert%' AND t.production_year > 2010 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\97.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--98
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(k.keyword) AS movie_keyword, MIN(n.name) AS actor_name, MIN(t.title) AS hero_movie FROM cast_info ci, keyword k, movie_keyword mk, name n, title t WHERE k.keyword in ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Downey%Robert%' AND t.production_year > 2014 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\98.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--99
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(k.keyword) AS movie_keyword, MIN(n.name) AS actor_name, MIN(t.title) AS marvel_movie FROM cast_info ci, keyword k, movie_keyword mk, name n, title t WHERE k.keyword = 'marvel-cinematic-universe' AND n.name LIKE '%Downey%Robert%' AND t.production_year > 2014 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\99.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--100
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(k.keyword) AS movie_keyword, MIN(n.name) AS actor_name, MIN(t.title) AS hero_movie FROM cast_info ci, keyword k, movie_keyword mk, name n, title t WHERE k.keyword in ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Downey%Robert%' AND t.production_year > 2000 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\100.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--101
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(k.keyword) AS movie_keyword, MIN(n.name) AS actor_name, MIN(t.title) AS marvel_movie FROM cast_info ci, keyword k, movie_keyword mk, name n, title t WHERE k.keyword = 'marvel-cinematic-universe' AND n.name LIKE '%Downey%Robert%' AND t.production_year > 2000 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\101.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--102
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(k.keyword) AS movie_keyword, MIN(n.name) AS actor_name, MIN(t.title) AS hero_movie FROM cast_info ci, keyword k, movie_keyword mk, name n, title t WHERE k.keyword in ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND t.production_year > 2000 AND k.id = mk.keyword_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\102.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--103
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS of_person, MIN(t.title) AS biography_movie FROM aka_name an, cast_info ci, info_type it, link_type lt, movie_link ml, name n, person_info pi, title t WHERE an.name LIKE '%a%' AND it.info ='mini biography' AND lt.link ='features' AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'B%')) AND pi.note ='Volker Boehm' AND t.production_year BETWEEN 1980 AND 1995 AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id;
spool "C:\Users\stefa\Desktop\Work\103.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--104
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS of_person, MIN(t.title) AS biography_movie FROM aka_name an, cast_info ci, info_type it, link_type lt, movie_link ml, name n, person_info pi, title t WHERE an.name LIKE '%a%' AND it.info ='mini biography' AND lt.link ='features' AND n.name_pcode_cf LIKE 'D%' AND n.gender = 'm' AND pi.note ='Volker Boehm' AND t.production_year BETWEEN 1980 AND 1984 AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id;
spool "C:\Users\stefa\Desktop\Work\104.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--105
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(n.name) AS cast_member_name, MIN(pi.info) AS cast_member_info FROM aka_name an, cast_info ci, info_type it, link_type lt, movie_link ml, name n, person_info pi, title t WHERE an.name  is not NULL and (an.name LIKE '%a%' or an.name LIKE 'A%') AND it.info ='mini biography' AND lt.link  in ('references', 'referenced in', 'features', 'featured in') AND n.name_pcode_cf BETWEEN 'A' AND 'F' AND (n.gender = 'm' OR (n.gender = 'f' AND n.name LIKE 'A%')) AND pi.note  is not NULL AND t.production_year BETWEEN 1980 AND 2010 AND n.id = an.person_id AND n.id = pi.person_id AND ci.person_id = n.id AND t.id = ci.movie_id AND ml.linked_movie_id = t.id AND lt.id = ml.link_type_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND an.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id;
spool "C:\Users\stefa\Desktop\Work\105.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--106
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an1.name) AS actress_pseudonym, MIN(t.title) AS japanese_movie_dubbed FROM aka_name an1, cast_info ci, company_name cn, movie_companies mc, name n1, role_type rt, title t WHERE ci.note ='(voice: English version)' AND cn.country_code ='[jp]' AND mc.note like '%(Japan)%' and mc.note not like '%(USA)%' AND n1.name like '%Yo%' and n1.name not like '%Yu%' AND rt.role ='actress' AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\106.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--107
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an.name) AS acress_pseudonym, MIN(t.title) AS japanese_anime_movie FROM aka_name an, cast_info ci, company_name cn, movie_companies mc, name n, role_type rt, title t WHERE ci.note ='(voice: English version)' AND cn.country_code ='[jp]' AND mc.note like '%(Japan)%' and mc.note not like '%(USA)%' and (mc.note like '%(2006)%' or mc.note like '%(2007)%') AND n.name like '%Yo%' and n.name not like '%Yu%' AND rt.role ='actress' AND t.production_year between 2006 and 2007 and (t.title like 'One Piece%' or t.title like 'Dragon Ball Z%') AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\107.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--108
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(a1.name) AS writer_pseudo_name, MIN(t.title) AS movie_title FROM aka_name a1, cast_info ci, company_name cn, movie_companies mc, name n1, role_type rt, title t WHERE cn.country_code ='[us]' AND rt.role ='writer' AND a1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND a1.person_id = ci.person_id AND ci.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\108.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--109
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an1.name) AS costume_designer_pseudo, MIN(t.title) AS movie_with_costumes FROM aka_name an1, cast_info ci, company_name cn, movie_companies mc, name n1, role_type rt, title t WHERE cn.country_code ='[us]' AND rt.role ='costume designer' AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id;
spool "C:\Users\stefa\Desktop\Work\109.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--110
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an.name) AS alternative_name, MIN(chn.name) AS character_name, MIN(t.title) AS movie FROM aka_name an, char_name chn, cast_info ci, company_name cn, movie_companies mc, name n, role_type rt, title t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND mc.note  is not NULL and (mc.note like '%(USA)%' or mc.note like '%(worldwide)%') AND n.gender ='f' and n.name like '%Ang%' AND rt.role ='actress' AND t.production_year  between 2005 and 2015 AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\110.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--111
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an.name) AS alternative_name, MIN(chn.name) AS voiced_character, MIN(n.name) AS voicing_actress, MIN(t.title) AS american_movie FROM aka_name an, char_name chn, cast_info ci, company_name cn, movie_companies mc, name n, role_type rt, title t WHERE ci.note  = '(voice)' AND cn.country_code ='[us]' AND mc.note  like '%(200%)%' and (mc.note like '%(USA)%' or mc.note like '%(worldwide)%') AND n.gender ='f' and n.name like '%Angel%' AND rt.role ='actress' AND t.production_year  between 2007 and 2010 AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\111.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--112
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an.name) AS alternative_name, MIN(chn.name) AS voiced_character_name, MIN(n.name) AS voicing_actress, MIN(t.title) AS american_movie FROM aka_name an, char_name chn, cast_info ci, company_name cn, movie_companies mc, name n, role_type rt, title t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND n.gender ='f' and n.name like '%An%' AND rt.role ='actress' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\112.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

--113
--clear cashe
alter system flush buffer_cache;
alter system flush shared_pool;
--counting time
set serveroutput on
variable n number
exec :n := dbms_utility.get_time;
SELECT MIN(an.name) AS alternative_name, MIN(chn.name) AS voiced_char_name, MIN(n.name) AS voicing_actress, MIN(t.title) AS american_movie FROM aka_name an, char_name chn, cast_info ci, company_name cn, movie_companies mc, name n, role_type rt, title t WHERE ci.note  in ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND cn.country_code ='[us]' AND n.gender ='f' AND rt.role ='actress' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id;
spool "C:\Users\stefa\Desktop\Work\113.csv"
exec dbms_output.put_line( (dbms_utility.get_time-:n)/100);
spool off;

