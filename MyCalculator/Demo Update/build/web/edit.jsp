<%-- 
    Document   : edit
    Created on : Sep 25, 2020, 1:42:05 PM
    Author     : sonnt
--%>

<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Department> depts = 
            (ArrayList<Department>) request.getAttribute("depts");
            Student student = (Student) request.getAttribute("student");
        %>
    </head>
    <body>
        <form action="edit" method="POST">
            ID:<input type="text" readonly="true" name="id" 
                      value="<%=student.getId()%>"  />
            Name: <input type="text" name="name" value="<%=student.getName()%>"/> <br/>
            Dob: <input type="date" name="dob" value="<%=student.getDob()%>" /><br/>
            Gender: <input type="radio" name="gender" 
                           <% if(student.isGender()){ %>
                           checked="checked"
                           <%}%>
                           value="male"/> Male
            <input type="radio" name="gender" 
                            <% if(!student.isGender()){ %>
                           checked="checked"
                           <%}%>
                   value="female"/> Female <Br/>
            Departments:
            <select name="did"> 
                <% for (Department d : depts) {
                %>
                <option 
                    <%if(d.getId() == student.getDept().getId()) {%>
                    selected="selected"
                    <%}%> 
                    value="<%=d.getId()%>"> <%=d.getName()%> 
                </option>
                <%}%>
            </select>
            <br/>
            <input type="submit" value="Save" />
        </form>
    </body>
</html>
