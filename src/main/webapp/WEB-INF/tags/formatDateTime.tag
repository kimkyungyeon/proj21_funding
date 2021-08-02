<%@ tag import="java.time.format.DateTimeFormatter"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.time.temporal.TemporalAccessor"%>
<%@ attribute name="pattern" type="java.lang.String"%>
<% 
	if(pattern == null)
		pattern = "yyyy-MM-dd";
%>
<%=DateTimeFormatter.ofPattern(pattern).format(value)%>