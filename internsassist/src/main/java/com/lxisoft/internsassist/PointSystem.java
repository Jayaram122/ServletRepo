package com.lxisoft.internsassist;

public class PointSystem{

    public int gitHubPoins(Internsassist i){
        int currentPoint = i.getPoints();
        currentPoint=currentPoint+5;
        return currentPoint;
    }
    
    public int attendencePoint(Internsassist i){
        int point=i.getPoints();
        point = point+2;
        return point;
    }
}