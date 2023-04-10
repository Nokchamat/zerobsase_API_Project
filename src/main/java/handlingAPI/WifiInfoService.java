package handlingAPI;
//test 37.4811992, 126.8955438
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class WifiInfoService {
	
	public void insertInfo(WifiInfo info){
		
		Connection connection = null;
		PreparedStatement prestate = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " insert into pubwifi(managenum, area, wifiname, roadname, detailaddress, setlocation, settype, setcompany, servicetype, webtype, year, inout, env, xlocation, ylocation, setdate) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			
			prestate = connection.prepareStatement(sql);
			
			prestate.setString(1, info.getManagenum());
			prestate.setString(2, info.getArea());
			prestate.setString(3, info.getWifiname());
			prestate.setString(4, info.getRoadname());
			prestate.setString(5, info.getDetailaddress());
			prestate.setString(6, info.getSetlocation());
			prestate.setString(7, info.getSettype());
			prestate.setString(8, info.getSetcompany());
			prestate.setString(9, info.getServicetype());
			prestate.setString(10, info.getWebtype());
			prestate.setString(11, info.getYear());
			prestate.setString(12, info.getInout());
			prestate.setString(13, info.getEnv());
			prestate.setString(14, info.getXlocation());
			prestate.setString(15, info.getYlocation());
			prestate.setString(16, info.getSetdate());
			
			int affected = prestate.executeUpdate();

            if (affected > 0){
                System.out.println(" 저장 성공 ");
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
		
		
		
		
		
	}
	
	public List<WifiInfo> getClosedWifi(String LAT, String LNT){
		
		System.out.println("시작");
		System.out.println(LAT);
		System.out.println(LNT);
		
		List<WifiInfo> list = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement prestate = null;
		ResultSet rs = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " select managenum,area, wifiname, roadname, detailaddress, setlocation, settype, setcompany, servicetype, webtype, year, inout, env, xlocation, ylocation, setdate " +
					" from pubwifi " +
					" where xlocation between ? and ? " +
					   " and ylocation between ? and ? ;";
					/*" limit 40 ;";*/
			
			prestate = connection.prepareStatement(sql);
			
			double latMin = Double.valueOf(LAT)-0.005;
			double latMax = Double.valueOf(LAT)+0.005;
			double lntMin = Double.valueOf(LNT)-0.005;
			double lntMax = Double.valueOf(LNT)+0.005;
			
			prestate.setString(1, String.valueOf(latMin));
			prestate.setString(2, String.valueOf(latMax));
			prestate.setString(3, String.valueOf(lntMin));
			prestate.setString(4, String.valueOf(lntMax));
			
			rs = prestate.executeQuery();
			
			double dist= 0;
			int count = 0;
			while(rs.next()) {
				
				WifiInfo info = new WifiInfo();
				
				info.setManagenum(rs.getString("managenum"));
				info.setArea(rs.getString("area"));
				info.setWifiname(rs.getString("wifiname"));
				info.setRoadname(rs.getString("roadname"));
				info.setDetailaddress(rs.getString("detailaddress").replace("\n", ""));
				info.setSetlocation(rs.getString("setlocation"));
				info.setSettype(rs.getString("settype"));
				info.setSetcompany(rs.getString("setcompany"));
				info.setServicetype(rs.getString("servicetype"));
				info.setWebtype(rs.getString("webtype"));
				info.setYear(rs.getString("year"));
				info.setInout(rs.getString("inout"));
				info.setEnv(rs.getString("env"));
				info.setXlocation(rs.getString("xlocation"));
				info.setYlocation(rs.getString("ylocation"));
				info.setSetdate(rs.getString("setdate"));
				
				dist = distance(Double.valueOf(LAT), Double.valueOf(LNT), Double.valueOf(info.getXlocation()), Double.valueOf(info.getYlocation()));

				info.setDistance(dist);
				
				list.add(info);
				
				count++;
			}
			System.out.println(count+"개 처리 완료");
			
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
		
//		for(int i=0; i<list.size(); i++) {
//			WifiInfo wi = list.get(i);
//			System.out.println(wi.getDistance());
//		}
		
		
		Collections.sort(list);
		
		return list;
		
	}
	
	public static double distance(double lat1, double lon1, double lat2, double lon2) {

        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;

        dist = dist * 1.609344; //키로미터로 변환
        
        return (double)(Math.round(dist*10000))/10000;
    }

    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

    
    public WifiInfo getDetail(String manageNum) {
    	
    	WifiInfo info = new WifiInfo();
    	
    	Connection connection = null;
		PreparedStatement prestate = null;
		ResultSet rs = null;
		String dbFile = "D:\\WorkSpace\\eclipse_workspace\\Public-Wifi\\src\\main\\webapp\\publicwifi.db";
		String dbFileUrl = "jdbc:sqlite:"+dbFile;
		// test 37.4811992, 126.8955438
		
		try {
			
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(dbFileUrl);
			System.out.println("SQLite DB Connected");
			
			String sql = " select managenum,area,wifiname,roadname,detailaddress,setlocation,settype,setcompany,servicetype,webtype,year,inout,env,xlocation,ylocation,setdate " +
					" from pubwifi " +
					" where managenum = ?; " ;
			
			prestate = connection.prepareStatement(sql);
			
			prestate.setString(1, manageNum);
			
			rs = prestate.executeQuery();
			while(rs.next()) {
				
				info.setManagenum(rs.getString("managenum"));
				info.setArea(rs.getString("area"));
				info.setWifiname(rs.getString("wifiname"));
				info.setRoadname(rs.getString("roadname"));
				info.setDetailaddress(rs.getString("detailaddress"));
				info.setSetlocation(rs.getString("setlocation"));
				info.setSettype(rs.getString("settype"));
				info.setSetcompany(rs.getString("setcompany"));
				info.setServicetype(rs.getString("servicetype"));
				info.setWebtype(rs.getString("webtype"));
				info.setYear(rs.getString("year"));
				info.setInout(rs.getString("inout"));
				info.setEnv(rs.getString("env"));
				info.setXlocation(rs.getString("xlocation"));
				info.setYlocation(rs.getString("ylocation"));
				info.setSetdate(rs.getString("setdate"));
				
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
		
    	
    	return info;
    	
    }
    
}
