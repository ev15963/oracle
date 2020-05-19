package oraclejava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class InsertMain {

	static final String sid = "xe";
	static final String id = "scott";
	static final String pass = "tiger";

	public static void main(String[] args) {

		Connection connection = null;
		Statement stmt = null;
		try {
			// 접속할 데이타베이스의 URL을 생성
			String url = "jdbc:oracle:thin:@localhost:1521:" + sid;
			// 접속
			connection = DriverManager.getConnection(url, id, pass);
			// sql을 실행 시킬 수 있는 Statement 인스턴스 생성
			stmt = connection.createStatement();
			
			String query = 
					"INSERT INTO SAMPLE VALUES (id_sequence.nextval, 'TZUYU')";
			int result = stmt.executeUpdate(query);
			if(result != 0)
				System.out.println("삽입성공");
			else
				System.out.println("삽입실패");
			stmt.close();
			connection.close();
		} catch (Exception e) {
			System.out.println("에러:" + e.getMessage());
		}
	}
}
