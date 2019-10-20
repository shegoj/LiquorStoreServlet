<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<body>
<center>
<h1>
    Available Brands
</h1>
<%
List result= (List) request.getAttribute("brands");
Iterator it = result.iterator();
out.println("<br>We Now Have  <br><br>");

while(it.hasNext()){

out.println(it.next()+"<br>");

}

%>
</body>
</html>