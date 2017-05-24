/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author PARAN
 */
public class Connect {

    public static PreparedStatement pstmt;
    public static Connection connection;
    public static Statement statement;
    public static ResultSet rs;

    public Connect() {
    }

    public static void connect_mysql() {
        String driver = "com.mysql.jdbc.Driver";
        String uname = "root";
        String pwd = "apcl123456";
        String url = "jdbc:mysql://localhost/esas";
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, uname, pwd);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static String getOptionList(String tablename, String Id, String name, String s4, int selectedID, String s5) {

        String retString = "";
        try {
           

                String SQL = "SELECT " + s4 + " FROM " + tablename;
                pstmt = connection.prepareStatement(SQL);
            //pstmt.setString(1, s4);
                //pstmt.setString(1, tablename);

                rs = pstmt.executeQuery();
                while (rs.next()) {
                    retString += "<option value ='" + rs.getString(Id) + "'>" + rs.getString(name) + "</option>";
                }
           

        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return retString;
    }



}
