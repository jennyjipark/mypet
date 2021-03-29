
-- 사용자 input태그에 값 입력 후 보여주는 입양예약신청서에 필요한 뷰
--응답이있는 뷰(동물병원)
create or replace view vwReservationResponse
as
select
    r.seqreservation,    --예약번호
    r.availabledate,     --예약일
    u.seqUser,--회원번호
    u.name,  -- 회원명
    
    p.seqPet,   --동물일련번호
    case 
        when p.species = 0 then '강아지'
        when p.species = 1 then '고양이'
        when p.species = 2 then '토끼'
        when p.species = 3 then '기타'
    end as species,  --축종
    p.breed,    --품종
    p.age,
    p.gender,
    p.neutralization,       --중성화여부
    p.vaccination,          --접종여부
    
    v2.seqVet,
    v2.name as hospitalName2, -- 동물보호하고잇는 병원이름
    v2.time as time2,                 -- 운영시간
    v2.tel as hospitalTel2,                  -- 전화번호
    v2.treatment as treatment2,            -- 진료과목
    v2.address as hospitalAddress2,              --병원주소
    
    ht.type,     --주거형태
    r.adoptionexperience, --반려동물 입양경험
    r.neutralizationsurgery, --중성화수술 동의

    case
        when rr.response = null then '승인대기'
        when rr.response = 0 then '거절'
        when rr.response = 1 then '승인'
    end as response,    -- 승인상태
    rr.reason as failreason           -- 응답메시지
    
from tblReservation r
    inner join tblUser u
        on u.seqUser = r.seqUser
            inner join tblPet p
                on p.seqPet = r.seqPet
                    inner join tblHouseType ht
                        on ht.seqHouseType = r.seqHouseType
                            inner join tblVet v
                                on v.seqVet = r.seqVet
                                    inner join tblReservationResponse rr
                                        on r.seqReservation = rr.seqReservation
                                                    inner join tblVet v2
                                                        on v2.seqVet = p.seqVet

;

--위의 뷰에 where seqUser = ? 로 회원의 예약정보 검색
select * from vwReservationResponse;

commit;

---- 관리자 응답 없는 뷰(동물병원)
create or replace view vwReservationNoResponse
as
select
     r.seqreservation,    --예약번호
    r.availabledate,     --예약일
    u.seqUser,--회원번호
    u.name,  -- 회원명
    u.birthdate,--생년월일
    u.tel,      --전화번호
    u.address,  --주소
    
    r.companyname, --직장명
    
    case 
        when p.species = 0 then '강아지'
        when p.species = 1 then '고양이'
        when p.species = 2 then '토끼'
        when p.species = 3 then '기타'
    end as species,  --축종
    p.breed,    --품종
    p.seqPet,   --동물일련번호
    p.age,
    p.gender,
    p.neutralization,       --중성화여부
    p.vaccination,          --접종여부
    
    r.reason, --입양하려는이유
    v.name as hospitalName, -- 동물병원이름
    v.time,                 -- 운영시간
    v.tel as hospitalTel,                  -- 전화번호
    v.treatment,            -- 진료과목
    v.address as hospitalAddress,              --병원주소
    
    v2.seqVet,
    v2.name as hospitalName2, -- 동물보호하고잇는 병원이름
    v2.time as time2,                 -- 운영시간
    v2.tel as hospitalTel2,                  -- 전화번호
    v2.treatment as treatment2,            -- 진료과목
    v2.address as hospitalAddress2,              --병원주소
    
    ht.type,     --주거형태
        r.adoptionexperience, --반려동물 입양경험
    r.neutralizationsurgery --중성화수술 동의
   
from tblReservation r
    inner join tblUser u
        on u.seqUser = r.seqUser
            inner join tblPet p
                on p.seqPet = r.seqPet
                    inner join tblHouseType ht
                        on ht.seqHouseType = r.seqHouseType
                            inner join tblVet v
                                on v.seqVet = r.seqVet
                                            inner join tblVet v2
                                                on v2.seqVet = p.seqVet
where (select count(*) from tblReservationResponse rr where rr.seqReservation = r.seqReservation)= 0
;

select * from vwReservationNoResponse 

commit;

--응답이있는 뷰(보호소)
create or replace view vwReservationResponseSh
as
select
    r.seqreservation,    --예약번호
    r.availabledate,     --예약일
    u.seqUser,--회원번호
    u.name,  -- 회원명
    u.birthdate,--생년월일
    u.tel,      --전화번호
    u.address,  --주소
    
    r.companyname, --직장명
    
    case 
        when p.species = 0 then '강아지'
        when p.species = 1 then '고양이'
        when p.species = 2 then '토끼'
        when p.species = 3 then '기타'
    end as species,  --축종
    p.breed,    --품종
    p.seqPet,   --동물일련번호
    p.age,
    p.gender,
    p.neutralization,       --중성화여부
    p.vaccination,          --접종여부
    
    r.reason, --입양하려는이유
    
    sh.seqShelter,
    sh.name as shelterName2, -- 동물보호하고잇는 보호소이름
    sh.time as time2,                 -- 운영시간
    sh.tel as shelterTel2,                  -- 전화번호
    sh.account as account,            -- 계좌번호
    sh.address as shelterAddress2,              --보호소주소
    
    ht.type,     --주거형태
    r.adoptionexperience, --반려동물 입양경험
    r.neutralizationsurgery, --중성화수술 동의

    case
        when rr.response = null then '승인대기'
        when rr.response = 0 then '거절'
        when rr.response = 1 then '승인'
    end as response,    -- 승인상태
    rr.reason as failreason           -- 응답메시지
    
