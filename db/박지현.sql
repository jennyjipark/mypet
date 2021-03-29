--동물 등록

insert into tblPet values(seqPet.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
insert into tblImagePet(seqImagePet.nextVal, ?, ?);

--동물 리스트/상세보기

create or replace view vPet
as
select 
    p.seqPet as seqPet,
    p.seqVet as seqVet,
    p.seqShelter as seqShelter,
    p.species as species,
    p.breed as breed,
    p.sizes as sizes,
    p.age as age,
    case
        when p.gender = 0 then '남아'
        when p.gender = 1 then '여아'
    end as gender,
    
    case
        when p.state = 0 then '입양가능'
        when p.state = 1 then '입양완료'
        when p.state = 2 then '삭제완료'
    end as state,
    
    case 
        when  p.neutralization = 0 then 'O'
        when p.neutralization = 1 then 'X'
    end as neu,
    
    case 
        when p.vaccination = 0 then 'O'
        when p.vaccination = 1 then 'X'
    end as vaccination,
    
    img.img as img,
    v.name as nameV,
    v.address as addressV,
    v.tel as telV,
    
    s.name as nameS,
    s.address as addressS,
    s.tel as telS,
    
    a.title as title,
    a.content as content,
    a.likes as likes,
    a.seqadoption as seqAdoption
    
    
from tblPet p left outer join tblShelter s on s.seqshelter = p.seqshelter
    left outer join tblVet v on v.seqvet = p.seqVet 
        left outer join vImagePet img on p.seqpet = img.seqpet
            inner join tblAdoption a on a.seqPet = p.seqPet;
        
select * from tblpet;    
select * from tblAdoption;
select * from vpet order by seqPet asc;        
select count(*) from vPet where species = 1;
select * from (select a.*, rownum as rnum from (select * from vPet where species = 2  order by seqAdoption desc) a);
select * from vpet where seqAdoption = 1;


--봉사활동
create or replace view vVolunteer
as
select 
    v.seqVolunteer as seqVolunteer,
    v.seqShelter as seqShelter,
    to_char(v.startDate, 'yyyy-mm-dd') as startDate,
    to_char(v.endDate, 'yyyy-mm-dd') as endDate,
    v.name as name,
    v.title as title,
    v.content as content,
    v.apply as apply,
    v.recruit as recruit,
    case
        when v.apply < recruit then '모집중'
        when v.apply = recruit then '마감'
    end as state,
    v.count as count,
    v.image as image,
    to_char(v.writeDate, 'yyyy-mm-dd') as writeDate,
    s.address as address
from tblVolunteer v inner join tblShelter s on v.seqshelter = s.seqshelter;


--봉사활동 참가
create or replace view vattendVolunteer
as
select 
    u.seqUser as seqUser,
    v.title as title,
    v.name as name,
    v.seqVolunteer as seqVolunteer,
    to_char(v.startDate, 'yyyy-mm-dd') as startDate,
    to_char(v.endDate, 'yyyy-mm-dd') as endDate,
    case 
        when v.state = 0 then '모집중'
        when v.state = 1 then '마감'
    end as state
    
from tblAttendVolunteer av
    inner join tblVolunteer v on av.seqvolunteer = v.seqvolunteer
        inner join tblUser u on u.sequser = av.sequser;
        
--where u.seqUser = ?;


--찜하기
create or replace view vlike
as
select 
    u.seqUser as seqUser,
    a.seqadoption as seqAdoption,
    a.title as title,
    case 
        when p.state = 0 then '입양가능'
        when p.state = 1 then '입양완료'
    end as state,
    a.likes as likes,
    a.seqpet as seqPet,
    
    v.seqVet as seqVet,
    v.address as addressV,
    v.name as nameV,
    
    s.seqShelter as seqShelter,
    s.address as addressS,
    s.name as nameS
    
from tblLike l inner join tblAdoption a on a.seqAdoption = l.seqAdoption
    inner join tblUser u on u.seqUser = l.seqUser
        inner join tblPet p on p.seqPet = a.seqPet
             left outer join tblVet v on v.seqVet = p.seqvet
                left outer join tblShelter s on s.seqshelter = p.seqshelter;
        
--where u.seqUser = ?;
--seqShelter = null -> 동물병원 정보만 보여주기
--seqVet = null -> 보호소 정보만 보여주기


--이미지 정렬
create or replace view vImagePet
as
SELECT distinct LISTAGG(image, ',') WITHIN GROUP (ORDER BY seqImagePet asc) OVER (PARTITION BY seqpet) 
AS img, seqpet 
FROM tblImagePet order by seqPet asc;




--회원이 보는 입양리스트
create or replace view vUserPet
as
select 
    p.seqPet as seqPet,
    p.seqVet as seqVet,
    p.seqShelter as seqShelter,
    p.species as species,
    p.breed as breed,
    p.sizes as sizes,
    p.age as age,
    case
        when p.gender = 0 then '남아'
        when p.gender = 1 then '여아'
    end as gender,
    
    case
        when p.state = 0 then '입양가능'
        when p.state = 1 then '입양완료'
    end as state,
    
    case 
        when  p.neutralization = 0 then 'O'
        when p.neutralization = 1 then 'X'
    end as neu,
    
    case 
        when p.vaccination = 0 then 'O'
        when p.vaccination = 1 then 'X'
    end as vaccination,
    
    case 
        when img.img is null then 'nopic.png'
        else img.img 
    end as img,
    v.name as nameV,
    v.address as addressV,
    v.tel as telV,
    
    s.name as nameS,
    s.address as addressS,
    s.tel as telS,
    
    a.title as title,
    a.content as content,
    a.likes as likes,
    a.seqadoption as seqAdoption
    
    
from tblPet p left outer join tblShelter s on s.seqshelter = p.seqshelter
    left outer join tblVet v on v.seqvet = p.seqVet 
        left outer join vImagePet img on p.seqpet = img.seqpet
            inner join tblAdoption a on a.seqPet = p.seqPet
where p.state in(1,0);