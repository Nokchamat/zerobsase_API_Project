package handlingAPI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookMarkService {
	
	public boolean insertBookMarkGroup(String name, String priority){
		
		boolean isComplete = false;
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " insert into bookmarkgroup(name, priority, submitdate, modifydate) " +
					" values (?,?,datetime('now','localtime'),''); " ;
			
			prestate = connection.prepareStatement(sql);
			
			prestate.setString(1, name);
			prestate.setString(2, priority);
			
			int affected = prestate.executeUpdate();

            if (affected > 0){
                System.out.println(" 저장 성공 ");
                isComplete = true;
            }else {
                System.out.println(" 저장 실패 ");
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
	
	public List<BookMarkGroup> getGroupList(){
			
			List<BookMarkGroup> list = new ArrayList<>();
			
			Connection connection = null;
			PreparedStatement prestate = null;
			ResultSet rs = null;
			String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
			String dbFileUrl = "jdbc:sqlite:"+dbFile;
			
			try {
				
				Class.forName("org.sqlite.JDBC");
				connection = DriverManager.getConnection(dbFileUrl);
				System.out.println("SQLite DB Connected");
				
				String sql = " select * from bookmarkgroup order by priority; ";
						
				prestate = connection.prepareStatement(sql);
				
				rs = prestate.executeQuery();
				
				while(rs.next()) {
					
					BookMarkGroup bm = new BookMarkGroup();
					
					bm.setId(rs.getString("ID"));
					bm.setName(rs.getString("name"));
					bm.setpriority(rs.getString("priority"));
					bm.setSubmitDate(rs.getString("submitdate"));
					bm.setModifyDate(rs.getString("modifydate"));
					
					list.add(bm);
					
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
		
	public boolean updateGroup(String ID,String name, String priority){
		
		boolean isComplete = false;
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " update bookmarkgroup set name = ?, priority = ?,modifydate = datetime('now','localtime')  where ID = ?; ";
			
			prestate = connection.prepareStatement(sql);
			prestate.setString(1, name);
			prestate.setString(2, priority);
			prestate.setString(3, ID);
			
			int affected = prestate.executeUpdate();

            if (affected > 0){
                System.out.println(" 저장 성공 ");
                isComplete = true;
            }else {
                System.out.println(" 저장 실패 ");
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
	
	public boolean deleteGroup(String ID){
		
		boolean isComplete = false;
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " delete from bookmarkgroup where id = ?; ";
			
			prestate = connection.prepareStatement(sql);
			prestate.setString(1, ID);
			
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
	
	public BookMarkGroup getGroup(String ID){
		
		BookMarkGroup bm = new BookMarkGroup();
		
		Connection connection = null;
		PreparedStatement prestate = null;
		ResultSet rs = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " select * from bookmarkgroup where id=?; ";
					
			prestate = connection.prepareStatement(sql);
			prestate.setString(1, ID);
			
			rs = prestate.executeQuery();
			
			while(rs.next()) {
				
				bm.setId(rs.getString("ID"));
				bm.setName(rs.getString("name"));
				bm.setpriority(rs.getString("priority"));
				bm.setSubmitDate(rs.getString("submitdate"));
				bm.setModifyDate(rs.getString("modifydate"));
				
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
		
		
		return bm;
		
	}
	
	public List<BookMarkGroup> getGroupName(){
		
		List<BookMarkGroup> list = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement prestate = null;
		ResultSet rs = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " select * from bookmarkgroup; ";
					
			prestate = connection.prepareStatement(sql);
			
			rs = prestate.executeQuery();
			
			while(rs.next()) {
				
				BookMarkGroup bm = new BookMarkGroup();
				
				bm.setName(rs.getString("name"));
				bm.setId(rs.getString("id"));
				
				list.add(bm);
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
	
	
	
	
	
	
	public boolean addBookMark(String ID,String manageNum){
		
		boolean isComplete = false;
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " insert into bookmarklist (ID, manageNum, submitdate) values (?,?,datetime('now','localtime')); ";
			
			prestate = connection.prepareStatement(sql);
			prestate.setString(1, ID);
			prestate.setString(2, manageNum);
			
			int affected = prestate.executeUpdate();

            if (affected > 0){
                System.out.println(" 저장 성공 ");
                isComplete = true;
            }else {
                System.out.println(" 저장 실패 ");
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
	
	public List<BookMark> getBookMark(){
		
		List<BookMark> list = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement prestate = null;
		ResultSet rs = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " select bml.id, bmg.name, pw.wifiname, bml.submitdate, bml.manageNum, indexNum " +
							" from bookmarklist as bml " +
								" join bookmarkgroup as bmg " +
									" join pubwifi as pw " +
										" where bml.id == bmg.ID and bml.manageNum == pw.managenum; ";
					
			prestate = connection.prepareStatement(sql);
			
			rs = prestate.executeQuery();
			
			while(rs.next()) {
				
				BookMark bm = new BookMark();
				
				bm.setId(rs.getString("id"));
				bm.setName(rs.getString("name"));
				bm.setWifiName(rs.getString("wifiname"));
				bm.setSubmitDate(rs.getString("submitdate"));
				bm.setManageNum(rs.getString("manageNum"));
				bm.setIndexNum(rs.getString("indexNum"));
				
				list.add(bm);
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
	
	public boolean deleteBookMark(String indexNum){
		
		boolean isComplete = false;
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " delete from bookmarklist where indexNum = ?; ";
			
			prestate = connection.prepareStatement(sql);
			prestate.setString(1, indexNum);
			
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
