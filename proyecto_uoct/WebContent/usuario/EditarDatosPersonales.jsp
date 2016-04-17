<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,proyecto_uoct.usuario.VO.UsuarioVO" errorPage="" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%
UsuarioVO usuario= (UsuarioVO) request.getAttribute("usuario");
String mensaje=(String) request.getAttribute("mensaje");
SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");


%>
<html>
<head>
<title>Editar datos de <%= usuario.getNombreUsu() %> <%= usuario.getApellUsu() %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">






</head>

<body>
	<h2>Editar datos personales</h2>
    
  <div class="box boxpost">
  <h4>Mis datos</h4>
    
    <form id="formGuardar" action="usuarioAction.do" method="POST" name="form1" class="form-horizontal">
        <input type="hidden" name="hacia" value="actualizarDatosPersonales">
        <div class="form-group">
    								<label for="inputFoto" class="col-sm-4 control-label">Fotografía</label>
    								<div class="col-sm-8 formFoto">
    								
    								<!--  <span class="noReg">Sin registro</span>-->	
      								<img id="imgFotografia" src="usuario/usuarioAction.do?hacia=getFotoUsu&idUsu=<%=usuario.getIdUsu() %>&cacheBraker=<%=new Date().getTime()%>"> <!-- /imagen demo -->
      								
    								</div>
  								</div>
        
        <div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="20" name="nom_usu" class="form-control" id="inputNombre" value="<%=usuario.getNombreUsu() %>">
    								</div>
		</div>
        <div class="form-group">
    								<label for="inputNombreDos" class="col-sm-4 control-label">Segundo nombre</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="20" class="form-control" id="inputNombreDos" name="nom2_usu" value="<%=usuario.getNombreUsu2() %>">
    								</div>
  								</div>
  								
  		<div class="form-group">
    								<label for="inputApellido" class="col-sm-4 control-label">Apellido paterno</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="20" class="form-control" id="inputApellido" name="apell_usu" value="<%=usuario.getApellUsu() %>">
    								</div>
		</div>
  		<div class="form-group">
    								<label for="inputApellidoDos" class="col-sm-4 control-label">Apellido materno</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="20" class="form-control" id="inputApellidoDos" name="apell2_usu" value="<%
      if(usuario.getApellUsu2()!=null){
      out.print(usuario.getApellUsu2());}
     %>">
    								</div>
  								</div>	
  	<div class="form-group">
    								<label for="inputAnexo" class="col-sm-4 control-label">Anexo telefónico</label>
    								<div class="col-sm-8">
      								<input type="text"  class="form-control" id="inputAnexo" name="anx" value="<%
     if( usuario.getAnexo()==null){
     out.print("");
     }else{
     out.print(usuario.getAnexo());
     }
     %>">
    								</div>
  								</div>
  	<div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Teléfono particular</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputTelefono" name="telefono" value="<%
      if(usuario.getTelefono().intValue()== 0){
      out.print("");
      }else{
      out.print(usuario.getTelefono());}
      %>">
    								</div>
  								</div>
  		<div class="form-group">
    								<label for="inputCelular" class="col-sm-4 control-label">Celular</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputCelular" name="celular" value="<%

      if(usuario.getCelular().intValue()==0){
      out.print("");
      }else{
        out.print(usuario.getCelular());
      }
      %>">
    								</div>
  								</div>

<div class="form-group">
    								<label for="inputDireccion" class="col-sm-4 control-label">Dirección</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputDireccion" name="dir_usu" value="<%
     if(usuario.getDir()==null){
       out.print("");
     }else{
     out.print(usuario.getDir());
     }
      %>">
    								</div>
  								</div>
  	<div class="form-group">
    								<label for="inputEmail" class="col-sm-4 control-label">Email</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputEmail" name="email" value="<%
      if(usuario.getEmail()==null){
        out.print("");
      }else{
        out.print(usuario.getEmail());
      }
        %>">
    								</div>
  								</div>
  						
  	<div class="form-group">
    								<label class="col-sm-4 control-label">Curriculum</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><a href="javascript:Llamadalink('usuario/usuarioAction.do?hacia=aactualizarCurriculo')">Agregar curriculum</a></p>
    								</div>
  								</div>
  	<div class="form-group">
  	  <%
  String cumple="";
  String dia="";
  String mes="";
  if (usuario.getCumpleanos()!=null){
    cumple=sdf.format(usuario.getCumpleanos());
    dia=cumple.substring(0,2);
    mes=cumple.substring(3,5);
    cumple=dia+"-"+mes;
  }%>
    								<label for="inputCumple" class="col-sm-4 control-label">Fecha de nacimiento</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control inputFecha" id="inputCumple" name="cumpleanos" value="<%=cumple%>" >
    								</div>
  								</div>
  	<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a  href="javascript:submitThisform()" class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
      								</div>
  									</div>
    							</div>
  	</form>					
