package com.neusoft.po;

public class RobotInfo {
	private Integer robotId;

	private String robotName;

	private String robotType;

	private String robotCompany;

	private Integer robotPrice;

	private String robotImage;

	private String robotCommit;

	private Integer robotCount;

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "RobotInfo [robotId=" + robotId + ", robotName=" + robotName
				+ ", robotType=" + robotType + ", robotCompany=" + robotCompany
				+ ", robotPrice=" + robotPrice + ", robotImage=" + robotImage
				+ ", robotCommit=" + robotCommit + ", robotCount=" + robotCount
				+ "]";
	}

	public Integer getRobotId() {
		return robotId;
	}

	public void setRobotId(Integer robotId) {
		this.robotId = robotId;
	}

	public String getRobotName() {
		return robotName;
	}

	public void setRobotName(String robotName) {
		this.robotName = robotName == null ? null : robotName.trim();
	}

	public String getRobotType() {
		return robotType;
	}

	public void setRobotType(String robotType) {
		this.robotType = robotType == null ? null : robotType.trim();
	}

	public String getRobotCompany() {
		return robotCompany;
	}

	public void setRobotCompany(String robotCompany) {
		this.robotCompany = robotCompany == null ? null : robotCompany.trim();
	}

	public Integer getRobotPrice() {
		return robotPrice;
	}

	public void setRobotPrice(Integer robotPrice) {
		this.robotPrice = robotPrice;
	}

	public String getRobotImage() {
		return robotImage;
	}

	public void setRobotImage(String robotImage) {
		this.robotImage = robotImage == null ? null : robotImage.trim();
	}

	public String getRobotCommit() {
		return robotCommit;
	}

	public void setRobotCommit(String robotCommit) {
		this.robotCommit = robotCommit == null ? null : robotCommit.trim();
	}

	public Integer getRobotCount() {
		return robotCount;
	}

	public void setRobotCount(Integer robotCount) {
		this.robotCount = robotCount;
	}
}