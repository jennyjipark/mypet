-- 굿즈 리스트 뷰

create or replace view vwGoods as
select
    tg.seqGoods as seqGoods,
    tgco.companyname as companyname,
    tgca.seqgoodscategory as seqCategory,
    tgca.category as category,
    tig.Image as image,
    tg.goodsname as name,
    tg.price as price
from tblGoods tg 
    inner join tblGoodsCompany tgco
        on tg.seqCompany = tgco.seqCompany
            inner join tblGoodsCategory tgca
                on tg.seqGoodsCategory = tgca.seqgoodscategory
                    inner join tblImageGoods tig
                        on tg.seqImage = tig.seqImageGoods;

-- 유저 주문 내역보기
eate or replace view vwUserOrderGoods as
select 
    tog.seqOrderGoods as seqOrderGoods,
    tog.seqOrder as seqOrder,
    tu.seqUser as seqUser,
    tu.name as userName,
    tg.GoodsName as goodsName,
    tog.goodscount as goodsCnt,
    tg.price * tog.goodscount as totalPrice,
    td.deliverystate as deliveryState,
    torder.orderdate as orderDate
from tblorderGoods tog 
    inner join tblOrder torder
        on tog.seqOrder = torder.seqOrder
            left outer join tblGoods tg
                on tog.seqGoods = tg.seqGoods
                    left outer join tblUser tu
                        on torder.seqUser = tu.seqUser
                            left outer join tblDelivery td
                                on torder.seqdelivery = td.seqdelivery;




-- 신고게시판 뷰
create or replace view vwReportBoard as 
select
    trb.seqReportBoard as seqReportBoard,
    trb.seqUser as seqUser,
    tu.name as name,
    trb.title as title,
    trb.content as content,
    trb.writedate as writedate,
    trb.password as password
from tblReportBoard trb
    inner join tblUser tu
        on trb.SeqUser = tu.seqUser;




create or replace view vwReportBoardUserComment as
select
    rbc.seqreportboardcomment as seqReportBoardComment,
    rbc.seqreportboard as seqReportBoard,
    tu.name as writer,
    rbc.comments as comments,
    rbc.writedate as writedate
from tblReportBoardComment rbc 
    inner join tblUser tu
        on rbc.writer = tu.seqUser;

-- admin 댓글
create or replace view vwReportBoardAdminComment as
select
    rbc.seqreportboardcomment as seqReportBoardComment,
    rbc.seqreportboard as seqReportBoard,
    ta.id as writer,
    rbc.comments as comments,
    rbc.writedate as writedate
from tblReportBoardComment rbc 
    inner join tblAdmin ta
        on rbc.writer = ta.seqAdmin;

-- 특정 게시글에 대한 댓글
create or replace view vwReportBoardComment as       
select * from vwReportBoardUserComment
union
select * from vwReportBoardAdminComment;

-- 댓글 select
select * from vwReportBoardComment where seqReportBoard = 1;
