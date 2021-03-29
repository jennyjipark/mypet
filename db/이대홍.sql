
-- 전체 동물데이터 수 반환 
create or replace view vwCount
as
select 
(select count(*) from tblpet) as pet,  --전체 동물 
(select count(*) from tblpet where state =0) AS ablepet, --입양 가능 동물 
(select count(*) from tblpet where state =1) as comPet, --입양 완료된 동물
(select count(*) from tblpet where state =0 and species = 0) as dog,-- 강아지
(select count(*) from tblpet where state =0 and species = 1) as cat,-- 고양이
(select count(*) from tblpet where state =0 and species = 2) as alltype,-- 기타
(select count(*) from tblshelter) as shelter, --보호소 수 
(select count(*) from tblvet) as vet, -- 병원 수  
( select count(*) from tbluser) as alluser 
from dual;



-- 동물 데이터 
create or replace view vwAnimalData
as
select 
    ad.seqanimaldata,
    l.location,
    to_char(d.yearmonth,'yyyy-MM') as ymdate,
    ad.euthanasia,
    ad.adoption,
    ad.death,
    ad.return as returning,
    ad.semifarming,
    ad.protection,
    ad.donation
from tblanimaldata ad 
    inner join tbldate d on d.seqdate = ad.seqdate
    inner join tbllocation l on l.seqlocation = ad.seqlocation;



--후원 데이터 
create or replace view vwSponsor
as
select 
    she.*,
    ( select sum(money) from tblsponsor 
        where to_char(donationdate, 'yyyy-mm-dd') between to_date('2020-01-01','yyyy-mm-dd') 
            and to_date('2020-12-31','yyyy-mm-dd') and seqshelter = she.seqshelter) as sponSum
from tblshelter she where she.seqshelter <> 0;
