--Ô­Ê¼--
select pasttijiannum,count(pasttijiannum) from
(select regexp_count(substr(tijianrq,1,instr(tijianrq,quezhenrq,-1)),',') as pasttijiannum  from
(select xingming, zhengjianbm,  wmsys.wm_concat(distinct to_char(tijianrq, 'yy-mm-dd')) as tijianrq, count(distinct to_char(tijianrq, 'yy-mm-dd')) as countnum,max(distinct quezhenrq) as quezhenrq
from 
(select tj_gerenzjzd_extend.*,t.quezhenrq as quezhenrq
from tj_gerenzjzd_extend,
(select xingming,zhengjianbm,min(distinct to_char(tijianrq, 'yy-mm-dd')) as quezhenrq
from tj_gerenzjzd_extend t
where zhenduanxx like '%ÑÛ%¶¯ÂöÓ²»¯%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  )
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null)
group by (xingming, zhengjianbm)
) t 
where tj_gerenzjzd_extend.xingming=t.xingming and tj_gerenzjzd_extend.zhengjianbm=t.zhengjianbm) t 
group by (xingming, zhengjianbm) order by countnum desc, tijianrq asc)t)
group by pasttijiannum order by pasttijiannum asc;

--¸ù¾ÝÊ¦ÐÖ½¨ÒéÐÞ¸Ä--
select pasttijiannum,count(pasttijiannum) from
(select regexp_count(substr(tijianrq,1,instr(tijianrq,quezhenrq,-1)),',') as pasttijiannum  from
(select e.xingming as xingming, NVL(e.zhengjianbm,' ') as zhengjianbm,  wmsys.wm_concat(distinct to_char(e.tijianrq, 'yy-mm-dd')) as tijianrq, count(distinct to_char(e.tijianrq, 'yy-mm-dd')) as countnum,max(distinct t.quezhenrq) as quezhenrq
from tj_gerenzjzd_extend e,
(select xingming,NVL(zhengjianbm,' ') as zhengjianbm,min(distinct to_char(tijianrq, 'yy-mm-dd')) as quezhenrq
from tj_gerenzjzd_extend
where zhenduanxx like '%Ö¬·¾¸Î%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  ) 
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null)
group by (xingming, zhengjianbm)
) t
where e.xingming=t.xingming and NVL(e.zhengjianbm,' ') = t.zhengjianbm
group by (t.xingming, t.zhengjianbm) order by countnum desc, tijianrq asc)t)
group by pasttijiannum order by pasttijiannum asc;
--test--
select * from (select zhenduanxx, count(zhenduanxx) from tj_gerenzjzd_extend
where zhenduanxx is not null
group by zhenduanxx having count(zhenduanxx)>1000
order by count(zhenduanxx) desc) order by zhenduanxx;
select zhenduanxx from tj_gerenzjzd_extend
where zhenduanxx like '%¸ßÄòËáÑªÖ¢%' group by zhenduanxx;
select zhenduanxx, count(zhenduanxx) from tj_gerenzjzd_extend
where zhenduanxx is not null
group by zhenduanxx;
select * from (
select zhenduanxx, count(zhenduanxx) as countz from tj_gerenzjzd_extend t
where t.zhenduanxx is not null
group by t.zhenduanxx
order by count(t.zhenduanxx) desc
)d where countz=1;
select count(*)
from tj_gerenzjzd_extend t
where zhenduanxx like '%ÊÓÍøÄ¤%'
and zhenduanxx like '%¶¯ÂöÓ²»¯%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  );

select zhenduanxx from tj_gerenzjzd_extend where zhenduanxx like '%Äò¼ì%'
group by zhenduanxx

select *
from tj_gerenzjzd_extend
where zhenduanxx like '%Ö¬·¾¸Î%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  ) 
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null)

select * from P_LABELED_TEST_RESULTS where patient_id='401101130021';
select * from P_LABELED_TEST_RESULTS where test_name like '%¹È²Ý×ª°±Ã¸%';

