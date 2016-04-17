<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.List, java.util.Iterator,proyecto_uoct.documentacion.VO.EntExtVO" errorPage=""%>
<%
  List listainstit = (List) request.getAttribute("listainstit");
  Iterator ii = listainstit.iterator();
%>

<html>
<head>
<title>Registrar Cliente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Cache-Control" content="no-cache">


</head>
<body>
<h2>Registrar cliente</h2>
<div class="box boxpost">
<h4>Datos del nuevo cliente</h4>
<form id="formRegCliente" name="formulario" method="post" action="clienteAction.do" class="form-horizontal">
 <input type="hidden" name="hacia" value="ingresarCli"/>
 	<div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre*</label>
    								<div class="col-sm-8">
      								<input maxlength="30" name="nom_cli" type="text" class="form-control" id="inputNombre">
    								</div>
</div>
 <div class="form-group">
    								<label for="inputApellido" class="col-sm-4 control-label">Apellido*</label>
    								<div class="col-sm-8">
      								<input maxlength="50" name="ape_cli" type="text" class="form-control" id="inputApellido">
    								</div>
  								</div>
  								  <div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Teléfono</label>
    								<div class="col-sm-8">
      								<input maxlength="25" name="fono_cli" type="text" class="form-control" id="inputTelefono">
    								</div>
  								</div>
  								 <div class="form-group">
    								<label for="inputEmail" class="col-sm-4 control-label">Email</label>
    								<div class="col-sm-8">
      								<input maxlength="50"  name="email_cli" type="email" class="form-control" id="inputEmail">
    								</div>
  								</div>          
   	<div class="form-group">
    								<label for="inputCelular" class="col-sm-4 control-label">Celular</label>
    								<div class="col-sm-8">
      								<input  name="cel_cli" type="text" class="form-control" id="inputCelular">
    								</div>
  								</div> 
  								<div class="form-group">
    								<label for="inputCargo" class="col-sm-4 control-label">Cargo</label>
    								<div class="col-sm-8">
      								<input name="cargo" type="text" class="form-control" id="inputCargo">
    								</div>
  								</div>          
          <div class="form-group">
    								<label for="inputComentario" class="col-sm-4 control-label">Comentario</label>
    								<div class="col-sm-8">
      								<textarea name="comentario" id="inputComentario" class="form-control" rows="4"></textarea>
    								</div>
  								</div> 
  								 <div class="form-group">
                 <input id="hididEntExt" type="hidden" name="idEntExt" value="">
    			<label for="inputEntidad" class="col-sm-4 control-label">Entidad a la que pertenece</label>
    			<div class="col-sm-8">
											<input id="txtNomEntidadExt" name="nomEntExt" type="text" class="form-control" placeholder="Nombre de la entidad" disabled>
    								</div>
  								</div>  
  								
  								
  								  <div class="form-group">
    								<label class="col-sm-4 control-label"></label>
    								<div class="col-sm-8">
    									<p class="form-control-static">
    										<a href="clienteAction.do?hacia=abuscarEntidadExt" onClick="popUp('documentacion/clienteAction.do?hacia=abuscarEntidadExt', this.target, 'width=600,height=300,scrollbars=yes'); return false;" class="botoGris botoMini"><span class="glyphicons glyphicons-search"></span> Buscar entidad</a>
    										<a href="javascript:LlamadaPagina('documentacion/clienteAction.do?hacia=aregEntExt')" class="botoGris botoMini"><span class="glyphicons glyphicons-circle-plus"></span> Crear entidad</a>
    									</p>
    									<p><a href="javascript:ningunaEntidad();" class="botoGris botoMini"><span class="glyphicons glyphicons-circle-plus"></span> Ninguna entidad</a></p>
    												
    											
      								
    			</div>
  			</div> 
  			
  			  <div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
    										<a  href="javascript:submitThisform('formRegCliente')" class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
    						
    									
    									</div>
  									</div>
    							</div>
</form>

</div>

<script>

function ningunaEntidad(){
	$('#txtNomEntidadExt').val('');
	$('#hididEntExt').val('');
		
}

function submitThisform(formulario){
	
	
	var form= $('#'+formulario);
	var action='documentacion/clienteAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    nom_cli: {required:true},
		    
		    ape_cli:{required:true},
		    email_cli:{email:true}
		    	    
		    
		    },
		    messages: {
		    	nom_cli: {required:"Debe ingresar el nombre"},
			    
			    ape_cli:{required:"Debe ingresar el apellido"},
			    email_cli:{email:"formato de correo inválido"}            
			    }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	 }
		
}

</script>

</body>
</html>