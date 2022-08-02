package repository;

import repository.impl.UserRepository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class BaseRepository {
    public static final String URL = "jdbc:mysql://localhost:3306/user_management";
    public static final String USER = "root";
    public static final String PASS ="Macllele123";
    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL,USER,PASS);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
