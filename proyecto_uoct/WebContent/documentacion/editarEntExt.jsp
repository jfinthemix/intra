<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, proyecto_uoct.documentacion.VO.EntExtVO" errorPage=""%>
<%EntExtVO entidad = (EntExtVO) request.getAttribute("entidad");%>
<html>
<head>
<title>Detalle de Entidad Externa</title>

</head>
<body>

<h2>Editar Entidad Externa</h2>

<div class="box boxpost">
<h4>Datos de la Entidad</h4>
				 			<form id="formEditarEnt" class="form-horizontal">
				 			<input id="inpHacia" type="hidden" name="hacia" value="actualizarEntExt"/>
				 			<input type="hidden" name="idEntExt" value="<%= entidad.getIdEnt()%>">
    						<input type="hidden" name="idEnt" value="<%=entidad.getIdEnt() %>"/>
  								<div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputNombre" value="<%=entidad.getNomEnt() %>" disabled="">
    								</div>
  								</div>
  <div class="form-group">
    								<label class="col-sm-4 control-label">Estado</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><strong><span class="glyphicons glyphicons-ok"></span>   <%
							        if (entidad.getIsActivo().intValue() == 1) {
							          out.print("Activado");
							        }
							        else {
							          out.print("Desactivado");
							        }
							      %></strong></p>
    								</div>
  								</div>
<div class="form-group">
    								<label for="inputTelefono" class="col-sm-4 control-label">Teléfono</label>
    								<div class="col-sm-8">
      								<input maxlength="30"  name="fonoEnt" type="text" class="form-control" id="inputTelefono" value="<%
    if(entidad.getFonoEnt()!=null){
    out.print(entidad.getFonoEnt());}
        else{
    out.print("");
    }
     %>">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputDireccion" class="col-sm-4 control-label">Dirección</label>
    								<div class="col-sm-8">
      								<input maxlength="70" type="text" name="dirEnt" class="form-control" id="inputDireccion" value=" <%
    if(entidad.getDirEnt()!=null){
    out.print(entidad.getDirEnt());
    }    else{
    out.print("");
    }
      %>">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputWeb" class="col-sm-4 control-label">Sitio web</label>
    								<div class="col-sm-8">
      								<input maxlength="150" name="webEnt" type="text" class="form-control" id="inputWeb" value="<%
    if (entidad.getWeb()!=null){
      out.print(entidad.getWeb());
    }    else{
    out.print("");
    }
      %>">
    								</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
    										<a href="javascript:submitThisform('formEditarEnt','cambiarEstadoEntExt')" type="button" class="botoGris"><span class="glyphicons glyphicons-ban"></span> <%if (entidad.getIsActivo().intValue()==1){
												out.print("Desactivar Entidad");
													}
															else{
													out.print("Activar Entidad");
													}
											%></a>
    										<button type="reset" class="botoGris"><span class="glyphicons glyphicons-undo"></span> Restaurar datos</button>
      									 <a href="javascript:submitThisform('formEditarEnt','actualizarEntExt')"  class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
    									</div>
  									</div>
    							</div>
  							</form>
  						</div>



  <script language="JavaScript" type="text/javascript">
 /* var frmvalidator  = new Validator("form1");

  frmvalidator.addValidation("fonoEnt","alnumspace");
  frmvalidator.addValidation("fonoEnt","maxlen=30","Teléfono no puede superar los 15 dígitos");
  frmvalidator.addValidation("webEnt","maxlen=150","Sitio Web no puede superar los 150 caracteres");
  frmvalidator.addValidation("dirEnt","maxlen=70","Dirección no puede superar los 50 caracteres");
  frmvalidator.addValidation("dirEnt","alnumspace");*/

</script>

<script>

//"cambiarEstadoEntExt"
//"actualizarEntExt"
function submitThisform(formulario, hacia)
{
	$('#inpHacia').val(hacia);
	var form= $('#'+formulario)
	var action='documentacion/clienteAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
	/*	    fonoEnt: {
		    	digits:true
		    	
		    },*/
		    
		    webEnt:{
		    	
		    	url:true
		    }//,
		/*    dirEnt:{
		    	
		    	alfaconespacio:true
		    }*/
		    },
		    messages: {
		    /*	fonoEnt:{
		    		digits:"El teléfono deben ser sólo números"
		    	},*/ 

			    webEnt:{
			    	
			    	url:"formato url incorrecto"
			    }//,
		    	//alfaconespacio:"La dirección solo puede tener carácteres alfanumericos"
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
