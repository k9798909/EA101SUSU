package com.buyCar.model;

import java.io.Serializable;

public class BuyCarVO implements Serializable {
	private String commNo;
	private String commName;
	private String buyQuantity;
	private String buyPrice;
	
	public BuyCarVO() {
		
	}
	
	public BuyCarVO(String commNo, String commName, String buyQuantity, String buyPrice) {
		this.commNo = commNo;
		this.commName = commName;
		this.buyQuantity = buyQuantity;
		this.buyPrice = buyPrice;
	}
	
	
	
	public String getCommNo() {
		return commNo;
	}



	public void setCommNo(String commNo) {
		this.commNo = commNo;
	}



	public String getCommName() {
		return commName;
	}



	public void setCommName(String commName) {
		this.commName = commName;
	}



	public String getBuyQuantity() {
		return buyQuantity;
	}



	public void setBuyQuantity(String buyQuantity) {
		this.buyQuantity = buyQuantity;
	}



	public String getBuyPrice() {
		return buyPrice;
	}



	public void setBuyPrice(String buyPrice) {
		this.buyPrice = buyPrice;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commName == null) ? 0 : commName.hashCode());
		result = prime * result + ((commNo == null) ? 0 : commNo.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BuyCarVO other = (BuyCarVO) obj;
		if (commName == null) {
			if (other.commName != null)
				return false;
		} else if (!commName.equals(other.commName))
			return false;
		if (commNo == null) {
			if (other.commNo != null)
				return false;
		} else if (!commNo.equals(other.commNo))
			return false;
		return true;
	}
	
	


	
	
}
