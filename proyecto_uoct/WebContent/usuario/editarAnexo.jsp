<%@page import="proyecto_uoct.usuario.VO.AnexoVO" %>
<%
AnexoVO anx= (AnexoVO) request.getAttribute("anx");
%>
<head>
<title>
  Editar Anexo
</title>
<link href="../util/styla.css" rel="stylesheet" type="text/css">

  <script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

  <script language="JavaScript" type="text/javascript">
function confirmarEnvio(f){
borrar = window.confirm('Seguro que desea eliminar el anexo');
(borrar)?f.submit():'return false';
}
</script>



</head>
<body >
<h2>Administrar anexos telefónicos</h2>

<div class="box boxpost">
<h4>Editar anexo</h4>
<form id="formEditarAnexo" class="form-horizontal">
 <input type="hidden" name="hacia" value="actualizarAnexo" />
            <input type="hidden" name="idAnx" value="<%= anx.getIdAnexo()%>" />
            
  								<div class="form-group">
    								<label for="inputNombreAnexo" class="col-sm-4 control-label">Nombre</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputNombreAnexo" value=" <%=anx.getNomAnexo() %>" disabled="">
    								</div>
  								</div>
<div class="form-group">
    								<label for="inputAnexo" class="col-sm-4 control-label">Anexo</label>
    								<div class="col-sm-8">
      								<input type="text" name="anx" class="form-control" id="inputAnexo" value="<%= anx.getAnexo() %>">
    								</div>
  								</div>
  <div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
    									<a href="javascript:submitThisform('formEditarAnexo', 'borrarAnexo')" type="button" class="botoRojo"><span class="glyphicons glyphicons-delete"></span> Eliminar</a>
    									<button type="reset" class="botoGris"><span class="glyphicons glyphicons-undo"></span> Restaurar datos</button>
      									<a href="javascript:submitThisform('formEditarAnexo', 'actualizarAnexo')" class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
    									</div>
  									</div>
    							</div>
  							</form>
  		</div>


<script type="text/javascript">
function submitThisform(formulario, hacia)
{
	$('#inpHacia').val(hacia);
	var form= $('#'+formulario)
	var action='usuario/usuarioAction.do';
	
	$('#'+formulario).validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    anx: {
		    	required:true,
		    	digits:true	
		    	}
		    		   
		    },
		    messages: {
		    	  anx: {
				    	required:"El número de anexo es requerido",
				    	digits:"El número de anexo debe ser numerico"
				    	}
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
