package com.food.out.model;

import java.math.BigDecimal;
import java.util.Date;

public class Shop {
    private Integer id;

    private Integer userId;

    private String shopName;

    private String shopLogUrl;

    private Integer shopType;

    private BigDecimal leastMon;

    private BigDecimal sendMon;

    private BigDecimal packageMon;

    private Date startTime;

    private Date endTime;

    private Integer auditState;
    
    private Integer status;

    private Integer isDel;
    
    private Date updateTime;
    
    private Date createTime;
    
    private String businessScope;
    
    private String licenseUrl;
    
    private String licenseNum;
    
    private String school;
    
    private String contactName;
    
    private String contactCell;
    
    private String contactUrl;
    
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
    }

    public String getShopLog() {
        return shopLogUrl;
    }

    public void setShopLog(String shopLog) {
        this.shopLogUrl = shopLogUrl == null ? null : shopLogUrl.trim();
    }

    public Integer getShopType() {
        return shopType;
    }

    public void setShopType(Integer shopType) {
        this.shopType = shopType;
    }

    public BigDecimal getLeastMon() {
        return leastMon;
    }

    public void setLeastMon(BigDecimal leastMon) {
        this.leastMon = leastMon;
    }

    public BigDecimal getSendMon() {
        return sendMon;
    }

    public void setSendMon(BigDecimal sendMon) {
        this.sendMon = sendMon;
    }

    public BigDecimal getPackageMon() {
        return packageMon;
    }

    public void setPackageMon(BigDecimal packageMon) {
        this.packageMon = packageMon;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getAuditState() {
        return auditState;
    }

    public void setAuditState(Integer auditState) {
        this.auditState = auditState;
    }

    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

	public String getShopLogUrl() {
		return shopLogUrl;
	}

	public void setShopLogUrl(String shopLogUrl) {
		this.shopLogUrl = shopLogUrl;
	}

	public String getBusinessScope() {
		return businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	public String getLicenseUrl() {
		return licenseUrl;
	}

	public void setLicenseUrl(String licenseUrl) {
		this.licenseUrl = licenseUrl;
	}

	public String getLicenseNum() {
		return licenseNum;
	}

	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactCell() {
		return contactCell;
	}

	public void setContactCell(String contactCell) {
		this.contactCell = contactCell;
	}

	public String getContactUrl() {
		return contactUrl;
	}

	public void setContactUrl(String contactUrl) {
		this.contactUrl = contactUrl;
	}

	/**
	 * @return the updateTime
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
    
    
}