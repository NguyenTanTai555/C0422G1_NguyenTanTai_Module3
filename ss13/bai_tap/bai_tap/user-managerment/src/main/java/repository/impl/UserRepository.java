package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name,email,country) values(?,?,?);";
    private static final String SELECT_USER_BY_ID = "SELECT id,name,email,country FROM users where id = ?;";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users ;";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id= ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?,email =?,country=? where id = ?";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    private static final String SORT_BY_NAME = "SELECT * FROM users ORDER BY users.name;";
    private static final String QUERY_DISPLAY_LIST_USER = "CALL display_list_user();";
    private static final String QUERY_UPDATE_USER = "call update_user(?,?,?,?);";
    private static final String QUERY_DELETE_USER_SP = "CALL delete_user(?)";
    private static final String QUERY_SELECT_USER_SP = "CALL select_all_user()";

    BaseRepository baseRepository = new BaseRepository();

    public UserRepository(){
    }
    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try
            (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)){
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            printSQLException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try
                (Connection connection = BaseRepository.getConnection();
            CallableStatement callableStatement = connection.prepareCall(QUERY_SELECT_USER_SP)){
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user =  new User(id,name,email,country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


    @Override
    public List<User> selectAllUser(){
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(QUERY_SELECT_USER_SP);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }


    @Override
    public boolean deleteUser(int id) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(QUERY_DELETE_USER_SP);
            callableStatement.setInt(1,id);
            boolean rowDeleted = callableStatement.executeUpdate() > 0;
            return rowDeleted;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> findCountry(String country) {
        List<User> userList  = new ArrayList<>();

        try(Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);) {

            preparedStatement.setString(1, "%"+country+"%");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                country = rs.getString("country");
                userList.add(new User(id, name, email,country));
            }
        }
        catch(SQLException e){
            printSQLException(e);
        }
        return userList ;
    }

    @Override
    public List<User> sortByNameUser() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection(); PreparedStatement statement = connection.prepareStatement(SORT_BY_NAME);){
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> displayListUser() {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(QUERY_DISPLAY_LIST_USER);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;

    }

    @Override
    public boolean editUser(User user) {
        Connection connection = baseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(QUERY_UPDATE_USER);
            callableStatement.setInt(1,user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3,user.getEmail());
            callableStatement.setString(4,user.getCountry());
          int  rowUpdate = callableStatement.executeUpdate();
          return rowUpdate>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
