package com.neusoft.po;

import org.springframework.web.multipart.MultipartFile;


public class Users {
    private Integer userId;

    private String userName;

    private String userPwd;

    private String userImage;

    private String userEmail;

    private String userAddress;

    private String userPhone;

    private String userMoney;

    private String userSex;

    private String userBirth;
    private MultipartFile file;

    /**
	 * @return the file
	 */
    
    
    
    public Users() {
		// TODO Auto-generated constructor stub
	}
    
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName
				+ ", userPwd=" + userPwd + ", userImage=" + userImage
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress
				+ ", userPhone=" + userPhone + ", userMoney=" + userMoney
				+ ", userSex=" + userSex + ", userBirth=" + userBirth
				+ ", file=" + file + "]";
	}

	public MultipartFile getFile() {
		return file;
	}

	/**
	 * @param file the file to set
	 */
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage == null ? null : userImage.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserMoney() {
        return userMoney;
    }

    public void setUserMoney(String userMoney) {
        this.userMoney = userMoney == null ? null : userMoney.trim();
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex == null ? null : userSex.trim();
    }

    public String getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(String userBirth) {
        this.userBirth = userBirth == null ? null : userBirth.trim();
    }

}