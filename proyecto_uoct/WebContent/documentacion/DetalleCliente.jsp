<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, proyecto_uoct.documentacion.VO.ClienteVO" errorPage="" %>
<%
ClienteVO cli= (ClienteVO) request.getAttribute("datoscli");
Integer ses_idtipousu=(Integer) request.getAttribute("ses_id_tipousu");
String mensaje= (String) request.getAttribute("mensaje");
%>
<html>
<head>
<title><%=cli.getNomCli() %> <%=cli.getApeCli() %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>
<h2>Datos de <%=cli.getNomCli() %> <%= cli.getApeCli() %>:
        <%if(mensaje!=null){%>
        <%=mensaje %>
        <%}%></h2>
						
				 		<div class="box">
				 			<h4>Datos del cliente</h4>
				 			<form class="form-horizontal">
  								<div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre*</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputNombre" value="<%= cli.getNomCli() %>" disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputApellido" class="col-sm-4 control-label">Apellido*</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputApellido" value=" <%= cli.getApeCli() %>" disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Teléfono</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputTelefono" value="<%

    if (cli.getFonoCli()!=null){
      out.print(cli.getFonoCli());
    }
    else{
      out.print("&nbsp;");
    }
      %>" disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputEmail" class="col-sm-4 control-label">Email</label>
    								<div class="col-sm-8">
      								<input type="email" class="form-control" id="inputEmail" value="<%if (cli.getEmailCli()!=null){
      out.print(cli.getEmailCli());
    }    else{
    out.print("&nbsp;");
    }
      %> " disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputCelular" class="col-sm-4 control-label">Celular</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputCelular" disabled="" value=" <% if( cli.getCelCli()!=null){
      out.print(cli.getCelCli());
    }    else{
    out.print("&nbsp;");
    }
      %>">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputEntidad" class="col-sm-4 control-label">Entidad a la que pertenece</label>
    								<div class="col-sm-8">
      								<p class="form-control-static">
    										<a href="javascript:Llamadalink('detalleEntExt','<%=cli.getIdEnt()%>','<%=cli.getNomEnt()%>')"><%if( cli.getNomEnt()!=null){out.print(cli.getNomEnt());} else{out.print("&nbsp;");}%></a>
    									</p>
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputCargo" class="col-sm-4 control-label">Cargo</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputCargo" value="<% if (cli.getCargo()!=null){
    out.print(cli.getCargo());
    } else{
    out.print("&nbsp;");
    }
    %> " disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputComentario" class="col-sm-4 control-label">Comentario</label>
    								<div class="col-sm-8">
      								<textarea id="inputComentario" class="form-control" rows="4" disabled=""><% if(cli.getComentCli()!=null){
      out.print(cli.getComentCli());
    }else{
    out.print("&nbsp;");
    }
    %></textarea>
    								</div>
  								</div>
  							</form>
        				</div>
  						
  				

<script>

function Llamadalink(hacia,link,nom){
	

	 //   alert('this is a top level window');
		link=link.replace('#','');
		link='documentacion/clienteAction.do?id_ent='+link+'&hacia='+hacia;
		
		LlamadaPagina(link);

	

}

</script>
<jsp:include page="/comunes/pieContenido.jsp" />
</body>
</html>
