
/*동물병원 조회*/
select * from tblVet;

select * from tblVet where name like '%검색어%';

/*보호소 조회*/
create or replace view vwShelter
as
select 
    s.seqShelter as seqShelter,            --번호
    s.image as image,               --이미지                           
    s.name as name,                 --이름
    s.address as address,           --주소
    s.tel as tel,                   --전화번호
    s.account as account,           --후원계좌
    s.time as time,                 --운영시간
    s.content as content,           --소개
    to_char(v.startDate, 'yyyy/mm/dd') as startDate,        --봉사 시작일
    to_char(v.endDate, 'yyyy/mm/dd') as endDate             --봉사 종료일
from tblShelter s
    inner join tblVolunteer v
        on s.seqShelter = v.seqShelter;
 


/*보호소 봉사*/
create or replace view vwShelter
as
select 
    s.seqShelter as seqShelter,            --번호
    s.name as name,                 --이름
    to_char(v.startDate, 'yyyy/mm/dd') as startDate,        --봉사 시작일
    to_char(v.endDate, 'yyyy/mm/dd') as endDate             --봉사 종료일
from tblShelter s
    inner join tblVolunteer v
        on s.seqShelter = v.seqShelter;
    
        
select * from vwShelter;
        
        
/*지역 검색*/

create or replace view vwLocationDetail
as
select
    l.seqLocation as seqLocation,
    l.location as location,
    ld.locationdetail as locationdetail
from tblLocationDetail ld
    inner join tblLocation l
        on l.seqLocation = ld.seqLocation;

        
/*FAQ*/
create or replace view vwFAQ
as
select 
    f.seqFAQ as seqFaq, 
    fc.category as category, 
    f.title as title, 
    f.content as content 
from tblFAQ f 
    inner join tblFAQCategory fc 
        on f.seqCategory = fc.seqFAQCategory;
        
        
       

