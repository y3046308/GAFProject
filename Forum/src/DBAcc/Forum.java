package DBAcc;

import java.sql.Date;

public class Forum {
	private int num;
	private String title;
	private String content;
	private String id;
	private Date idate;
	private int views;
	
	public Forum(){}
	public Forum(int num, String title, String content, String id, Date idate, int views){
		this.num = num;
		this.title = title;
		this.setContent(content);
		this.id = id;
		this.idate = idate;
		this.views = views;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getIdate() {
		return idate;
	}
	public void setIdate(Date idate) {
		this.idate = idate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String toString() {
		 return "num = " + num + ", title = " + title + ", Content = " + content + 
				", ID = " + id + ", date = " + idate + ", views = " + views + "<BR>";
	}
}
