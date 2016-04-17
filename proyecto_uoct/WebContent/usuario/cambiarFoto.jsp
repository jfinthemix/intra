<%@taglib uri="/WEB-INF/lib/struts-tiles.tld" prefix="tiles"%>
<%@taglib uri="/WEB-INF/lib/struts-nested.tld" prefix="nested"%>
<%@taglib uri="/WEB-INF/lib/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/lib/struts-template.tld" prefix="template"%>
<%@taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/lib/struts-html.tld" prefix="html"%>
<%@ page import="java.sql.*,proyecto_uoct.common.VO.DatosSesVO" %>
<%@ page import="java.util.Date;" %>

<%
int id_usu=(int) request.getAttribute("id_usu_e");

%>
<html>
  <head>
    <title>
      Actualizar Fotogra&iacute;a
    </title>
    <link href="../util/styla.css" rel="stylesheet" type="text/css">



  </head>
  <body>
  
  
  <h2>Editar datos personales</h2>
						
				 		<div class="box boxpost">
				 			<h4>Cambiar fotografía</h4>
				 			<html:form action="/usuario/usuarioAction.do" name="formFoto"  method="post" type="proyecto_uoct.usuario.controller.UsuarioFormBean" enctype="multipart/form-data">
				 			<input type="hidden" name="hacia" value="actualizarFoto"/>
				 				<div class="form-group">
    								<label class="col-sm-4 control-label">Fotografía actual</label>
    								<div class="col-sm-8 formFoto">
    									<span class="noReg">Sin registro</span>
      								<img id="imgFotografia" src="usuario/usuarioAction.do?hacia=getFotoUsu&idUsu=<%=id_usu%>&cacheBraker=<%=new Date().getTime()%>"> 
    								</div>
  								</div>
  								<div class="form-group">
  									<label for="inputFile" class="col-sm-4 control-label">Nueva fotografía</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><html:file property="foto"/></p>
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
	$("[name='formFoto']" ).addClass('form-horizontal');
		
	

	}
	
function submitThisFormSubida()
{
	
	var formulario= $("[name='formFoto']");
	var action='/usuario/usuarioAction.do';
	
	
	
		formulario.validate({
			  rules: {
			    // simple rule, converted to {required:true}
			    foto: {
			    	required:true
			    }
			  
			    },
			    messages: {
			    	foto: {
				    	required:"Debe indicar un archivo"
				    }
	            }
			  });
		
		
		if(formulario.valid() && LimitAttach()) 
		 {	
			 
			    SubmitFormularioFile(action, formulario);
								    
		 }
	
}



function LimitAttach() {
extArray = new Array(".gif", ".jpg");	
var file=$("[name='foto']").val()


allowSubmit = false;
if (!file) return;
while (file.indexOf("\\") != -1)
file = file.slice(file.indexOf("\\") + 1);
ext = file.slice(file.indexOf(".")).toLowerCase();
for (var i = 0; i < extArray.length; i++) {
if (extArray[i] == ext) { allowSubmit = true; break; }
}
if (allowSubmit) 
{
	return allowSubmit;
	}
else{
alert("Se permiten únicamente archivos con la extención: "
+ (extArray.join("  ")) + "\nPor favor, seleccione otro archivo "
+ "e intente de nuevo.");
}
return allowSubmit
}
	</script>
  
  
  <jsp:include page="/comunes/pieContenido.jsp" />
      </body>
    </html>


