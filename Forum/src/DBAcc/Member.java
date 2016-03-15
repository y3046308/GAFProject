package DBAcc;
 
public class Member {
	 private String id;
	 private String password;
	 private int point;
	 private int lvl;
	 
	 public Member() {}
	 public Member(String id, String password){
		 this.id = id;
		 this.password = password;
		 this.point = 0;
		 this.lvl = 0;
	 }
	 public Member(String id, String password, int point, int lvl) {
	  this.id = id;
	  this.password = password;
	  this.point = point;
	  this.lvl = lvl;
	 }
	 
	 public String getId() { return id; }
	 public void setId(String id) { this.id = id; }
	 public String getpassword() { return password; }
	 public void setpassword(String password) { this.password = password; }
	 public int getPoint() { return point; }
	 public void setPoint(int point) { this.point = point; }	 
	 public int getLvl() { return lvl; }
	 public void setLvl(int lvl) { this.lvl = lvl; }
	 public String toString() {
		 return "ID= " + id + ", password= " + password + ", POINT= " + point + 
				 ", LVL= " + lvl + "<BR>";
	 }
}
