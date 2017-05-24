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

public class Floor extends Connect {

    /////Function for connect to the MySQL Server Database////////////
    public Floor() {
        Connect.connect_mysql();
    }

    //////////Save User Details /////

    public String saveFloor(HashMap floorData) {
        String SQL = "INSERT INTO `floor` (`floor_name`, `floor_description`) VALUES (?, ?);";
        int record = 0;
        String error = "";

        try {
            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, (String) floorData.get("floor_name"));
            pstmt.setString(2, (String) floorData.get("floor_description"));

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

    public HashMap getFloorDetails(int floor_id) {
        HashMap results = new HashMap();
        int count = 0;
        try {
            String SQL = "SELECT * FROM `floor` WHERE floor_id = " + floor_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                results.put("floor_id", rs.getString("floor_id"));
                results.put("floor_name", rs.getString("floor_name"));
                results.put("floor_description", rs.getString("floor_description"));
                count++;
            }
            if (count == 0) {
                results.put("floor_id", "");
                results.put("floor_name", "");
                results.put("floor_description", "");
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return results;
    }

    /// Update the Floor ////

    public String updateFloor(HashMap floorData) {
        String SQL = "UPDATE `floor` SET `floor_name` = ?, `floor_description` = ? WHERE `floor_id` = ?;";
        String error = "";

        int record = 0;

        try {
            pstmt = connection.prepareStatement(SQL);

            pstmt.setString(1, (String) floorData.get("floor_name"));
            pstmt.setString(2, (String) floorData.get("floor_description"));
            pstmt.setString(3, (String) floorData.get("floor_id"));

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
    public ArrayList getAllFloor() {
        String SQL = "SELECT * FROM `floor`";
        int count = 0;
        ArrayList resultArray = new ArrayList();
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                HashMap results = new HashMap();
                results.put("floor_id", rs.getString("floor_id"));
                results.put("floor_name", rs.getString("floor_name"));
                results.put("floor_description", rs.getString("floor_description"));

                count++;
                resultArray.add(results);
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return resultArray;
    }

}
