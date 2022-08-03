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
    public List<User> findCountry(String country) {
        return userService.findCountry(country);
    }

    @Override
    public List<User> sortByNameUser() {
        return userService.sortByNameUser();
    }

    @Override
    public List<User> displayListUser() {
        return userService.displayListUser();
    }

    @Override
    public boolean editUser(User user) {
        return userService.editUser(user);
    }

    @Override
    public void addUserTransaction() {
            userService.addUserTransaction();
    }
}
