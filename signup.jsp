<%@include file="db.jsp" %>
<%@page errorPage="error.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*" %>


<%
String fn=request.getParameter("fn");
String ln=request.getParameter("ln");
String email=request.getParameter("email");
String username=request.getParameter("username");
String password=request.getParameter("password");

String qr="insert into user values(?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, fn);
ps.setString(2, ln);
ps.setString(3, email);
ps.setString(4, username);
ps.setString(5, password);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("login.jsp");
}
else
{
	RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
	rd.include(request, response);
}
%>