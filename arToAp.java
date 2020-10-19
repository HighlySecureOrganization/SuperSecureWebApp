package arToAp;

import java.io.IOException;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Types;

public class NicePosting {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		ConnectionProvider connectionProvider = new ConnectionProvider();
		NicePosting NicePosting = new NicePosting();
		CallOci callOci = new CallOci();
		String url = "jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=omegaddedbscn.0daygod.xyz)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=OTC1S_SQL)))";
		String user = "App_Admin";
String pwd = "iH#3Z$U$Z#gTCNIO6";
