/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import com.Connect;
import java.util.HashMap;

/**
 *
 * @author medisys
 */
public class Login extends Connect {

    public Login() {
        Connect.connect_mysql();
    }

    public HashMap getLoginDetails(String login_user, String login_password) {
        HashMap resultsArray = new HashMap();
        int count = 0;
        try {
            String SQL = "SELECT * FROM login WHERE login_user = ? and login_password=?";
            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, login_user);
            pstmt.setString(2, login_password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                resultsArray.put("login_id", rs.getString("login_id"));
                resultsArray.put("login_emp_id", rs.getString("login_emp_id"));
                resultsArray.put("login_user", rs.getString("login_user"));
                resultsArray.put("login_level", rs.getString("login_level"));
                count++;
            }
            if (count == 0) {
                resultsArray.put("login_id", 0);
                resultsArray.put("login_emp_id", 0);
                resultsArray.put("login_user", "");
                resultsArray.put("login_level", 0);
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return resultsArray;
    }

    public boolean checkLogin(String login_user, String login_password) {
        boolean check = false;
        int count = 0;
        try {
            String SQL = "SELECT * FROM login WHERE login_user = ? and login_password=?";

            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, login_user);
            pstmt.setString(2, login_password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                check = true;
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }

        return check;
    }

    public boolean changePassword(String old_password, String new_password, int login_id) {
        boolean check = false;
        int count = 0;
        String tableOldPassword = "";
        try {
            String SQL = "SELECT login_password FROM login WHERE login_id = ?";

            pstmt = connection.prepareStatement(SQL);
            pstmt.setInt(1, login_id);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                System.out.println("old pass" + rs.getString(1));
                tableOldPassword = rs.getString(1);
            }
            if (tableOldPassword.equals(old_password)) {
                pstmt = connection.prepareStatement("UPDATE login SET login_password = ? WHERE login_id = ?");
                pstmt.setString(1, new_password);
                pstmt.setInt(2, login_id);
                int i = pstmt.executeUpdate();
                if(i>0){
                     check = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }

        return check;
    }

}
