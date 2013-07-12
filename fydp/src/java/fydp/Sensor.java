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
    private int flow;
    private DateTime ftime;
    
    public Sensor(int flow, String id) {
        this.flow = flow;
        this.ftime = ftime;
    }
    
    public int GetFlow(){
        return flow;
    }
    
    public DateTime Getftime(){
        return ftime;
    }
}
