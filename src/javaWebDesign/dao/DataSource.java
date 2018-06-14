package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;

public class DataSource {
	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
		}catch(ClassNotFoundException e){
			throw new ExceptionInInitializerError(e);
		}
	}
	
	private static String url = "jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign";
	private static String user = "sa";
	private static String password = "12345678";
	private static int PoolSize = 100;
	
	public void  setPoolSize(int poolsize) {
		this.PoolSize = poolsize;
	}
	
	private LinkedList<Connection> pool = new LinkedList<Connection>();
	
	public DataSource() {
		try {
			for(int i=0;i<this.PoolSize;i++) {
				pool.addLast(this.createConnection());
			}
		}catch(SQLException e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public Connection getConnection() {  // 从前面开始拿连接
		return pool.removeFirst();
	}
	
	public void close(Connection conn) {  // 用完后假如到连接池（后面）
		pool.addLast(conn);
	}
	
	private Connection createConnection() throws SQLException{
		return DriverManager.getConnection(url,user,password);
	}
	
	public static void main(String[] args) {
		DataSource ds = new DataSource();
		for(int i=0;i<10;i++) {
			// 取 10 个连接，看看是否是同一个连接
			Connection conn = ds.getConnection();
			System.out.println(conn);;
			ds.close(conn);;  // 释放连接（归还给池）
		}
	}
}
