
package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;


public class Seat extends Connect{
    /////Function for connect to the MySQL Server Database////////////
	public Seat()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveSeat(HashMap seatData)
	{
		String SQL = "INSERT INTO `seat` (`seat_number`, `seat_block_id`, `seat_description`) VALUES (?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) seatData.get("seat_number"));
			pstmt.setString(2,(String) seatData.get("seat_block_id"));
			pstmt.setString(3,(String) seatData.get("seat_description"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Users Details//////////	
public HashMap getSeatDetails(int seat_id)
	{
        HashMap results = new HashMap();
int count=0;
		try
		{
            String SQL =  "SELECT * FROM `seat` WHERE seat_id = "+seat_id ;
statement = connection.createStatement();
rs = statement.executeQuery(SQL);
while(rs.next())
			{
				results.put("seat_id",rs.getString("seat_id"));
				results.put("seat_number",rs.getString("seat_number"));
				results.put("seat_block_id",Integer.parseInt(rs.getString("seat_block_id")));
				results.put("seat_description",rs.getString("seat_description"));
				count++;
            }
			if(count==0)
			{
				results.put("seat_id","");
				results.put("seat_block_id",0);
				results.put("seat_number","");
				results.put("seat_description","");
			}
         }
		catch(Exception e)
		 {
System.out.println("Error is: "+ e);
	 }
return results;
    }
    /// Update the Seat ////
	public String updateSeat(HashMap seatData)
	{
		String SQL = "UPDATE `seat` SET `seat_number` = ?,`seat_block_id` = ?, `seat_description` = ? WHERE `seat_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) seatData.get("seat_number"));
			pstmt.setString(2,(String) seatData.get("seat_block_id"));
			pstmt.setString(3,(String) seatData.get("seat_description"));
			pstmt.setString(4,(String) seatData.get("seat_id"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the Airport Details////////////////////  
public ArrayList getAllSeat()
	{
		String SQL = "SELECT * FROM `seat`,`block`,`room`,`floor` WHERE block_room_id = room_id AND block_id = seat_block_id AND room_floor_id = floor_id";
		int count=0;
        ArrayList resultArray = new ArrayList();
try
		{			
			statement = connection.createStatement();
rs = statement.executeQuery(SQL);
while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("seat_id",rs.getString("seat_id"));
				results.put("seat_number",rs.getString("seat_number"));
				results.put("floor_name",rs.getString("floor_name"));
				results.put("room_name",rs.getString("room_name"));
				results.put("block_name",rs.getString("block_name"));
				results.put("seat_description",rs.getString("seat_description"));
				
				count++;
resultArray.add(results);
            }
         }
		catch(Exception e)
		{
System.out.println("Error is: "+ e);
        }
return resultArray;
    }
	/////Function for Getting the List////////////
	public String getBlockOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
	return Connect.getOptionList("block","block_id","block_name","block_id,block_name",selectedID,"1");
    }
}
