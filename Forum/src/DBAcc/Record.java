package DBAcc;

import java.sql.Timestamp;

public class Record {
	 private int num;
	 private Timestamp idate;
	 private String id;
	 private String icomment;
	 
	 public Record(){}
	 public Record(int num, Timestamp idate, String id, String icomment){
		 this.setNum(num);
		 this.setIdate(idate);
		 this.setId(id);
		 this.setIcomment(icomment);
	 }
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}	 
	public Timestamp getIdate() {
		return idate;
	}
	public void setIdate(Timestamp idate) {
		this.idate = idate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIcomment() {
		return icomment;
	}
	public void setIcomment(String icomment) {
		this.icomment = icomment;
	}
	public String toString() {
		 return "Num = " + num + ", date = " + idate + ", ID = " + id + 
				", icomment = " + icomment;
	}
}