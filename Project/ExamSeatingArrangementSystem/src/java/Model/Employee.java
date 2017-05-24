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

public class Employee extends Connect {

    /////Function for connect to the MySQL Server Database////////////
    public Employee() {
        Connect.connect_mysql();
    }

        //////////Save User Details /////
    public String saveEmployee(HashMap employeeData) {

        String SQL = "INSERT INTO employee (employee_sal, employee_first_name, employee_middle_name, employee_last_name, employee_gender, employee_address, employee_village, employee_state, employee_country, employee_landline, employee_mobile, employee_email, employee_status, employee_deparment, employee_dob, employee_nationalty, employee_manager_id, employee_role) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?);";
        int record = 0, last_inserted_id = 0;
        String error = "";

        try {
            pstmt = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, (String) employeeData.get("employee_sal"));
            pstmt.setString(2, (String) employeeData.get("employee_first_name"));
            pstmt.setString(3, (String) employeeData.get("employee_middle_name"));
            pstmt.setString(4, (String) employeeData.get("employee_last_name"));
            pstmt.setString(5, (String) employeeData.get("employee_gender"));
            pstmt.setString(6, (String) employeeData.get("employee_address"));
            pstmt.setString(7, (String) employeeData.get("employee_village"));
            pstmt.setString(8, (String) employeeData.get("employee_state"));
            pstmt.setString(9, (String) employeeData.get("employee_country"));
            pstmt.setString(10, (String) employeeData.get("employee_landline"));
            pstmt.setString(11, (String) employeeData.get("employee_mobile"));
            pstmt.setString(12, (String) employeeData.get("employee_email"));
            pstmt.setString(13, (String) employeeData.get("employee_status"));
            pstmt.setString(14, (String) employeeData.get("employee_deparment"));
            pstmt.setString(15, (String) employeeData.get("employee_dob"));
            pstmt.setString(16, (String) employeeData.get("employee_nationalty"));
            pstmt.setString(17, (String) employeeData.get("employee_manager_id"));
            pstmt.setString(18, (String) employeeData.get("employee_role"));

            record = pstmt.executeUpdate();
            /// Get the Last Insert ID ///
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                last_inserted_id = rs.getInt(1);
            }

