<%--

  Contextual Footer component.

--%><%
%><%@include file="/libs/foundation/global.jsp"%>
<%@page import="com.accenture.cq5.Footer" %>
<% Footer footer= new Footer (currentPage);
pageContext.setAttribute("footer", footer);
 %>
<footer>
    <nav>
    </nav>
    <%=currentStyle.get("disclaimer", "Edit Disclaimer in Design")%>
</footer>