<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, proyecto_uoct.usuario.VO.UsuarioVO,java.util.List,java.lang.Integer, java.util.Iterator,proyecto_uoct.usuario.VO.AreaVO" errorPage=""%>
<%@page import="proyecto_uoct.common.VO.PerfilVO" %>
<%
  UsuarioVO usuario = (UsuarioVO) request.getAttribute("usuario");
  List areas = (List) request.getAttribute("areas");
  List perfiles=(List)request.getAttribute("perfiles");

%>
<html>
<head>
<title>Editar Datos de Usuario</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

  <script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
</head>
<body>

<h2>Administrar usuarios</h2>
<div class="box boxpost">
<h4>Editar datos de usuario</h4>

<form id="formEditarUsuario" name="form1" class="form-horizontal">
<input type="hidden" id="inpHacia" name="hacia" value="actualizarUsuario">
<input type="hidden" name="idUsu" value="<%= usuario.getIdUsu()%>">
<div class="form-group">
    		<label for="inputNombre" class="col-sm-4 control-label">Nombre</label>
    		<div class="col-sm-8">
      			<input type="text" maxlength="20"  class="form-control" id="inputNombre" name="nombre_usu" value="<%= usuario.getNombreUsu()%>" />
    				</div>
  			</div>
  <div class="form-group">
    			<label for="inputNombreDos" class="col-sm-4 control-label">Segundo nombre</label>
    			<div class="col-sm-8">
      			<input type="text" maxlength="20" class="form-control" id="inputNombreDos" name="nombre2_usu" value="<%
     if (usuario.getNombreUsu2()!=null){
     out.print(usuario.getNombreUsu2());
     }%>">
    			</div>
  	</div>
<div class="form-group">
    								<label for="inputApellido" class="col-sm-4 control-label">Apellido paterno</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="20" class="form-control" id="inputApellido" name="apellido_usu" value="<%= usuario.getApellUsu()%>">
    								</div>
  								</div>
  <div class="form-group">
    								<label for="inputApellidoDos" class="col-sm-4 control-label">Apellido materno</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="20" class="form-control" id="inputApellidoDos" name="apellido2_usu" value="<%if (usuario.getApellUsu2()!=null){out.print(usuario.getApellUsu2());}%>">
    								</div>
  								</div>
  <div class="form-group">
    								<label for="inputUsername" class="col-sm-4 control-label">Username Intranet</label>
    								<div class="col-sm-8">
      								<input type="text" maxlength="15" class="form-control" id="inputUsername" name="username" value="<%= usuario.getUsername()%>">
    								</div>
  		</div>
<div class="form-group">
    								<label for="inputArea" class="col-sm-4 control-label">Área de trabajo*</label>
    								<div class="col-sm-8">
      								<select class="form-control" id="inputArea" name="id_area">
    			   <%
        Iterator i = areas.iterator();
        String sel = null;
        int a_usu = usuario.getIdArea().intValue();
        while (i.hasNext()) {
          AreaVO area = (AreaVO) i.next();
          int a_area = area.getIdArea().intValue();
          if (a_usu == a_area) {
            sel = "selected";
          }
          else {
            sel = " ";
          }
          out.print("<option " + sel + "  value=\"" + area.getIdArea() + "\">" + area.getArea() + "</option>");
        }
      %>
  				</select>
  		</div>
  </div>
  
  <div class="form-group">
    				<label class="col-sm-4 control-label">Estado</label>
    				<div class="col-sm-8">
      				<p class="form-control-static">
      				<%
      				if (usuario.getIsActivo()) {
        				out.print("Activo");
      				}
      				else {
        			out.print("Inactivo");
      				}
    %>
      				
      				</p>
    					</div>
  			</div>

<div class="form-group">
    								<label for="inputPerfil" class="col-sm-4 control-label">Perfil del usuario*</label>
    								<div class="col-sm-8">
      								<select class="form-control" id="inputPerfil" name="idPerfil">
    										<%Iterator iperfil=perfiles.iterator();
		while(iperfil.hasNext()){
		PerfilVO per=(PerfilVO) iperfil.next();

                %>
              <option value="<%=per.getId()%>" <%
                if(per.getId().equals(usuario.getIdPerfil())){
                  out.print(" selected");

                }%> > <%= per.getStr()%></option>
              <%
		}
		%>
    									</select>
    								</div>
  								</div>
  								
  <div class="form-group">
    								<label class="col-sm-4 control-label">Password</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><a href="javascript:Llamadalink()">Cambiar password</a></p>
    								</div>
  								</div>
  <div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a href="javascript:submitThisform('formEditarUsuario','actualizarUsuario')"  class="botoGris"><span class="glyphicons glyphicons-disk-save"></span> Guardar </a>
      									<button type="reset" class="botoGris"><span class="glyphicons glyphicons-undo"></span> Restaurar datos</button>
      									<a href="javascript:submitThisform('formEditarUsuario','cambiarEstadoUsu')"  class="botoVerde"><%if (usuario.getIsActivo()){out.print("Desactivar a Este Usuario ");}else{out.print("Activar a Este Usuario");}%></a>
    									</div>
  									</div>
    							</div>
  		</form>
