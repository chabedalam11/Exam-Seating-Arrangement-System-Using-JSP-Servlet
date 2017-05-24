package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Student extends Connect {

    /////Function for connect to the MySQL Server Database////////////

    public Student() {
        Connect.connect_mysql();
    }

    //////////Save User Details /////

    public String saveStudent(HashMap studentData) {
        String SQL = "INSERT INTO `student` (`student_course_id`, `student_rollno`, `student_name`, `student_father_name`, `student_dob`, `student_mobile`, `student_details`) VALUES (?, ?, ?, ?, ?, ?, ?);";
        int record = 0;
        String error = "";

        try {
            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, (String) studentData.get("student_course_id"));
            pstmt.setString(2, (String) studentData.get("student_rollno"));
            pstmt.setString(3, (String) studentData.get("student_name"));
            pstmt.setString(4, (String) studentData.get("student_father_name"));
            pstmt.setString(5, (String) studentData.get("student_dob"));
            pstmt.setString(6, (String) studentData.get("student_mobile"));
            pstmt.setString(7, (String) studentData.get("student_details"));

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

    public HashMap getStudentDetails(int student_id) {
        HashMap results = new HashMap();
        int count = 0;
        try {
            String SQL = "SELECT * FROM `student` WHERE student_id = " + student_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                results.put("student_id", rs.getString("student_id"));
                results.put("student_course_id", Integer.parseInt(rs.getString("student_course_id")));
                results.put("student_rollno", rs.getString("student_rollno"));
                results.put("student_name", rs.getString("student_name"));
                results.put("student_father_name", rs.getString("student_father_name"));
                results.put("student_dob", rs.getString("student_dob"));
                results.put("student_details", rs.getString("student_details"));
                results.put("student_mobile", rs.getString("student_mobile"));
                count++;
            }
            if (count == 0) {
                results.put("student_id", "");
                results.put("student_course_id", 0);
                results.put("student_rollno", "");
                results.put("student_name", "");
                results.put("student_father_name", "");
                results.put("student_dob", "");
                results.put("student_details", "");
                results.put("student_mobile", "");
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return results;
    }

    /// Update the Student ////

    public String updateStudent(HashMap studentData) {
        String SQL = "UPDATE `student` SET `student_course_id` = ?, `student_rollno` = ?, `student_name` = ?, `student_father_name` = ?, `student_dob` = ?, `student_mobile` = ?, `student_details` = ? WHERE `student_id` = ?;";
        String error = "";

        int record = 0;

        try {
            pstmt = connection.prepareStatement(SQL);

            pstmt.setString(1, (String) studentData.get("student_course_id"));
            pstmt.setString(2, (String) studentData.get("student_rollno"));
            pstmt.setString(3, (String) studentData.get("student_name"));
            pstmt.setString(4, (String) studentData.get("student_father_name"));
            pstmt.setString(5, (String) studentData.get("student_dob"));
            pstmt.setString(6, (String) studentData.get("student_mobile"));
            pstmt.setString(7, (String) studentData.get("student_details"));
            pstmt.setString(8, (String) studentData.get("student_id"));

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
    public ArrayList getAllStudent() {
        String SQL = "SELECT * FROM `student`";
        int count = 0;
        ArrayList resultArray = new ArrayList();
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                HashMap results = new HashMap();
                results.put("student_id", rs.getString("student_id"));
                results.put("student_course_id", Integer.parseInt(rs.getString("student_course_id")));
                results.put("student_rollno", rs.getString("student_rollno"));
                results.put("student_name", rs.getString("student_name"));
                results.put("student_father_name", rs.getString("student_father_name"));
                results.put("student_dob", rs.getString("student_dob"));
                results.put("student_details", rs.getString("student_details"));
                results.put("student_mobile", rs.getString("student_mobile"));

                count++;
                resultArray.add(results);
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return resultArray;
    }

    /////Function for Getting the List////////////

    public String getCourseOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("course", "course_id", "course_name", "course_id,course_name", selectedID, "1");
    }
}
