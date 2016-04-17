<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.List,java.util.Iterator, proyecto_uoct.documentacion.VO.ClienteVO,proyecto_uoct.common.VO.IdStrVO"  errorPage="" %>
<%
ClienteVO cli= (ClienteVO) request.getAttribute("datoscli");


%>

<html>
<head>
<title><%=cli.getNomCli() %> <%=cli.getApeCli() %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

<script type="text/JavaScript">
var otra=null;
function popUp(href, target, features) {
    otra = window.open(href, target, features);
    otra.window.focus();
  }

  function pasaEntExt(nomEntExt, idEntExt){
    formulario.nomEntExt.value = nomEntExt;
    formulario.idEntExt.value = idEntExt;
    otra.window.close();
  }

    function ningunaEntidad(){
  formulario.nomEntExt.value="ninguna (cliente independiente)";
  formulario.idEntExt.value="";
  }
</script>


</head>

<body>

<h2>Editar cliente</h2>
<div class="box boxpost">
<h4>Datos del cliente</h4>
<form id="formEditCliente" name="formulario" method="post" action="clienteAction.do" class="form-horizontal">
    <input type="hidden" id="hidHacia" name="hacia" value="actualizarDatosCli">
    <input type="hidden" name="id_cli" value="<%= cli.getIdCli() %>">
 	<div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre*</label>
    								<div class="col-sm-8">
      								<input maxlength="30" name="nomCli" type="text" class="form-control" id="inputNombre" value="<%= cli.getNomCli() %>">
    								</div>
</div>
 <div class="form-group">
    								<label for="inputApellido" class="col-sm-4 control-label">Apellido*</label>
    								<div class="col-sm-8">
      								<input maxlength="50" name="apeCli" type="text" class="form-control" id="inputApellido" value="<%= cli.getApeCli() %>">
    								</div>
  								</div>
  								<div class="form-group">
    								<label class="col-sm-4 control-label">Estado</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><strong><span class="glyphicons glyphicons-ok"></span> <%if (cli.getIsActivo().intValue()==1){out.print("Activado");}else{out.print("Desactivado");}%></strong></p>
    								</div>
  								</div>
  								  <div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Teléfono</label>
    								<div class="col-sm-8">
      								<input maxlength="25" name="telCli" type="text" class="form-control" id="inputTelefono" value="<%
    if (cli.getFonoCli()!=null){
      out.print(cli.getFonoCli());
    } %>">
    								</div>
  								</div>
  								 <div class="form-group">
    								<label for="inputEmail" class="col-sm-4 control-label">Email</label>
    								<div class="col-sm-8">
      								<input maxlength="50"  name="emailCli" type="email" class="form-control" id="inputEmail" value="<%
           if (cli.getEmailCli()!=null){
        out.print(cli.getEmailCli());
      }  %>">
    								</div>
  								</div>          
   	<div class="form-group">
    								<label for="inputCelular" class="col-sm-4 control-label">Celular</label>
    								<div class="col-sm-8">
      								<input  name="celCli" type="text" class="form-control" id="inputCelular" value="<%
      if (cli.getCelCli()!=null){
        out.print(cli.getCelCli());
      }
        %>">
    								</div>
  								</div> 
  								<div class="form-group">
    								<label for="inputCargo" class="col-sm-4 control-label">Cargo</label>
    								<div class="col-sm-8">
      								<input name="cargoCli" type="text" class="form-control" id="inputCargo">
    								</div>
  								</div>          
          <div class="form-group">
    								<label for="inputComentario" class="col-sm-4 control-label">Comentario</label>
    								<div class="col-sm-8">
      								<textarea name="comentarioCli" id="inputComentario" class="form-control" rows="4"><% if(cli.getComentCli()!=null){out.print(cli.getComentCli());} %></textarea>
    								</div>
  								</div> 
  								 <div class="form-group">
                 <input id="hididEntExt" type="hidden" name="idEntExt" value="<%if (cli.getIdEnt()!=null){
      out.print(cli.getIdEnt());
      }%>">
    			<label for="inputEntidad" class="col-sm-4 control-label">Entidad a la que pertenece</label>
    			<div class="col-sm-8">
											<input id="txtNomEntidadExt" name="nomEntExt" type="text" class="form-control" placeholder="Nombre de la entidad" disabled value="<%if (cli.getNomEnt()!=null){
      out.print(cli.getNomEnt());
      }%>">
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
    									      <input type="hidden" name="hacia" value="cambiarEstadoCli"/>
      										 <input type="hidden" name="idCli" value="<%= cli.getIdCli()%>">
    										<a href="javascript:submitActivaDescativa()" class="botoGris"><span class="glyphicons glyphicons-ban"></span>  <%if (cli.getIsActivo().intValue()==1){out.print("Desactivar");}else{out.print("Activar");}%></a>
    										<button type="reset" class="botoGris"><span class="glyphicons glyphicons-undo"></span> Restaurar datos</button>
    										<a  href="javascript:submitThisform('formEditCliente')" class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
    									
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

function submitActivaDescativa(){
	var form= $('#formEditCliente');
	$('#hidHacia').val('cambiarEstadoCli');
	
	var action='documentacion/clienteAction.do';
	SubmitFormulario(action, form);
	
}

function submitThisform(formulario){
	
	
	var form= $('#'+formulario);
	var action='documentacion/clienteAction.do';
	$('#hidHacia').val('actualizarDatosCli');
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


<jsp:include page="/comunes/pieContenido.jsp" />

</body>
</html>
