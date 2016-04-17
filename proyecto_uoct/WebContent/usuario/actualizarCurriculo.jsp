<%@taglib uri="/WEB-INF/lib/struts-tiles.tld" prefix="tiles"%>
<%@taglib uri="/WEB-INF/lib/struts-nested.tld" prefix="nested"%>
<%@taglib uri="/WEB-INF/lib/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/lib/struts-template.tld" prefix="template"%>
<%@taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/lib/struts-html.tld" prefix="html"%>

<html>
  <head>
    <title>
      actualizarCurriculo
    </title>
    <link href="../util/styla.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>


      <script language="JavaScript" type="text/javascript">
      function confirmarEnvio(f){
        borrar = window.confirm('Guardar un nuevo curriculo implica eliminar el antiguo. ¿Está seguro de la operación?');
        (borrar)?f.submit():'return false';
      }
    </script>


  </head>
  <body>
  
  
    <h2>Curriculum</h2>
						
				 		<div class="box boxpost">
				 			<h4>Actualizar Curriculum</h4>
				 			<html:form action="/usuario/usuarioAction.do" name="formCurr"  method="post" type="proyecto_uoct.usuario.controller.UsuarioFormBean" enctype="multipart/form-data">
				 			<input type="hidden" name="hacia" value="actualizarCurriculo"/>
				 				
				 				<div class="form-group">
  									<label for="inputFile" class="col-sm-4 control-label">Curriculum actual</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><a href="usuario/usuarioAction.do?hacia=descargarCurriculo"> Descarga </a></p>
    								</div>
  								</div>
				 				
				 				
  								<div class="form-group">
  									<label for="inputFile" class="col-sm-4 control-label">Nuevo curriculum</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><html:file property="curric"/></p>
    								</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a class="botoVerde" href="javascript:submitThisFormSubida()" ><span class="glyphicons glyphicons-disk-save"></span> Actualizar</a>
      								</div>
  									</div>
    							</div>
  							</html:form>
  						</div>
  
  

 <script>

function CargadoPaginaInicial(){
	$('html,body').scrollTop(0);
	$("[name='formCurr']" ).addClass('form-horizontal');
		
	

	}
	
function submitThisFormSubida()
{
	
	var formulario= $("[name='formCurr']");
	var action='/usuario/usuarioAction.do';
	
	
	
		formulario.validate({
			  rules: {
			    // simple rule, converted to {required:true}
			    curric: {
			    	required:true
			    }
			  
			    },
			    messages: {
			    	curric: {
				    	required:"Debe indicar un archivo"
				    }
	            }
			  });
		
		
		if(formulario.valid()) 
		 {	
			 
			    SubmitFormularioFile(action, formulario);
								    
		 }
	
}

function Llamadalink(link){
	
	
	//alert(link+' ' +param);
	LlamadaPagina(link);
	
	//clienteAction.do?hacia=detalleEntExt
}

	</script>
	<jsp:include page="/comunes/pieContenido.jsp" />
</body>
    </html>