--»¼²¡È·ÕïÇ°--
select  'yes' as status, P_LABELED_TEST_RESULTS.TEST_RESULT
from P_LABELED_TEST_RESULTS,
(select distinct t2.tijianbm from 
(select xingming,NVL(zhengjianbm,' ') as zhengjianbm,min(distinct to_char(tijianrq, 'yy-mm-dd')) as quezhenrq
from tj_gerenzjzd_extend
where zhenduanxx like '%Ö¬·¾¸Î%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  ) 
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null)
group by (xingming, zhengjianbm))t1,
((select xingming,NVL(zhengjianbm,' ') as zhengjianbm,tijianbm,to_char(tijianrq, 'yy-mm-dd') as tijianrq from tj_gerenzjzd_extend))t2
where t1.xingming=t2.xingming and t1.zhengjianbm=t2.zhengjianbm and t1.quezhenrq=t2.tijianrq)t
where P_LABELED_TEST_RESULTS.patient_id=t.tijianbm and P_LABELED_TEST_RESULTS.test_name like '%¸ßÃÜ¶ÈÖ¬µ°°×-C%';

--¼ÆËãÄêÁä--
select floor(MONTHS_BETWEEN(sysdate,t.chushengrq)/12) from
(select distinct to_date(to_char(chushengrq, 'yyyy-MM-dd'), 'yyyy-mm-dd') as chushengrq
from tj_gerenzjzd_extend
where zhenduanxx like '%Ö¬·¾¸Î%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  ) 
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null))t£»


--Î´»¼²¡È·ÕïÇ°
select  'yes' as status, P_LABELED_TEST_RESULTS.TEST_RESULT
from P_LABELED_TEST_RESULTS,
(select distinct t2.tijianbm from 
(select xingming,NVL(zhengjianbm,' ') as zhengjianbm,min(distinct to_char(tijianrq, 'yy-mm-dd')) as quezhenrq
from tj_gerenzjzd_extend
where zhenduanxx like '%Ö¬·¾¸Î%'
	  and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'   
	  ) 
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null)
group by (xingming, zhengjianbm))t1,
((select xingming,NVL(zhengjianbm,' ') as zhengjianbm,tijianbm,to_char(tijianrq, 'yy-mm-dd') as tijianrq from tj_gerenzjzd_extend))t2
where t1.xingming=t2.xingming and t1.zhengjianbm=t2.zhengjianbm and t1.quezhenrq=t2.tijianrq)t
where P_LABELED_TEST_RESULTS.patient_id=t.tijianbm and P_LABELED_TEST_RESULTS.test_name like '%¹È±û×ª°±Ã¸%'
union all
select  'no' as status,P_LABELED_TEST_RESULTS.TEST_RESULT
from P_LABELED_TEST_RESULTS,
(select distinct t2.tijianbm from 
(select xingming,NVL(zhengjianbm,' ') as zhengjianbm,min(distinct to_char(tijianrq, 'yy-mm-dd')) as quezhenrq
from tj_gerenzjzd_extend
where not zhenduanxx like '%Ö¬·¾¸Î%' 
and (regexp_like(xingming,'\D\d{4}$') or zhengjianbm is not null)
group by (xingming, zhengjianbm))t1,
((select xingming,NVL(zhengjianbm,' ') as zhengjianbm,tijianbm,to_char(tijianrq, 'yy-mm-dd') as tijianrq from tj_gerenzjzd_extend))t2
where t1.xingming=t2.xingming and t1.zhengjianbm=t2.zhengjianbm and t1.quezhenrq=t2.tijianrq)t
where P_LABELED_TEST_RESULTS.patient_id=t.tijianbm and P_LABELED_TEST_RESULTS.test_name like '%¹È±û×ª°±Ã¸%';

--ÑéÖ¤ÕãÒ»Êý¾Ý--
select COUNT(*) from
(select tijianbm from tj_gerenzjzd_extend 
where to_char(tijianrq, 'yy-mm-dd') like '11%' and zhenduanxx like '%Ö¬·¾¸Î%'
and not (zhenduanxx like '%ÇãÏò%'
		   or  zhenduanxx like '%Ö¬·¾¸Î¿¼ÂÇ%'
		   or  zhenduanxx like '%?%'
		   or  zhenduanxx like '%£¿%'  
	  )
group by tijianbm)

select count(distinct tijianbm) from tj_gerenzjzd_extend where to_char(tijianrq, 'yy-mm-dd') like '12%'

--test--
select * from P_LABELED_TEST_RESULTS where P_LABELED_TEST_RESULTS.test_name like '%ÒÈµºËØ%';





