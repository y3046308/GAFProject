package DBAcc;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	public static SqlSessionFactory sqlMapper = null;
	
	public static SqlSessionFactory getSqlSession(){
		if (sqlMapper == null){
			try {
				Reader reader = Resources.getResourceAsReader("DBAcc/configuration.xml");
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
			} catch (IOException e) { e.printStackTrace(); }}
		return sqlMapper;
	}
}