package com.test.mypet.goods;

import lombok.Data;

@Data
public class GoodsDTO {
	
	private String seqGoods;
	private String companyName;
	private String seqCategory;
	private String category;
	private String image;
	private String name;
	private String price;
	
	//유저
	private String seqUser;
	private String goodsCnt;
	private String totalPrice;
	
	//주문내역
	private String seqOrder;
	private String userName;
	private String goodsName;
	private String deliveryState;
	
}
