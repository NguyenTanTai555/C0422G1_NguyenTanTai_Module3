package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void insertUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> selectAllUser();
    boolean deleteUser(int id) throws SQLException;
    List<User> findCountry(String country);
    List<User> sortByNameUser();
    List<User> displayListUser();
    boolean editUser(User user);
    void addUserTransaction();
}

