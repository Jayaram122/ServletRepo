package com.lxisoft.internsassist;

public class Leave {
    private int slNo;
    private String userName;
    private Object dateTime;
    private String team;
    private String leaveType;
    private String leaveStartDate;
    private String leaveEndDate;
    private String reason;

    // Getters and Setters
    public int getSlNo() { return slNo; }
    public void setSlNo(int slNo) { this.slNo = slNo; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public Object getDateTime() { return dateTime; }
    public void setDateTime(Object dateTime) { this.dateTime = dateTime; }

    public String getTeam() { return team; }
    public void setTeam(String team) { this.team = team; }

    public String getLeaveType() { return leaveType; }
    public void setLeaveType(String leaveType) { this.leaveType = leaveType; }

    public String getLeaveStartDate() { return leaveStartDate; }
    public void setLeaveStartDate(String leaveStartDate) { this.leaveStartDate = leaveStartDate; }

    public String getLeaveEndDate() { return leaveEndDate; }
    public void setLeaveEndDate(String leaveEndDate) { this.leaveEndDate = leaveEndDate; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
}
