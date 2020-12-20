<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    .search {
        background-color: #99D1FF;
        border-radius: 6px;
    }

    input {
        margin-left: 1vh;
    }

    .input{
        background-color: #FF796D;
        border-radius: 8px;
    }
    
    .input{
        background-color: #FF796D;
        border-radius: 8px;
    }
</style>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>C.Claudel M.Guinard M.Poirier</title>
    </head>
    <body>
        <h1>Search for users</h1>

        <div>
            <form method="GET" action="servletSearch">

                <!-- <select id="monselect">
                    <option selected> All names</option>
                </select>
                : -->
                <input TYPE="TEXT" NAME="search">
                <input class="search" type="submit" value="search" onclick="toggleDisplay()"></button>
                <button class="input" type="button" onclick="input()">Input</button>
            </form>
        </div>

        <table id="search_result">
            <c:if test="${!empty users}"> 
                <br>
                <tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Login (user name)</th></tr>
                        <c:forEach items="${users}" var="user" varStatus="boucle">
                    <tr><td>${user.getID()}</td><td>${user.getFirstName()}</td><td>${user.getFamilyName()}</td><td>${user.getLogin()}</td></tr>
                </c:forEach>
            </c:if>
        </table>
        
        <script>
            function input() {
                window.location = "index.jsp";
            }
            
            function displayAll() {
                window.location = "display.jsp";
            }
            
        </script>

    </body>
</html>
