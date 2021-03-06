<!DOCTYPE HTML>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 May 2020 00:00:00 GMT">

    <title>Todo Manager | Home</title>

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



</head>

<body>
<div>

    <ul class="navigation-bar">
        <li><a href="/">Home</a></li>
        <li><a href="new-todo">Create Plan </a></li>
        <li><a href="all-todos">All Plans</a></li>
    </ul>

</div>



<c:choose>

    <c:when test="${mode == 'MODE_HOME'}">

        <div class="container" id="homeDiv">

            <div class="jumbotron text-center">

                <h1>
          Welcome            <br> to My Scheduler

                </h1>

            </div>
            <h7> <i> <right> Practical small Project in the Spring Boot and Hibernate, JSP, ect.</right></i></h7>

        </div>

    </c:when>

    <c:when test="${mode == 'MODE_TODOS'}">

        <div class="container text-center" id="tasksDiv">

            <h3>My Plan(s) on Progressing List</h3>

            <hr>

            <div class="table-responsive">

                <table class="table table-striped table-bordered text-left">

                    <thead>

                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Date Created</th>
                        <th>Finished</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>

                    </thead>
                    <tbody>
                    <c:forEach var="todo" items="${todos}">
                        <tr>

                            <td>${todo.id}</td>
                            <td>${todo.name}</td>
                            <td>${todo.description}</td>
                            <td>${todo.dateCreate}</td>
                            <td>${todo.finished}</td>


                            <td>
                                <a href="update-todo?id=${todo.id}">
                                    <span>&#x1f589;</span></a>
                            </td>

                            <td>
                                <a href="delete-todo?id=${todo.id}">
										<span class="close-icon">
										<i class="fa fa-trash"></i></span></a>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>



    <c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">

        <div class="container">

            <form th:th:action="@{/suggest-event}" class="form-horizontal" method="POST" action="save-todo">

                    <%-- <form:errors path="*" cssClass="error" /> --%>

                <div class="text-center">
                    <h3>Manage Your Schedule (add/update)</h3>
                </div>

                <hr />

                <input type="hidden" name="id" value="${todo.id}" />

                  <div class="form-group">
<%--                      <div  id="name.errors" class="error">--%>

<%--                      </div>--%>
                        <%--@declare id="name"--%><label for="name">Name</label>
                       <input type="text" class="form-control" name="name" value="${todo.name}" />
<%--                       <form:errors path="name" cssClass="error" />--%>
                  </div>

                <div class="form-group">

                       <%--@declare id="description"--%><label for="description">Description</label>
                        <input type="text" class="form-control" name="description" value="${todo.description}" />


                </div>

                <div class="form-group">

                    <%--@declare id="finished"--%><label for="finished">Finished</label>
                    <div class="col-md-7">
                        <input type="radio" class="col-sm-1" name="finished" value="true" />
                        <span class="col-sm-1">Yes</span>
                        <input type="radio" class="col-sm-1" name="finished" value="false" checked />
                        <span class="col-sm-1">No</span>
                    </div>


            </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Save" />
                </div>


            </form>

        </div>

      </c:when>


</c:choose>
</body>
</html>