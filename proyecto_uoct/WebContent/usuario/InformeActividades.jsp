<%@taglib uri="/WEB-INF/lib/struts-tiles.tld" prefix="tiles"%>
<%@taglib uri="/WEB-INF/lib/struts-nested.tld" prefix="nested"%>
<%@taglib uri="/WEB-INF/lib/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/lib/struts-template.tld" prefix="template"%>
<%@taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/lib/struts-html.tld" prefix="html"%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List,java.util.Iterator,proyecto_uoct.usuario.VO.InformeActividadesVO,java.text.SimpleDateFormat"%>
<%
String mensaje= (String) request.getAttribute("mensaje");
List informes=(List) request.getAttribute("informes");
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
int cont=0;

%>
<html>
<head>
<title>Informes de Actividades Personales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

<script language="JavaScript" type="text/javascript">
function confirmarEliminacion(f){
borrar = window.confirm('Seguro que desea eliminar el Informe');
(borrar)?f.submit():'return false';
}
</script>


<script type="text/javascript">


 function valLargoFile()
{
  var frm = document.forms['inforActividades'];// reemplazar nombre del form
  archivo=frm.informe.value; //reemplazar nombre del file
  largo=20; //reemplazar la longitud del campo
  while(archivo.indexOf('\\') !=-1){
  archivo=archivo.slice(archivo.indexOf('\\')+1);
  }
  if(archivo.length>largo){
  alert("nombre del archivo demasiado largo");
  return false;
  }else{
  return true;
  }

}
</script>


</head>

<body>
<h2>Informe de actividades</h2>

<div class="box boxpost">

				<h4>Ingreso de Informe</h4>
				 			<html:form action="/usuario/usuarioAction.do" name="inforActividades"  method="post" type="proyecto_uoct.usuario.controller.UsuarioFormBean" enctype="multipart/form-data">
				 			   <input type="hidden" name="hacia" value="registrarInforme" />
				 				<div class="form-group">
    								
    								<div class="col-sm-8 formFoto">
    								<html:file property="informe"/>
    									
      								</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a class="botoVerde" href="javascript:submitThisFormSubida()"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
      								</div>
  									</div>
    							</div>
  								
  					</html:form>
  						</div>
  <table class="table table-striped table-bordered table-hover tablesorter dataTable no-footer" >
          <tr>
            <td >
              <div align="center"><strong>Fecha
                del Informe</strong></div></td>
            <td >
              <div align="center"><strong>Nombre
                del archivo</strong></div></td>
            <td >
              <div align="center"><strong>Descargar</strong></div></td>
            <td >
              <div align="center"><strong>Borrar</strong></div></td>
          </tr>
          <%
   Iterator i = informes.iterator();
   while(i.hasNext()){
   InformeActividadesVO inf= (InformeActividadesVO) i.next();
   %>
          <tr bgcolor="<% if (cont==0) {out.print("#A6F7BA");cont=1;} else{out.print("#F7FBC4");cont=0;} %>" >
            <td>
              <% out.print(sdf.format(inf.getFechaInfor())); %>
            </td>
            <td><%= inf.getNomInfor() %></td>
            <td><form id="formDescargar" action="usuarioAction.do" method="POST">
                <input type="hidden" name="hacia" value="descargarInforme" />
                <input type="hidden" name="idInf" value="<%= inf.getIdInfor()%>" />
                <div align="center">
                  <a  class="botoGris botoMini" href="javascript:submitThisFormDescarga()" />Descargar</a>
                </div>
              </form></td>
            <td><form id="formBorrar" action="usuarioAction.do" method="POST">
                <input type="hidden" name="hacia" value="borrarInforme" />
                <input type="hidden" name="idInf" value="<%= inf.getIdInfor()%>" />
                <div align="center">
                  <a name="button" class="botoRojo botoMini" href="javascript:submitThisFormBorrar()"   /> Borrar</a>
                </div>
              </form></td>
          </tr>
          <% }%>
        </table>
  						

<script>

function CargadoPaginaInicial(){
	$('html,body').scrollTop(0);
	$("[name='inforActividades']" ).addClass('form-horizontal');
		
	

	}
	
	
function submitThisFormSubida()
{
	
	var formulario= $("[name='inforActividades']");
	var action='/usuario/usuarioAction.do';
	
	
	
		formulario.validate({
			  rules: {
			    // simple rule, converted to {required:true}
			    informe: {
			    	required:true
			    }
			  
			    },
			    messages: {
			    	informe: {
				    	required:"Debe indicar un archivo"
				    }
	            }
			  });
		
		
		if(formulario.valid()) 
		 {	
			 
			    SubmitFormularioFile(action, formulario);
								    
		 }
	
}


function submitThisFormDescarga()
{
	
	var formulario= $("#formDescargar");
	var action='/usuario/usuarioAction.do';
	
	
	SubmitFormulario(action, formulario);
			
	
}

function submitThisFormBorrar(){
	var formulario= $("#formBorrar");
	var action='/usuario/usuarioAction.do';
	
	var	borrar = window.confirm('Seguro que desea eliminar el Informe');
	if(borrar)
	{
		SubmitFormulario(action, formulario);	
	}
	
	
		
	
}
</script>
<br />
<jsp:include page="/comunes/pieContenido.jsp" />
</body>
</html>
