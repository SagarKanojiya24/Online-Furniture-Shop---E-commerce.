 
<%
    //getAttribute "Uinique_Message" this key come from UserResevlet.java and LoginServlet.java
    String message = (String) session.getAttribute("m1");
    if (message != null) {

        //prints
        // out.println(message);
%>
<%-- print after successful registreation of form --%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong> <%=message%>  </strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<%
        // remove  session after one time print or show
        session.removeAttribute("message");
    }

%>