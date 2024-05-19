package com.rahulrambo9.k8s.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@RestController
public class SQLInjectionController {

    @GetMapping("/vulnerable")
    public String vulnerable(@RequestParam String username) {
        String result = "";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM users WHERE username = '" + username + "'";
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                result += resultSet.getString("username") + " ";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
