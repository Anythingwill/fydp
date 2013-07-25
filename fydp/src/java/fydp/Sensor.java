/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fydp;

import java.util.Date; 
/**
 *
 * @author Ethan
 */
public class Sensor {
    private double flow;
    private Date ftime;
    
    public Sensor(double flow, Date ftime) {
        this.flow = flow;
        this.ftime = ftime;
    }
    
    public double GetFlow(){
        return flow;
    }
    
    public Date Getftime(){
        return ftime;
    }
}
