<%@ include file="/libs/foundation/global.jsp" %><%
%><%@ page contentType="text/html; charset=utf-8" import="
    java.util.Iterator,
    com.day.cq.wcm.api.Page,
    com.day.cq.wcm.api.PageFilter"
%><%

    final Page rootPage = currentPage.getAbsoluteParent(currentStyle.get("absParent", 2));
    if (rootPage != null) {
        final boolean showSiteTitle = !currentStyle.get("hideSiteTitle", false);
        final String rootPath = rootPage.getPath() + ".html";
        final String rootTitle = GeoHelper.getNavTitle(rootPage);
%>
<nav>
    <% if (showSiteTitle) { %>
        <h1><a href="<%= xssAPI.getValidHref(rootPath) %>"><%= xssAPI.encodeForHTML(rootTitle) %></a></h1>
    <% } %>
    <ul><%
        Iterator<Page> children = rootPage.listChildren(new PageFilter(request));
        for (int item = 1; children.hasNext(); item++) {
            final Page child = children.next();
            final String childPath = child.getPath() + ".html";
            final String childTitle = GeoHelper.getNavTitle(child);

            String className = "topnav-item-"+item;
            if (item == 1) className += " topnav-first";
            if (!children.hasNext()) className += " topnav-last";

            %><li class="<%= xssAPI.encodeForHTMLAttr(className) %>"><a href="<%= xssAPI.getValidHref(childPath) %>"><%= xssAPI.encodeForHTML(childTitle) %></a></li><%
        }
    %></ul>
</nav>
<%
    }
%>