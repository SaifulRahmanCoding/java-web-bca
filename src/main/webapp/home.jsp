<%@ page import="java.util.List" %>
<%@ page import="com.enigma.login.entity.Student" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 15/06/2024
  Time: 11.30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("userID") == null) response.sendRedirect("index.jsp");
    List<Student> students = List.of(
            new Student("S1", "Rahman", "Dep 1", 35),
            new Student("S2", "Jeki", "Dep 1", 70),
            new Student("S3", "Theo", "Dep 1", 60),
            new Student("S4", "Mayayo", "Dep 1", 90),
            new Student("S5", "Tanto", "Dep 2", 30),
            new Student("S6", "Fadlan", "Dep 3", 32),
            new Student("S7", "Puad", "Dep 3", 70),
            new Student("S8", "Yahya", "Dep 3", 20)
    );

    Map<String, Integer> rowspanMap = new HashMap<>();
    Map<String, Integer> passMap = new HashMap<>();


    for (Student student : students) {
        if (student.getMark() >= 40) {
            passMap.put(student.getDepartment(),
                    passMap.getOrDefault(student.getDepartment(), 0) + 1);
        } else {
            passMap.put(student.getDepartment(),
                    passMap.getOrDefault(student.getDepartment(), 0));
        }
        if (rowspanMap.containsKey(student.getDepartment())) {
            rowspanMap.put(student.getDepartment(), rowspanMap.get(student.getDepartment()) + 1);
        } else {
            rowspanMap.put(student.getDepartment(), 1);
        }
    }

%>
<html>
<head>
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">

    <h1 class="mb-4">Welcome <%= (String) session.getAttribute("userID")%>
    </h1> <a href="logout" class="mb-3 btn btn-primary btn-sm">Logout</a>
    <table class="table table-striped">
        <thead class="table-primary">
        <tr>
            <th>Department</th>
            <th>Student ID</th>
            <th>Marks</th>
            <th>Pass</th>
        </tr>
        </thead>
        <tbody>
        <%
            String currentDepartment = "";
            for (Student student : students) {
        %>
        <tr>
            <%
                if (!student.getDepartment().equals(currentDepartment)) {
            %>
            <td rowspan="<%=rowspanMap.get(student.getDepartment())%>"
                style="vertical-align: middle; text-align: center">
                <%=student.getDepartment()%>
            </td>
            <%}%>
            <td>
                <a href="#nameModal<%=student.getStudentID()%>" data-bs-toggle="modal">
                    <%=student.getStudentID()%>
                </a>
            </td>
            <td><%=student.getMark()%>
            </td>
            <%
                if (!student.getDepartment().equals(currentDepartment)) {
                    currentDepartment = student.getDepartment();
            %>
            <td rowspan="<%=rowspanMap.get(student.getDepartment())%>"
                style="vertical-align: middle; text-align: center">
                <%=(((double) passMap.get(student.getDepartment()) / (double) rowspanMap.get(student.getDepartment())) * 100) + " %"%>
            </td>
            <%}%>
        </tr>

        <div class="modal fade" id="nameModal<%=student.getStudentID()%>" tabindex="-1"
             aria-labelledby="nameModal<%=student.getStudentID()%>Label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>Student Name</h5>
                    </div>
                    <div class="modal-body">
                        <h2>
                            <%=student.getStudentName()%>
                        </h2>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
