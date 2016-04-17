<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%
String id_usu_s= (String) request.getAttribute("id_usu");
String nomUsu=(String) request.getAttribute("nomUsu");
%>
<html>
<head>
<title>
Cambiar Contrase&ntilde;a
</title>


</head>
<body>

<h2>Cambiar la Contrase�a al usuario:<%=nomUsu %></h2>
<div class="box boxpost">
				 			<h4>Editar datos de usuario</h4>
				 			<form id="formContrasena" class="form-horizontal">
				 			<input name="hacia" type="hidden" id="hacia" value="reasignarContrasena">
          					<input name="id_usu" type="hidden" id="id_usu" value="<%=id_usu_s %>">
				 			<div class="form-group">
    								<label for="inputContrasena" class="col-sm-4 control-label">Nueva Contrase�a</label>
    								<div class="col-sm-8">
      								<input name="nuevaContrasena" type="text" class="form-control" id="inputContrasena" >
    								</div>
  								</div>
  		<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a href="javascript:submitThisform()"  class="botoGris"><span class="glyphicons glyphicons-disk-save">Cambiar</span></a>
      									      									
    									</div>
  									</div>
    							</div>
				 			
				 			</form>
</div>
				 			
				 			
<jsp:include page="/comunes/pieContenido.jsp" />


<script type="text/javascript">
function submitThisform()
{
	cambiar = window.confirm('Al reasignar una contrase�a se eliminar� la anterior.\r\n �Est� seguro de la operaci�n?');
	if(cambiar==true){  
	var form= $('#formContrasena');
	var action='usuario/usuarioAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    nuevaContrasena: 
		    {
		    	required:true,
		    	alphanumeric:true,
		    	minlength: 6
		    	
		    }
		    
		    },
		    messages: {
		    	nuevaContrasena: 
		    	{
		    		required:"La nueva contrase�a no puede ser nula",
		    		alphanumeric:"la nueva contrase�a no puede contener caracteres que no sean alfanumericos, - o _",
		    		minlength: "la contrase�a no puede ser menor de 6 caracteres"
		    	}
		    
            }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	 }
	 
	}
}
</script>

</body>
</html>
