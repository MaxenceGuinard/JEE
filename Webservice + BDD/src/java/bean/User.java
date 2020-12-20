package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class User {

    String first_name;
    String family_name;
    String login;
    int id;

    String url = "jdbc:derby://localhost:1527/Projet_JEE";
    String utilisateur = "test";
    String motDePasse = "test";
    Connection connexion = null;
    Statement statement = null;

    public List<User> readAllFromDatabase() {
        List<User> values = new ArrayList<User>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de driver");
        }
        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            statement = connexion.createStatement();
            ResultSet resultat = statement.executeQuery("SELECT id, first_name, family_name , login  FROM Users");
            while (resultat.next()) {
                int id = resultat.getInt("id");
                String first_name = resultat.getString("first_name");
                String family_name = resultat.getString("family_name");
                String login = resultat.getString("login");
                User line = new User();
                line.setID(id);
                line.setFirstName(first_name);
                line.setFamilyName(family_name);
                line.setLogin(login);
                values.add(line);
            }
            connexion.close();
        } catch (SQLException e) {
        }
        return values;
    }

    public void saveToDB(HttpServletRequest request) {
        String[] first_name = request.getParameterValues("first_name");
        String[] family_name = request.getParameterValues("family_name");
        String[] login = request.getParameterValues("login");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de driver");
        }
        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            statement = connexion.createStatement();
            for (int i = 0; i < first_name.length; i++) {
                if (!(first_name[i] == "" || family_name[i] == "" || login[i] == "")) {
                    statement.executeUpdate("INSERT INTO Users (first_name, family_name, login) VALUES ('" + first_name[i] + "','" + family_name[i] + "','" + login[i] + "')");
                }
            }
            connexion.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> searchByFirstName(HttpServletRequest request) {
        String[] _first_name = request.getParameterValues("search");
        List<User> values = new ArrayList<User>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de driver");
        }
        try {
            connexion = DriverManager.getConnection(url, utilisateur, motDePasse);
            statement = connexion.createStatement();
            
            ResultSet resultat = statement.executeQuery("SELECT id, first_name, family_name, login FROM Users WHERE first_name = '" + _first_name[0] + "'");
            while (resultat.next()) {
                int id = resultat.getInt("id");
                String first_name = resultat.getString("first_name");
                String family_name = resultat.getString("family_name");
                String login = resultat.getString("login");
                User line = new User();
                line.setID(id);
                line.setFirstName(first_name);
                line.setFamilyName(family_name);
                line.setLogin(login);
                values.add(line);
            }
            connexion.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return values;
    }

    public void setFirstName(String _first_name) {
        first_name = _first_name;
    }

    public void setFamilyName(String _family_name) {
        family_name = _family_name;
    }

    public void setLogin(String _login) {
        login = _login;
    }

    public void setID(int _id) {
        id = _id;
    }

    public String getFirstName() {
        return first_name;
    }

    public String getFamilyName() {
        return family_name;
    }

    public String getLogin() {
        return login;
    }

    public int getID() {
        return id;
    }

}
