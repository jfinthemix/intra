<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%
String id_usu_s= (String) request.getAttribute("id_usu");
%>
<html>
<head>
<title>
Cambiar Contrase&ntilde;a
</title>


</head>
<body >
<h2>Editar datos personales</h2>

<div class="box boxpost">
<h4>Editar contraseña</h4>
<form id="formCambioPass" class="form-horizontal">
<input name="hacia" type="hidden" id="hacia" value="cambiarContrasena">
          <input name="id_usu" type="hidden" id="id_usu" value="<%=id_usu_s %>">
<div class="form-group">
    			<label for="passActual" class="col-sm-5 control-label">Contraseña antigua</label>
    			<div class="col-sm-7">
      			<input name="vieja_c" type="password" class="form-control" id="PassActual">
    			</div>
  		</div>
<div class="form-group">
    								<label for="passNuevo" class="col-sm-5 control-label">Contraseña nueva</label>
    								<div class="col-sm-7">
      								<input name="nueva_c" type="password" class="form-control" id="PassNuevo">
    								</div>
  								</div>
  <div class="form-group">
    								<label for="passNuevo2" class="col-sm-5 control-label">Repetir contraseña nueva</label>
    								<div class="col-sm-7">
      								<input name="confirmacion" type="password" class="form-control" id="PassNuevo2">
    								</div>
  								</div>
  								
  	<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a href="javascript:submitThisform()" class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Cambiar</a>
      								</div>
  									</div>
    							</div>
  							</form>
  		</div>
<jsp:include page="/comunes/pieContenido.jsp" />


<script type="text/javascript">
function submitThisform()
{
	
	var form= $('#formCambioPass');
	var action='usuario/usuarioAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    vieja_c: 
		    {		    	
		    	required:true,
		    	alphanumeric:true
		    	
		    },
		    nueva_c:{
		    	required:true,
		    	alphanumeric:true,
		    	minlength:6
		    },
		    confirmacion:{
		    	required:true,
		    	notEqualTo:$('#nueva_c').val()
		    	
		    }
		    
		    },
		    messages: {
		    	 vieja_c: 
				    {		    	
				    	required:"Ingrese la contraseña antigua",
				    	alphanumeric:""
				    	
				    },
				    nueva_c:{
				    	required:"Ingrese la contraseña nueva",
				    	alphanumeric:"la nueva contraseña no puede contener caracteres que no sean alfanumericos, - o _",
				    	minlength: "la contraseña no puede ser menor de 6 caracteres"
				    },
				    confirmacion:{
				    	required:"Ingrese la confirmación de la contraseña nueva",
				    	notEqualTo:"La contraseña nueva y la confirmación no coinciden"
				    	
				    }
            }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	 }
		
}

function Llamadalink(link){
	
	
	//alert(link+' ' +param);
	LlamadaPagina(link);
	
	//clienteAction.do?hacia=detalleEntExt
}
</script>
</body>
</html>

