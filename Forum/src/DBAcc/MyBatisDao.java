package DBAcc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import DBAcc.SqlSessionManager;
import DBAcc.Member;
import DBAcc.Record;
import DBAcc.Forum;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MyBatisDao {
	List<Member> list = new ArrayList<Member>();
	public static SqlSessionFactory sqlMapper = SqlSessionManager.getSqlSession();

	public List<Member> showAll(){
		SqlSession session = sqlMapper.openSession();
		try{
			list = session.selectList("memberCall_id_pw.showAll");
			return list;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public Member idCheck(String id){
		SqlSession session = sqlMapper.openSession();	
		try{
			Member tmp = session.selectOne("memberCall_id_pw.idCheck", id);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public Member fullCheck(Member member){
		SqlSession session = sqlMapper.openSession();	
		try{
			Member tmp = session.selectOne("memberCall_id_pw.fullCheck", member);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public Member adminFullCheck(String id){
		SqlSession session = sqlMapper.openSession();	
		try{
			Member tmp = session.selectOne("memberCall_id_pw.adminFullCheck", id);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public Forum findPost(int num){
		SqlSession session = sqlMapper.openSession();	
		try{
			Forum tmp = session.selectOne("memberCall_forum.findPost", num);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Forum> searchForumWId(String id){
		SqlSession session = sqlMapper.openSession();	
		try{
			List<Forum> tmp = session.selectList("memberCall_forum.searchForumWId", id);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Forum> searchForum(Map<String, String> ele){
		SqlSession session = sqlMapper.openSession();	
		try{
			List<Forum> tmp = session.selectList("memberCall_forum.searchForum", ele);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Forum> searchForum2(Map<String, String> ele){
		SqlSession session = sqlMapper.openSession();	
		try{
			List<Forum> tmp = session.selectList("memberCall_forum.searchForum2", ele);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Member> listByLvl(){
		SqlSession session = sqlMapper.openSession();	
		try{
			list = session.selectList("memberCall_id_pw.listByLvl");
			return list;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Record> listByIdate(){
		SqlSession session = sqlMapper.openSession();
		try{
			List<Record> tmp = session.selectList("memberCall_attendance.listByIdate");
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Record> checkAttendance(String id){
		SqlSession session = sqlMapper.openSession();
		try{
			List<Record> tmp = session.selectList("memberCall_attendance.checkAttendance", id);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Record> listByIdateComment(int num){
		SqlSession session = sqlMapper.openSession();
		try{
			List<Record> tmp = session.selectList("memberCall_forum_comment.listByIdateComment", num);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public List<Forum> listByNum(Map<String, String> ele){
		SqlSession session = sqlMapper.openSession();
		try{
			List<Forum> tmp = session.selectList("memberCall_forum.listByNum", ele);
			return tmp;
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
		return null;
	}
	
	public void changePassword(Member member){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_id_pw.changePassword", member);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void adjustLvl(Member member){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_id_pw.adjustLvl", member);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void incrementLvl(Member member){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_id_pw.incrementLvl", member);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void incrementPoint(String id){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_id_pw.incrementPoint", id);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void incrementViews(int num){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_forum.incrementViews", num);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void changeIndex(Record record){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_attendance.changeIndex", record);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void changePostIndex(Map<String, Integer> a){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_forum.changePostIndex", a);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void updatePost(Forum forum){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.update("memberCall_forum.updatePost", forum);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void createAccount(Member member){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.insert("memberCall_id_pw.createAccount", member);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void insertIdate(Record record){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.insert("memberCall_attendance.insertIdate", record);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void insertForum(Forum forum){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.insert("memberCall_forum.insertForum", forum);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void insertForumComment(Record record){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.insert("memberCall_forum_comment.insertForumComment", record);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void deleteAccount(String id){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.delete("memberCall_id_pw.deleteAccount", id);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void deleteComment(int id){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.delete("memberCall_attendance.deleteComment", id);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	
	public void deletePost(int num){
		SqlSession session = sqlMapper.openSession();	
		try{
			session.delete("memberCall_forum.deletePost", num);
			session.commit();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
}