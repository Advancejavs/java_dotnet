<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Details</title>
</head>
<body>

<h2>College Details</h2>

<table border="1">
  <tr>
    <th>College ID</th>
    <th>College Name</th>
    <th>Address</th>
  </tr>
  
  <%-- Assuming colleges is a list of College objects with attributes CollegeID, Coll_Name, and Address --%>
  <% 
    List<College> colleges = CollegeDAO.getAllColleges(); // Assuming CollegeDAO.getAllColleges() retrieves a list of colleges from the database
    for (College college : colleges) {
  %>
  <tr>
    <td><%= college.getCollegeID() %></td>
    <td><%= college.getColl_Name() %></td>
    <td><%= college.getAddress() %></td>
  </tr>
  <% } %>
  
</table>

</body>
</html>
