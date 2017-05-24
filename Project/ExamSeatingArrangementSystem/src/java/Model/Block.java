package Model;

/**
 *
 * @author PARAN
 */
import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Block extends Connect {

    /////Function for connect to the MySQL Server Database////////////
    public Block() {
        Connect.connect_mysql();
    }

    //////////Save User Details /////

    public String saveBlock(HashMap blockData) {
        String SQL = "INSERT INTO `block` (`block_name`, `block_room_id`, `block_description`) VALUES (?, ?, ?);";
        int record = 0;
        String error = "";

        try {
            pstmt = connection.prepareStatement(SQL);
            pstmt.setString(1, (String) blockData.get("block_name"));
            pstmt.setString(2, (String) blockData.get("block_room_id"));
            pstmt.setString(3, (String) blockData.get("block_description"));

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

    public HashMap getBlockDetails(int block_id) {
        HashMap results = new HashMap();
        int count = 0;
        try {
            String SQL = "SELECT * FROM `block` WHERE block_id = " + block_id;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                results.put("block_id", rs.getString("block_id"));
                results.put("block_name", rs.getString("block_name"));
                results.put("block_room_id", Integer.parseInt(rs.getString("block_room_id")));
                results.put("block_description", rs.getString("block_description"));
                count++;
            }
            if (count == 0) {
                results.put("block_id", "");
                results.put("block_room_id", 0);
                results.put("block_name", "");
                results.put("block_description", "");
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return results;
    }

    /// Update the Block ////

    public String updateBlock(HashMap blockData) {
        String SQL = "UPDATE `block` SET `block_name` = ?,`block_room_id` = ?, `block_description` = ? WHERE `block_id` = ?;";
        String error = "";

        int record = 0;

        try {
            pstmt = connection.prepareStatement(SQL);

            pstmt.setString(1, (String) blockData.get("block_name"));
            pstmt.setString(2, (String) blockData.get("block_room_id"));
            pstmt.setString(3, (String) blockData.get("block_description"));
            pstmt.setString(4, (String) blockData.get("block_id"));

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
    public ArrayList getAllBlock() {
        String SQL = "SELECT * FROM `block`,`room`,`floor` WHERE room_id = block_room_id AND room_floor_id = floor_id";
        int count = 0;
        ArrayList resultArray = new ArrayList();
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while (rs.next()) {
                HashMap results = new HashMap();
                results.put("block_id", rs.getString("block_id"));
                results.put("block_name", rs.getString("block_name"));
                results.put("floor_name", rs.getString("floor_name"));
                results.put("room_name", rs.getString("room_name"));
                results.put("block_description", rs.getString("block_description"));

                count++;
                resultArray.add(results);
            }
        } catch (Exception e) {
            System.out.println("Error is: " + e);
        }
        return resultArray;
    }

    /////Function for Getting the List////////////

    public String getRoomOption(Integer SelID) {
        int selectedID = SelID.intValue();
        return Connect.getOptionList("room", "room_id", "room_name", "room_id,room_name", selectedID, "1");
    }

}
