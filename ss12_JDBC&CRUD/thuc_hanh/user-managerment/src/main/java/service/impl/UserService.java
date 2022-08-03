package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userService = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userService.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userService.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userService.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userService.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userService.updateUser(user);
    }

    @Override
    public List<User> findCountry(String country) {
        return userService.findCountry(country);
    }

    @Override
    public List<User> sortByNameUser() {
        return userService.sortByNameUser();
    }

    @Override
    public User getUserById(int id) {
        return userService.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userService.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
        userService.addUserTransaction(user,permisions);
    }
}
