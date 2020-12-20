<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>

    <head><title>C.Claudel M.Guinard M.Poirier</title></head>

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

        .button_in_form{
            background-color: #FF796D;
            border-radius: 8px;
        }

        .submit{
            background-color: #C4E6A2;
            border-radius: 8px;
        }

        .search {
            background-color: #C0DCF3;
            border-radius: 8px;
        }
    </style>

    <body>
        <h1>Input new user(s)</h1>
        <form method="GET" action="servlet">
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Family Name</th>
                    <th>Login (user name)</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="i" begin="0" end="2" step="1">
                    <tr>
                        <td>
                            <INPUT TYPE="TEXT" NAME="first_name" placeholder="first_name">
                        </td>
                        <td>
                            <INPUT TYPE="TEXT" NAME="family_name" placeholder="family_name">
                        </td>
                        <td>
                            <INPUT TYPE="TEXT" NAME="login" placeholder="User name">
                        </td>
                        <td>
                            <button class="button_in_form" type="button" onclick="deleteLine(this);">x </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <input class="submit" type="submit" value="Submit">
            <button class="search" type="button" onclick="search();">Search</button>
        </form>

        <script>
            function deleteLine(element) {
                var inputs = element.parentElement.parentElement.getElementsByTagName("Input");
                for (var i = 0; i < inputs.length; i++) {
                    inputs[i].value = "";
                }
            }

            function search() {
                window.location = "search.jsp";
            }
        </script>

    </body>

</html>