</div>

	<div class="box clearfix">
				 			<h4>Otras opciones</h4>
				 			<div class="col-md-4 linktab">
				 				<a  href="javascript:Llamadalink('usuario/usuarioAction.do?hacia=informesActPers')">
				 					<span class="glyphicons glyphicons-file"></span><br>
				 					Informe de actividades
				 				</a>
				 			</div>
				 			<div class="col-md-4 linktab">
				 				<a href="javascript:Llamadalink('usuario/usuarioAction.do?hacia=cambiarContrasena&id_usu=<%= usuario.getIdUsu()%>')">
				 					<span class="glyphicons glyphicons-lock"></span><br>
				 					Cambiar password
				 				</a>
				 			</div>
				 			<div class="col-md-4 linktab">
				 				<a  href="javascript:Llamadalink('usuario/usuarioAction.do?hacia=acambiarFotografia')">
				 					<span class="glyphicons glyphicons-picture"></span><br>
				 					Cambiar fotografía
				 				</a>
				 			</div>
  						</div>


<jsp:include page="/comunes/pieContenido.jsp" />
        

<script language="JavaScript" type="text/javascript">
 /* var frmvalidator  = new Validator("form1");

  frmvalidator.addValidation("nom_usu","req","Debe ingresar el nombre");
  frmvalidator.addValidation("nom_usu","alnumspace");
  frmvalidator.addValidation("nom_usu","maxlen=20","Nombre no puede superar los 20 caracteres");
  frmvalidator.addValidation("nom2_usu","maxlen=20","2º Nombre no puede superar los 20 caracteres");
  frmvalidator.addValidation("nom2_usu","alnumspace");
  frmvalidator.addValidation("apell_usu","req","Debe ingresar el Apellido");
  frmvalidator.addValidation("apell_usu","alnumspace");
  frmvalidator.addValidation("apell_usu","maxlen=20","Apellido no puede superar los 20 caracteres");
  frmvalidator.addValidation("apell2_usu","maxlen=20","2º Apellido no puede superar los 20 caracteres");
  frmvalidator.addValidation("apell2_usu","alnumspace");
  frmvalidator.addValidation("email","email");
  frmvalidator.addValidation("celular","numeric","Se aceptan solo números en el celular");
  frmvalidator.addValidation("telefono","numeric","Se aceptan solo números en el télefono");

  frmvalidator.setAddnlValidationFunction("valFecha");*/

</script>
<script type="text/javascript">
//imgFotografia
function CargadoPaginaInicial(){
	$('html,body').scrollTop(0);
		
	
	
		
	

	}




function submitThisform()
{
	
	var form= $('#formGuardar')
	var action='usuario/usuarioAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    nom_usu: {
		    	required:true,
		    	alphanumeric:true
		    },
		   
		    apellido_usu:{
		    	required:true,
		    	alphanumeric:true	    	
		    },
		    apellido2_usu:{
		    	alphanumeric:true
		    },
		    email:{
		    	email:true
		    },
		    celular:{
		    	digits:true
		    },
		    telefono:
		    {
		    	digits:true
		    }
		  
		    },
		    messages: {
		    	nom_usu: {
			    	required:"Debe ingresar el nombre",
			    	alphanumeric:"El nombre solo puede contener valores alfanumericos"
			    },
			   
			    apellido_usu:{
			    	required:"Debe ingresar el Apellido",
			    	alphanumeric:"El apellido solo puede contener valores alfanumericos"	    	
			    },
			    apellido2_usu:{
			    	alphanumeric:"El segundo apellido solo puede contener valores alfanumericos"
			    },
			    email:{
			    	email:"El formato del e-mail no es correcto"
			    },
			    celular:{
			    	digits:"Se aceptan solo números en el celular"
			    },
			    telefono:
			    {
			    	digits:"Se aceptan solo números en el celular"
			    }
            }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	  alert('Anexo guardado');
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
