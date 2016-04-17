<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List,java.util.LinkedList,java.util.Iterator"  %>
<%@page import="proyecto_uoct.common.VO.ModuloVO,proyecto_uoct.common.VO.FuncionalidadVO"  %>
<%
String nomPer = (String)request.getAttribute("nomPer");
Integer idPer=(Integer) request.getAttribute("idPer");
List fp= (List)request.getAttribute ("FdelP");
List f= (List)request.getAttribute ("f");
List m = (List)request.getAttribute("modulos");



%>

<head>
<title>Edici&oacute;n de Perfil:<%=nomPer %></title>
<link href="../util/stylb.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript">
function confirmarEnvio(f){
borrar = window.confirm('El perfil será eliminado solo si no existen usuarios asociados a él.\r\n ¿Seguro que desea eliminar el perfil');
(borrar)?f.submit():'return false';
}
</script>

</head>

<body>

<h2>Editar perfil</h2>

<div class="box boxpost">
	<h4>Datos del perfil</h4>

<form id="formActualizar" class="form-horizontal" name="id_funcs">
<input id="inHacia" type="hidden" name="hacia" value="actualizarPerfil"/>
<input type="hidden" name="id_perfil" value="<%=idPer %>" />
<div class="form-group">
    			<label for="inputNombre" class="col-sm-4 control-label">Nombre del perfil</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputNombre" value="<%=nomPer %> %>" disabled="">
    								</div>
  								</div>
  								<hr>
  								
<%

Iterator im=m.iterator();

while (im.hasNext()){                  // PARA CADA MODULO
ModuloVO mod= (ModuloVO)im.next();



List tempF=new LinkedList();              //CREA UNA LISTA TEMPORAL
int contF=0;

// PARA CADA FUNCIÓN , SI PERTENECE AL MODULO, LA GUARDA EN LA LISTA TEMPORAL CONTANDO CUANTAS VAN

Iterator iF=f.iterator();

while (iF.hasNext()){
  FuncionalidadVO fun=(FuncionalidadVO)iF.next();
  if(fun.getIdModulo().equals(mod.getIdModulo())){
    tempF.add(fun);
    contF++;
  }
}


// SI EN LA LISTA TEMPORAL HAY FUNCIONALIDADES IMPRIME EL MODULO Y LAS FUNCIONALIDADES
if(contF!=0){
  out.println(
    "<div class=\"form-group\">"+
    "<label for=\"\" class=\"col-sm-4 control-label\">"+mod.getNombreModulo()+":</label>"+
    "<div class=\"col-sm-8\">");

    Iterator itempF=tempF.iterator();

    while(itempF.hasNext()){

      FuncionalidadVO ftemp=(FuncionalidadVO)itempF.next();

      String chk="";

      Iterator iFP=fp.iterator();

      while(iFP.hasNext()){
        FuncionalidadVO ftempFP=(FuncionalidadVO)iFP.next();
        if(ftemp.getIdFuncionalidad().equals(ftempFP.getIdFuncionalidad())){
        chk=" checked ";
        break;
        }
      }
        out.println("<div class=\"checkbox\">"+
        "<label>"+
        "<input type=\"checkbox\" "+chk+" name=\"id_funcionalidad\" value=\""+ftemp.getIdFuncionalidad()+"\" />"+
        ""+ftemp.getNombreFun()+""+
        "</label>"+
        "</div>"
        );

      }
    out.println("</div>");
    out.println("</div>");
    
    }
  }
  %>
   <div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-offset-2 col-sm-10">
      									<a class="botoRojo" href="javascript:submitThisformActualizar('eliminarPerfil')">Eliminar perfil</a>
      									<a href="javascript:submitThisformActualizar('actualizarPerfil')"  type="submit" class="botoVerde">Actualizar datos</a>
      								</div>
  									</div>
  </div>      
  
  </form>
   
  </div>
  
<div class="verMas">
							<a href="javascript:volver()"><span class="glyphicons glyphicons-undo"></span> Volver</a>
							<a href="javascript:void(0)" class="pull-right"><span class="glyphicons glyphicons-circle-exclamation-mark"></span> Ayuda</a>
						</div>
   
  


<script>
function submitThisformActualizar(accion)
{
	$('#inHacia').val(accion);
	var formulario= $('#formActualizar');
	var action='usuario/perfilAction.do';
	SubmitFormulario(action, formulario);
	
	//$('#divResultado').removeClass( "encuentra" );
	
}



</script>	
</body>
</html>


