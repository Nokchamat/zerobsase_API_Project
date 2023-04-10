package handlingAPI;

public class WifiInfo implements Comparable<WifiInfo>{
	
	private String managenum;
	private String area;
	private String wifiname;
	private String roadname;
	private String detailaddress;
	private String setlocation;
	private String settype;
	private String setcompany;
	private String servicetype;
	private String webtype;
	private String year;
	private String inout;
	private String env;
	private String xlocation;
	private String ylocation;
	public Double distance;
	
	
	public String getManagenum() {
		return managenum;
	}

	public void setManagenum(String managenum) {
		this.managenum = managenum;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getWifiname() {
		return wifiname;
	}

	public void setWifiname(String wifiname) {
		this.wifiname = wifiname;
	}

	public String getRoadname() {
		return roadname;
	}

	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getSetlocation() {
		return setlocation;
	}

	public void setSetlocation(String setlocation) {
		this.setlocation = setlocation;
	}

	public String getSettype() {
		return settype;
	}

	public void setSettype(String settype) {
		this.settype = settype;
	}

	public String getSetcompany() {
		return setcompany;
	}

	public void setSetcompany(String setcompany) {
		this.setcompany = setcompany;
	}

	public String getServicetype() {
		return servicetype;
	}

	public void setServicetype(String servicetype) {
		this.servicetype = servicetype;
	}

	public String getWebtype() {
		return webtype;
	}

	public void setWebtype(String webtype) {
		this.webtype = webtype;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getInout() {
		return inout;
	}

	public void setInout(String inout) {
		this.inout = inout;
	}

	public String getEnv() {
		return env;
	}

	public void setEnv(String env) {
		this.env = env;
	}

	public String getXlocation() {
		return xlocation;
	}

	public void setXlocation(String xlocation) {
		this.xlocation = xlocation;
	}

	public String getYlocation() {
		return ylocation;
	}

	public void setYlocation(String ylocation) {
		this.ylocation = ylocation;
	}

	public String getSetdate() {
		return setdate;
	}

	public void setSetdate(String setdate) {
		this.setdate = setdate;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}

	private String setdate;


	@Override
	public int compareTo(WifiInfo o) {
		return this.distance.compareTo(o.distance);
	}
	
}