            pstmt.close();
        } catch (Exception e) {
            StringWriter writer = new StringWriter();
            PrintWriter printWriter = new PrintWriter(writer);
            e.printStackTrace(printWriter);
            printWriter.flush();
            String stackTrace = writer.toString();
            error += "Error : " + stackTrace;
            System.out.println(" Error : " + e.toString());
        }

        /// Save Credentials to Login ////
        SQL = "INSERT INTO login (login_emp_id, login_user, login_password, login_email, login_level) VALUES (?, ?, ?, ?, ?);";
        try {
            pstmt = connection.prepareStatement(SQL);
            pstmt.setInt(1, last_inserted_id);
            pstmt.setString(2, (String) employeeData.get("employee_user"));
            pstmt.setString(3, (String) employeeData.get("employee_password"));
            pstmt.setString(4, (String) employeeData.get("employee_email"));
            pstmt.setString(5, (String) employeeData.get("employee_role"));
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
    public HashMap getEmployeeDetails(int employee_id) {
        HashMap resultsArray = new HashMap();
        int count = 0;
        try {
            String SQL = "SELECT * FROM employee WHERE employee_id = " + employee_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                resultsArray.put("employee_id", rs.getString("employee_id"));
                resultsArray.put("employee_manager_id", Integer.parseInt(rs.getString("employee_manager_id")));
                resultsArray.put("employee_role", Integer.parseInt(rs.getString("employee_role")));
                resultsArray.put("employee_sal", Integer.parseInt(rs.getString("employee_sal")));
                resultsArray.put("employee_first_name", rs.getString("employee_first_name"));
                resultsArray.put("employee_middle_name", rs.getString("employee_middle_name"));
                resultsArray.put("employee_last_name", rs.getString("employee_last_name"));
                resultsArray.put("employee_gender", rs.getString("employee_gender"));
                resultsArray.put("employee_address", rs.getString("employee_address"));
                resultsArray.put("employee_village", rs.getString("employee_village"));
                resultsArray.put("employee_state", Integer.parseInt(rs.getString("employee_state")));
                resultsArray.put("employee_country", Integer.parseInt(rs.getString("employee_country")));
                resultsArray.put("employee_landline", rs.getString("employee_landline"));
                resultsArray.put("employee_mobile", rs.getString("employee_mobile"));
                resultsArray.put("employee_email", rs.getString("employee_email"));
                resultsArray.put("employee_status", Integer.parseInt(rs.getString("employee_status")));
                resultsArray.put("employee_deparment", Integer.parseInt(rs.getString("employee_deparment")));
                resultsArray.put("employee_dob", rs.getString("employee_dob"));
                resultsArray.put("employee_nationalty", rs.getString("employee_nationalty"));
                count++;
            }
            if (count == 0) {
                resultsArray.put("employee_id", "");
                resultsArray.put("employee_manager_id", 0);
                resultsArray.put("employee_role", 0);
                resultsArray.put("employee_user", "");
                resultsArray.put("employee_sal", 0);
                resultsArray.put("employee_first_name", "");
                resultsArray.put("employee_middle_name", "");
                resultsArray.put("employee_last_name", "");
                resultsArray.put("employee_gender", "");
                resultsArray.put("employee_address", "");
                resultsArray.put("employee_village", "");
                resultsArray.put("employee_state", 0);
                resultsArray.put("employee_country", 0);
                resultsArray.put("employee_landline", "");
                resultsArray.put("employee_mobile", "");
                resultsArray.put("employee_email", "");
                resultsArray.put("employee_status", 0);
                resultsArray.put("employee_deparment", 0);
                resultsArray.put("employee_dob", "");
                resultsArray.put("employee_nationalty", "");

            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return resultsArray;
    }

    public String updateEmployee(HashMap employeeData) {
        String SQL = "UPDATE employee SET employee_sal = ?, employee_first_name = ?, employee_middle_name = ?, employee_last_name = ?, employee_gender = ?, employee_address = ?, employee_village = ?, employee_state = ?, employee_country = ?, employee_landline = ?, employee_mobile = ?, employee_email = ?, employee_status = ?, employee_deparment = ?, employee_dob = ?, employee_nationalty = ?, employee_manager_id = ?, employee_role = ? WHERE employee_id = ?";
        String error = "";

        int record = 0;
        try {
            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, (String) employeeData.get("employee_sal"));
            pstmt.setString(2, (String) employeeData.get("employee_first_name"));
            pstmt.setString(3, (String) employeeData.get("employee_middle_name"));
            pstmt.setString(4, (String) employeeData.get("employee_last_name"));
            pstmt.setString(5, (String) employeeData.get("employee_gender"));
            pstmt.setString(6, (String) employeeData.get("employee_address"));
            pstmt.setString(7, (String) employeeData.get("employee_village"));
            pstmt.setString(8, (String) employeeData.get("employee_state"));
            pstmt.setString(9, (String) employeeData.get("employee_country"));
            pstmt.setString(10, (String) employeeData.get("employee_landline"));
            pstmt.setString(11, (String) employeeData.get("employee_mobile"));
            pstmt.setString(12, (String) employeeData.get("employee_email"));
            pstmt.setString(13, (String) employeeData.get("employee_status"));
            pstmt.setString(14, (String) employeeData.get("employee_deparment"));
            pstmt.setString(15, (String) employeeData.get("employee_dob"));
            pstmt.setString(16, (String) employeeData.get("employee_nationalty"));
            pstmt.setString(17, (String) employeeData.get("employee_manager_id"));
            pstmt.setString(18, (String) employeeData.get("employee_role"));
            pstmt.setString(19, (String) employeeData.get("employee_id"));
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

    public boolean deleteEmployee(int employee_id) {
        return true;
    }

    /////Function for Getting the List////////////
    public String getStateOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("state", "state_id", "state_name", "state_id,state_name", selectedID, "1");
    }

    /////Function for Getting the List////////////

    public String getEmployeeOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("employee", "employee_id", "employee_id", "employee_id,employee_id", selectedID, "1");
    }

    /////Function for Getting the List////////////

    public String getRoleOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("roles", "role_id", "role_title", "role_id,role_title", selectedID, "1");
    }

    /////Function for Getting the List////////////

    public String getCountryOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("country", "country_id", "country_name", "country_id,country_name", selectedID, "1");
    }

    /////Function for Getting the List////////////
    public String getSalutionOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("salutions", "sl_id", "sl_name", "sl_id,sl_name", selectedID, "1");
    }

    /////Function for Getting the List////////////
    public String getStatusOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("status", "status_id", "status_name", "status_id,status_name", selectedID, "1");
    }

    /////Function for Getting the List////////////
    public String getDepartmentOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("department", "dept_id", "dept_name", "dept_id,dept_name", selectedID, "1");
    }

    	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllEmployee(String managerID) {
        int count = 0;
        String error = "";
        String SQL = "SELECT * FROM employee";

        ArrayList resultArray = new ArrayList();
        try {
            if (!managerID.equals("0")) {
                SQL = "SELECT * FROM employee WHERE employee_manager_id = " + managerID;
            }
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                HashMap results = new HashMap();
                results.put("employee_id", rs.getString("employee_id"));
                results.put("employee_role", rs.getString("employee_role"));
                results.put("employee_sal", rs.getString("employee_sal"));
                results.put("employee_first_name", rs.getString("employee_first_name"));
                results.put("employee_middle_name", rs.getString("employee_middle_name"));
                results.put("employee_last_name", rs.getString("employee_last_name"));
                results.put("employee_gender", rs.getString("employee_gender"));
                results.put("employee_address", rs.getString("employee_address"));
                results.put("employee_village", rs.getString("employee_village"));
                results.put("employee_state", rs.getString("employee_state"));
                results.put("employee_country", rs.getString("employee_country"));
                results.put("employee_landline", rs.getString("employee_landline"));
                results.put("employee_mobile", rs.getString("employee_mobile"));
                results.put("employee_email", rs.getString("employee_email"));
                results.put("employee_status", Integer.parseInt(rs.getString("employee_status")));
                results.put("employee_deparment", Integer.parseInt(rs.getString("employee_deparment")));
                results.put("employee_dob", rs.getString("employee_dob"));
                results.put("employee_nationalty", rs.getString("employee_nationalty"));
                results.put("employee_manager_id", Integer.parseInt(rs.getString("employee_manager_id")));
                count++;
                resultArray.add(results);
            }
        } catch (Exception e) {
            StringWriter writer = new StringWriter();
            PrintWriter printWriter = new PrintWriter(writer);
            e.printStackTrace(printWriter);
            printWriter.flush();
            String stackTrace = writer.toString();
            error += "Error : " + stackTrace;
            System.out.println(" Error : " + e.toString());
        }
        return resultArray;
    }

    public String getDepartment(int dept_id) {
        HashMap results = new HashMap();
        String SQL = "";
        String value = "";
        int count = 0;
        try {
            SQL = "SELECT dept_name FROM department WHERE dept_id = " + dept_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                value = rs.getString("dept_name");
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return value;
    }

    public String getStatus(int status_id) {
        HashMap results = new HashMap();
        String SQL = "";
        String value = "";
        int count = 0;
        try {
            SQL = "SELECT status_name FROM status WHERE status_id = " + status_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                value = rs.getString("status_name");
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return value;
    }

}