from tblReservation r
    inner join tblUser u
        on u.seqUser = r.seqUser
            inner join tblPet p
                on p.seqPet = r.seqPet
                    inner join tblHouseType ht
                        on ht.seqHouseType = r.seqHouseType
                            inner join tblVet v
                                on v.seqVet = r.seqVet
                                    inner join tblReservationResponse rr
                                        on r.seqReservation = rr.seqReservation
                                                    inner join tblShelter sh
                                                        on sh.seqShelter = p.seqShelter
;


--위의 뷰에 where seqUser = ? 로 회원의 예약정보 검색
select * from vwReservationResponsesh;

commit;

---- 관리자 응답 없는 뷰(보호소)
create or replace view vwReservationNoResponseSh
as
select
     r.seqreservation,    --예약번호
    r.availabledate,     --예약일
    u.seqUser,--회원번호
    u.name,  -- 회원명
    u.birthdate,--생년월일
    u.tel,      --전화번호
    u.address,  --주소
    
    r.companyname, --직장명
    
    case 
        when p.species = 0 then '강아지'
        when p.species = 1 then '고양이'
        when p.species = 2 then '토끼'
        when p.species = 3 then '기타'
    end as species,  --축종
    p.breed,    --품종
    p.seqPet,   --동물일련번호
    p.age,
    p.gender,
    p.neutralization,       --중성화여부
    p.vaccination,          --접종여부
    
    r.reason, --입양하려는이유
    
    sh.seqShelter,
    sh.name as shelterName2, -- 동물보호하고잇는 보호소이름
    sh.time as time2,                 -- 운영시간
    sh.tel as shelterTel2,                  -- 전화번호
    sh.account as account,            -- 계좌번호
    sh.address as shelterAddress2,              --보호소주소
    
    ht.type,     --주거형태
        r.adoptionexperience, --반려동물 입양경험
    r.neutralizationsurgery --중성화수술 동의
   
from tblReservation r
    inner join tblUser u
        on u.seqUser = r.seqUser
            inner join tblPet p
                on p.seqPet = r.seqPet
                    inner join tblHouseType ht
                        on ht.seqHouseType = r.seqHouseType
                            inner join tblVet v
                                on v.seqVet = r.seqVet
                                            inner join tblShelter sh
                                                on sh.seqShelter = p.seqShelter
where (select count(*) from tblReservationResponse rr where rr.seqReservation = r.seqReservation)= 0
;

select * from vwReservationNoResponseSh;

commit;

/****************************************************************************/
--예약번호를 통해 입양예약서 출력할 정보 받아오는 뷰

create or replace view vwReservation
as
select 
    r.seqReservation,
    u.seqUser,
    u.name,
    u.birthdate,
    u.tel,
    u.address,
    
    r.companyName,
    case 
        when p.species = 0 then '강아지'
        when p.species = 1 then '고양이'
        when p.species = 2 then '토끼'
        when p.species = 3 then '기타'
    end as species,
    p.breed,
    p.seqPet,
    
    r.reason,
    
    v.name as hospitalName,
    ht.type,
    r.adoptionexperience,
    r.neutralizationsurgery
from tblReservation r
    inner join tblVet v 
        on r.seqVet = v.seqVet
            inner join tblhousetype ht
                on ht.seqhousetype = r.seqhousetype
                    inner join tblUser u
                        on u.seqUser = r.seqUser
                            inner join tblPet p
                                on p.seqPet = r.seqPet
;

select * from vwReservation where seqReservation = 39;
commit;
/****************************************************************************/

-- 입양 후기 게시판 리스트 출력 뷰


create or replace view vwAdoptionReview
as
select 
    ar.seqAdoptionReview as seqAdoptionReview,
    ar.seqUser as seqUser,
    ar.title as title,
    ar.content as content,
    ar.viewcount as viewcount,
    ar.writeDate as writeDate,
    ir.image as image
from tblAdoptionReview ar
    inner join tblImageReview ir
        on ar.seqAdoptionReview = ir.seqAdoptionReview
;

select * from vwAdoptionReview;

select * from tblAdoptionReview;

-- 리스트 용..
create or replace view vwAdoptionReviewListVer
as
select 
    a.*,
    rownum as rnum
from 
(select 
    seqAdoptionReview,
    seqUser,
    title,
    content,
    viewCount,
    writeDate,
    LISTAGG(image,',') WITHIN GROUP(ORDER BY image) image
from vwAdoptionReview
group by seqAdoptionReview, title, seqUser, content, viewcount, writeDate) a
order by seqAdoptionReview desc
;


-- 입양 후기 삭제 프로시저

create or replace procedure procDeleteAdoptionReview(
    pseq in varchar2
)
is
begin
    
    delete from tblImageReview where seqAdoptionReview = pseq;
    delete from tblAdoptionReview where seqAdoptionReview = pseq;

end procDeleteAdoptionReview;


--회원 검사 뷰
create or replace view vwUserCheck
as
select 
    seqUser, id, password 
from tblUser 
union 
select 
    seqAdmin, id, password
from tblAdmin;

select * from vwUserCheck where id='Administrator1';



