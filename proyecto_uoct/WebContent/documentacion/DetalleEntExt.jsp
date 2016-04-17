<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, proyecto_uoct.documentacion.VO.EntExtVO" errorPage="" %>
<%
EntExtVO entidad= (EntExtVO) request.getAttribute("datosEntidad");
%>
<html>
<head>
<title>
Detalle de Entidad Externa
</title>

</head>
<body >
<h2>Datos de entidad externa </h2>
<div class="box">

<h4><%=entidad.getNomEnt() %></h4>
<form class="form-horizontal">
  								<div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputNombre" value="<%=entidad.getNomEnt() %>" disabled="">
    								</div>
  								</div>
  	<div class="form-group">
    								<label for="inputApellido" class="col-sm-4 control-label">Tel&eacute;fono:</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputApellido" value=" <%
    if(entidad.getFonoEnt()!=null){
    out.print(entidad.getFonoEnt());}
        else{
    out.print("");
    }
     %>" disabled="">
    								</div>
    			</div>
    <div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Direcci&oacute;n</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputTelefono" value=" <%
    if(entidad.getDirEnt()!=null){
    out.print(entidad.getDirEnt());
    }    else{
    out.print("");
    }
      %>" disabled="">
    								</div>
  								</div>
  	<div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Sitio Web</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputTelefono" value=" <%
    if (entidad.getWeb()!=null){
      out.print(entidad.getWeb());
    }    else{
    out.print("");
    }
      %> " disabled="">
    								</div>
  								</div>			
    			
    			
  </form>

</div>



<jsp:include page="/comunes/pieContenido.jsp" />
</body>
</html>
