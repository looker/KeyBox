<%@ page import="org.springframework.security.web.WebAttributes" %>
<%@ page import="org.springframework.security.authentication.CredentialsExpiredException" %>
<%
/**
* Copyright 2013 Sean Kavanagh - sean.p.kavanagh6@gmail.com
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="_res/inc/header.jsp"/>
    <title>KeyBox - Error</title>
</head>
<body>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container" >

        <div class="navbar-header">
            <div class="navbar-brand" >
                <div class="nav-img"><img src="<%= request.getContextPath() %>/img/keybox_40x40.png" alt="keybox"/></div>
            </div>
            <div class="navbar-brand">
                <a href="<%= request.getContextPath() %>/admin/menu.action">KeyBox</a>
            </div>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>

<div class="container">
    <h3>Error</h3>
    <p>An exception has occurred. Hopefully more information is displayed below. If not, contact an admin and have them check the logs for errors</p>

        <% if (request.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null && request.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) instanceof Throwable){ %>
            <% Throwable cause = (Throwable)request.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
                while(cause.getCause() != null) {
                    cause = cause.getCause();
                }
            %>

            <% if (cause.getClass().equals(CredentialsExpiredException.class)){ %>
                <div class="warning">You SSO credentials have expired, please reset your session by going <a target="_blank" href="https://login.microsoftonline.com/">here</a> and logging in</div>
                <div class="warning">Once you have done that, click <a href="<%= request.getContextPath() %>/admin/menu.action">here</a> to try again.</div>
            <% } else { %>
                <div class="error"><%= cause.getClass() %></div>
                <div class="error"><%= cause.getMessage() %></div>
            <% } %>

        <% } %>

</div>

</body>
</html>
