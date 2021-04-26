
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Scanner;

public class PatientObservations {
	public static void main (String[] args) throws SQLException {
		int hid = -1;		//used to capture the hid
		String hname = "a"; //used to print name of whoever is using the system
		boolean valid = false;	//used to check hid validity
		if (args.length > 0) {
			hid = Integer.parseInt(args[0]);
		}
		else {	//if nothing was entered, then error occur
			throw new IllegalArgumentException("ERROR! You must enter your hospital ID!");
		}
		
		//register the driver
		try {
			DriverManager.registerDriver(new org.postgresql.Driver());
		}
		catch(Exception cnfe) {
			System.out.println("Error, something wrong with the Driver!");
		}
		
		//url, username, password used for pgsql
		String url = "jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421";
		Connection con = DriverManager.getConnection(url, "dpan3", "C<R-Pqf2");
		Statement statement = con.createStatement();
		
		//enter sql and check for validity of hid entered
		try {
			String sql = "Select hid, hname from HCP";
			System.out.println(sql);
			java.sql.ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				int hidList = rs.getInt(1);
				if (hid == hidList) {
					valid = true;
					hname = rs.getString(2);
					break;
				}
			}
			
			if (valid == false) {//if false, meaning the input id not exist in database
				System.out.println("The ID presented is not valid.");
				System.out.println("Please get the correct ID and rerun the program!");
				statement.close();
				con.close();
				System.exit(0);
			}// else it would be true
			
		}
		catch(SQLException e){
			System.out.println(e.getSQLState());
		}
		
		System.out.println("The ID entered is valid, Welcome " + hname); //hname used to print here
		Circle(hid, con, statement);	//using a method to loop	
	}
	
	
	
	public static void Circle(int hid, Connection con, Statement statement) throws SQLException {
		System.out.println("How may I help you?");
		System.out.println("###################################################");
		System.out.println("##Click ANY botton to proceed ## Click q to exit!##");
		System.out.println("###################################################");
		String enter;
		Scanner read = new Scanner(System.in);
		enter = read.nextLine();
		if (enter.equals("q")) { //if q entered, then the user would exit
			System.out.println("System logging out......Have a nice Day!");
			statement.close();
			con.close();
			System.exit(0);
		}
		else {	//if anything else, the user would have to enter information
			//iname of patient
			String iname = "";
			boolean nameLoopOut = true;
			while(nameLoopOut = true) { //check for validity of patient iname entered
				System.out.println("Please enter the name of the patient");
				iname = read.nextLine();
				String sql = "Select iname from patient";
				java.sql.ResultSet rs = statement.executeQuery(sql);
				boolean valid = false;
				while(rs.next()) {
					String names = rs.getString(1);
					if(iname == names) {
						valid = true;
						break;
					}
				}
				if (valid == false) { //not valid patient name;
					System.out.println("Please enter the correct patient information");
				}
				else {
					nameLoopOut = false;
				} // loop back till the correct patient information entered

				/*
				 * Make sure that if the user entered an incorrect (such as non-existent) 
				 * patient id, to display that message to the user. Under any kind of error conditions, 
				 * display some error message to the user, but go back to giving the two choices.
				 */
			}
			
			
			//time of observation
			System.out.println("Please enter the time of observation");
			System.out.println("If it is a current event, press t");
			System.out.println("Else enter the time in the form (YYYY-MM-DD-HH-MN)");
			enter = read.nextLine();
			String time = "";
			if (enter.equals("t")) { // added a current time function, where doctors not wanting to 
				//enter long time string, they could print out the current time and use it instead
				System.out.print("Current Time:");
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm");  
				Date date = new Date();
				System.out.println(formatter.format(date));
				time = formatter.format(date);
			}
			else {//
				System.out.print("Current Time: "+ enter);
				time = enter;
			}
			
			//Enter observation
			System.out.println("Please Enter your observations for patient "+ iname + " on " + time);
			String track = read.nextLine();
			
			//Hid
			String updateSQL = 
					"INSERT INTO observation VALUES('"+ track + "', '" + time + "', '" + 
							iname + "', " + hid + ")";
			System.out.println(updateSQL);
			statement.executeUpdate(updateSQL);
			System.out.println("Successfully added!");
			Circle(hid, con, statement);
		}
		
	}
}
