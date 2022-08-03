package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
     void insertUser(User user) throws SQLException;

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

    List<User> findCountry(String country) throws SQLException;

     List<User> sortByNameUser()throws SQLException;

    List<User> displayListUser();

    boolean editUser(User user);
    void addUserTransaction();

    }

