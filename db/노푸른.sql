
-- 채팅
--1) 조회
create or replace view vwChat
as
select 
    ct.seqChat, --채팅번호(회원)
    an.id as admin_id, --관리자
    ur.id as user_id,  --회원
    ct.sender, --보낸사람
    ct.content, --내용
    to_char(ct.writetime, 'yyyy-mm-dd hh24:mi:ss') as writeTime  --시간
from tblChat ct
    inner join tblAdmin an
    on ct.seqAdmin = an.seqAdmin
        inner join tblUser ur
            on ct.seqUser = ur.seqUser
order by ct.writetime;