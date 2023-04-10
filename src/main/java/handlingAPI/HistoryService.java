package handlingAPI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistoryService {
	
	public void insertHistory(String xLocation, String yLocation){
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " insert into historylist(xlocation,ylocation,selectDate) values (?,?,datetime('now','localtime')); ";
			
			prestate = connection.prepareStatement(sql);
			
			prestate.setString(1, xLocation);
			prestate.setString(2, yLocation);
			
			int affected = prestate.executeUpdate();

            if (affected > 0){
                System.out.println(" 위치 저장 성공 ");
            }else {
                System.out.println(" 위치 저장 실패 ");
            }
			
			
		}catch(Exception e){
			System.out.println(e);
		}finally { // 6. 객체 연결 해제 (CLOSD)
            // close 문장들은 try에 넣지 말고 ,finally에 넣어야함

            try {
                if (prestate != null && !prestate.isClosed()){
                	prestate.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                if (connection != null && !connection.isClosed()){
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }
		
	}
	
	public List<History> getHistory(){
		
		List<History> list = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement prestate = null;
		ResultSet rs = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " select * from historylist ";
					
			prestate = connection.prepareStatement(sql);
			
			rs = prestate.executeQuery();
			
			while(rs.next()) {
				
				History history = new History();
				
				history.setiD(rs.getString("ID"));
				history.setxLocation(rs.getString("xlocation"));
				history.setyLocation(rs.getString("ylocation"));
				history.setSelectDate(rs.getString("selectDate"));
				
				list.add(history);
			}
			
		}catch(Exception e){
			System.out.println(e);
			
		}finally { // 6. 객체 연결 해제 (CLOSD)
            // close 문장들은 try에 넣지 말고 ,finally에 넣어야함
			
			try {
                if (rs != null && !rs.isClosed()){
                    rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                if (prestate != null && !prestate.isClosed()){
                	prestate.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                if (connection != null && !connection.isClosed()){
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }
		
		
		return list;
		
	}
	
	public boolean deleteHistory(String id){
		
		boolean isComplete = false;
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " delete from historylist where id = ?; ";
			
			prestate = connection.prepareStatement(sql);
			prestate.setString(1, id);
			
			int affected = prestate.executeUpdate();

            if (affected > 0){
                System.out.println(" 삭제 성공 ");
                isComplete = true;
            }else {
                System.out.println(" 삭제 실패 ");
            }
			
			
		}catch(Exception e){
			System.out.println(e);
		}finally { // 6. 객체 연결 해제 (CLOSD)
            // close 문장들은 try에 넣지 말고 ,finally에 넣어야함

            try {
                if (prestate != null && !prestate.isClosed()){
                	prestate.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            try {
                if (connection != null && !connection.isClosed()){
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }
		
		
		return isComplete;
		
	}
	
	
	
	
	
	
	
	
}
