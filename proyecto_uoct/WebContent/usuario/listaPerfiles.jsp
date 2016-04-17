<%@page import="java.util.List,java.util.Iterator,proyecto_uoct.common.VO.PerfilVO"%>
<%
List perfiles = (List) request.getAttribute("perfiles");
Iterator i = perfiles.iterator();
int col=0;
%>
<html>
<head>
<title>
Lista de Perfiles
</title>
<link href="../util/styla.css" rel="stylesheet" type="text/css" />
</head>
<body>


<h2>Editar perfil</h2>
<div class="box">
<h4>Lista de perfiles</h4>
<table class="table table-striped table-bordered table-hover">
      	<thead>
        	<tr>
          	<th>Perfil</th>
        	<th>Opciones de perfil</th>
        </tr>
      	</thead>
      <tbody>
      
         <%

while(i.hasNext()){
PerfilVO p= (PerfilVO) i.next();
out.print("<tr>");

out.print("<td>"+p.getStr()+"</td>");
out.print("<td>");
out.print("	<a href=\"javascript:submitThisformDetalle("+p.getId()+");\" class=\"botoGris botoMini\"><span class=\"glyphicons glyphicons-eye-open\"></span> Ver detalle</a>");
out.print("	<a href=\"javascript:submitThisformEditar("+p.getId()+");\" class=\"botoGris botoMini\"><span class=\"glyphicons glyphicons-edit\"></span> Editar</a>");
out.print("<form id=\"form"+p.getId()+"\" action=\"perfilAction.do\" method=\"POST\">");
out.print("<input id=\"inpHacia"+p.getId()+"\" type=\"hidden\" name=\"hacia\" />");
out.print("<input type=\"hidden\" name=\"idPer\" value=\""+p.getId()+"\"/>");
out.print("<input type=\"hidden\" name=\"nomPer\" value=\""+p.getStr()+"\" />");
out.print("</form>");
out.print("</td>");
out.print("</tr>");
}
%>
      
      </tbody>
</table>
</div>


  						
  						<a href="javascript:volver()"><span class="glyphicons glyphicons-undo"></span> Volver</a>
							<a href="javascript:void(0)" class="pull-right"><span class="glyphicons glyphicons-circle-exclamation-mark"></span> Ayuda</a>
						</div>

<script>
function submitThisformEditar(id)
{	

	$('#inpHacia'+id).val('aEditarPerfil');
	
	var formulario= $('#form'+id);
	var action='usuario/perfilAction.do';
	SubmitFormulario(action, formulario);
	
	//$('#divResultado').removeClass( "encuentra" );
	
}

function submitThisformDetalle(id)
{	

	$('#inpHacia'+id).val('adetallePerfil');
	
	var formulario= $('#form'+id);
	var action='usuario/perfilAction.do';
	SubmitFormulario(action, formulario);
	
	//$('#divResultado').removeClass( "encuentra" );
	
}

</script>	
						</body>
</html>
