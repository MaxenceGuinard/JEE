<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<style>
    table, tr, td, th {
        padding: 10px;
        border: 1px solid black;
        border-collapse: collapse;
        text-align: center;
    }
    html{
        text-align: center;
    }
    table{
        margin: 0 auto;
    }
    
    .search{
        background-color: #C0DCF3;
        border-radius: 8px;
    }
    
    .input {
        background-color: #FF796D;
        border-radius: 8px;
    }
</style>
<html>
    <head>
        <meta charset="utf-8" />
        <title>C.Claudel M.Guinard M.Poirier</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/form.css"/>" />
    </head>
    <body>
        <h1>Show all users</h1>
        <p>Total user count: ${users.size()}</p>
        <table>
            <tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Login (user name)</th></tr>
        <c:forEach items="${users}" var="user" varStatus="boucle">
        <tr><td>${user.getID()}</td><td>${user.getFirstName()}</td><td>${user.getFamilyName()}</td><td>${user.getLogin()}</td></tr>
        </c:forEach>
        </table>
        <br>
        <button class="input" type="button" onclick="input()">Input</button>
        <button class="search" type="button" onclick="search()">Search</button>
        
        <script>
            function input() {
                window.location = "index.jsp";
            }
            
            function search() {
                window.location = "search.jsp";
            }
        </script>
        
    </body>
</html>
