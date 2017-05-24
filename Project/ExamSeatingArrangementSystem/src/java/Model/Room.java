/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Room extends Connect {

    /////Function for connect to the MySQL Server Database////////////

    public Room() {
        Connect.connect_mysql();
    }

    //////////Save User Details /////

    public String saveRoom(HashMap roomData) {
        String SQL = "INSERT INTO `room` (`room_floor_id`, `room_user_id`, `room_name`, `room_description`) VALUES (?, ?, ?, ?);";
        int record = 0;
        String error = "";

        try {
            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, (String) roomData.get("room_floor_id"));
            pstmt.setString(2, (String) roomData.get("room_user_id"));
            pstmt.setString(3, (String) roomData.get("room_name"));
            pstmt.setString(4, (String) roomData.get("room_description"));

            record = pstmt.executeUpdate();
            pstmt.close();
            connection.close();
        } catch (Exception e) {
            StringWriter writer = new StringWriter();
            PrintWriter printWriter = new PrintWriter(writer);
            e.printStackTrace(printWriter);
            printWriter.flush();
            String stackTrace = writer.toString();
            error += "Error : " + stackTrace;
            System.out.println(" Error : " + e.toString());
        }
        return error;
    }
	//////////////////Function for getting Users Details//////////	

    public HashMap getRoomDetails(int room_id) {
        HashMap results = new HashMap();
        int count = 0;
        try {
            String SQL = "SELECT * FROM `room` WHERE room_id = " + room_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                results.put("room_id", rs.getString("room_id"));
                results.put("room_user_id", Integer.parseInt(rs.getString("room_user_id")));
                results.put("room_floor_id", Integer.parseInt(rs.getString("room_floor_id")));
                results.put("room_name", rs.getString("room_name"));
                results.put("room_description", rs.getString("room_description"));
                count++;
            }
            if (count == 0) {
                results.put("room_id", "");
                results.put("room_user_id", 0);
                results.put("room_floor_id", 0);
                results.put("room_name", "");
                results.put("room_description", "");
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return results;
    }

    /// Update the Room ////

    public String updateRoom(HashMap roomData) {
        String SQL = "UPDATE `room` SET `room_floor_id` = ?, `room_user_id` = ?, `room_name` = ?, `room_description` = ? WHERE `room_id` = ?;";
        String error = "";

        int record = 0;

        try {
            pstmt = connection.prepareStatement(SQL);

            pstmt.setString(1, (String) roomData.get("room_floor_id"));
            pstmt.setString(2, (String) roomData.get("room_user_id"));
            pstmt.setString(3, (String) roomData.get("room_name"));
            pstmt.setString(4, (String) roomData.get("room_description"));
            pstmt.setString(5, (String) roomData.get("room_id"));

            record = pstmt.executeUpdate();
            pstmt.close();
            connection.close();
        } catch (Exception e) {
            StringWriter writer = new StringWriter();
            PrintWriter printWriter = new PrintWriter(writer);
            e.printStackTrace(printWriter);
            printWriter.flush();
            String stackTrace = writer.toString();
            error += "Error : " + stackTrace;
            System.out.println(" Error : " + e.toString());
        }
        return error;
    }

	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllRoom() {
        String SQL = "SELECT * FROM `room`,`employee`,`floor` WHERE room_floor_id = floor_id AND room_user_id = employee_id";
        int count = 0;
        ArrayList resultArray = new ArrayList();
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                HashMap results = new HashMap();
                results.put("room_id", rs.getString("room_id"));
                results.put("floor_name", rs.getString("floor_name"));
                results.put("room_name", rs.getString("room_name"));
                results.put("employee_name", rs.getString("employee_first_name") + " " + rs.getString("employee_last_name"));
                results.put("room_description", rs.getString("room_description"));

                count++;
                resultArray.add(results);
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return resultArray;
    }

    /////Function for Getting the List////////////

    public String getFloorOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("floor", "floor_id", "floor_name", "floor_id,floor_name", selectedID, "1");
    }

    /////Function for Getting the List////////////

    public String getUserOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("employee", "employee_id", "employee_first_name", "employee_id,employee_first_name", selectedID, "1");
    }
}