</div>

      
      
 <!-- <input type="submit" name="Submit" value="Guardar Los Cambios"> 
    <input name="reset" type="reset" value="Restaurar a los Datos Originales"/> -->   
  
  <script language="JavaScript" type="text/javascript">
  /*          var frmvalidator  = new Validator("form1");
            frmvalidator.addValidation("nombre_usu","req","Debe indicar el  Nombre del usuario");
            frmvalidator.addValidation("nombre_usu","maxlen=20","Nombre no puede superar los 20 caracteres");
            frmvalidator.addValidation("nombre_usu","alnumspace");

            frmvalidator.addValidation("nombre2_usu","maxlen=20","2º Nombre no puede superar los 20 caracteres");
            frmvalidator.addValidation("nombre2_usu","alnumspace");

            frmvalidator.addValidation("apellido_usu","req","Debe indicar el apellido");
            frmvalidator.addValidation("apellido_usu","maxlen=20","Apellido no puede superar los 20 caracteres");
            frmvalidator.addValidation("apellido_usu","alnumspace");

            frmvalidator.addValidation("apellido2_usu","maxlen=20","2º Apellido no puede superar los 20 caracteres");
            frmvalidator.addValidation("apellido2_usu","alnumspace");

            frmvalidator.addValidation("username","req","Debe indicar el nombre de usuario de Intranet");
            frmvalidator.addValidation("username","alnumhyphen");
            frmvalidator.addValidation("username","maxlen=15","Nombre de usuario no puede superar los 15 caracteres");

            frmvalidator.addValidation("id_area","req","Debe indicar el área");
            frmvalidator.addValidation("id_area","dontselect","Debe indicar el área");

            frmvalidator.addValidation("idPerfil","req","Debe indicar el perfil del nuevo usuario");
*/
          </script>

    
    <!-- 
    <form action="usuarioAction.do" method="post">
        <div align="right">
          <input type="hidden" name="hacia" value="cambiarEstadoUsu"/>
          <input type="hidden" name="idUsu" value="<%// usuario.getIdUsu()%>">
          <input type="submit" name="Submit2" value=" 
		"/>
        </div>
      </form></td>
  </tr>
</table>

 -->
 
 <jsp:include page="/comunes/pieContenido.jsp" />
<script type="text/javascript">
function submitThisform(formulario, hacia)
{
	$('#inpHacia').val(hacia);
	var form= $('#'+formulario)
	var action='usuario/usuarioAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    nombre_usu: "required",
		    
		    apellido_usu:"required",

		    username:"required",
		    id_area:"required",
		    idPerfil:"required"
		    },
		    messages: {
		    	nombre_usu: "Debe ingresar el nombre Debe indicar el  Nombre del usuario",

		    	apellido_usu:"Debe indicar el apellido",

		    	username:"Debe indicar el nombre de usuario de Intranet",
		    	id_area:"Debe indicar el área",
		    	idPerfil:"Debe indicar el perfil del nuevo usuario"
            }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	 }
		
}

function Llamadalink(){
	
	link='usuario/usuarioAction.do?hacia=aReasignarContrasena&id_usu=<%= usuario.getIdUsu()%>&nomUsu=<%= usuario.getNombreUsu()+" "+usuario.getApellUsu() %>';
	//alert(link+' ' +param);
	LlamadaPagina(link);
	
	//clienteAction.do?hacia=detalleEntExt
}
</script>
</body>
</html>

<!-- 
  <td bgcolor="#ADD8E4"><strong>Cambiar la contraseña</strong></td>
          <td><a href="usuarioAction.do?hacia=aReasignarContrasena&id_usu=<%// usuario.getIdUsu()%>&nomUsu=<% //usuario.getNombreUsu()+" "+usuario.getApellUsu() %>">Cambiar contraseña</a></td>
          
           -->