<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List,java.util.LinkedList,java.util.Iterator"  %>
<%@page import="proyecto_uoct.common.VO.ModuloVO,proyecto_uoct.common.VO.FuncionalidadVO"  %>
<%
List funs=(List)request.getAttribute("funcionalidades");
List mods=(List)request.getAttribute("modulos");
String nomPer= (String)request.getAttribute("nomPer");


Iterator im=mods.iterator();
int cont_smenu=0;
%>

<head>
<title>Detalle de Perfil:<%=nomPer %></title>
<link href="../util/stylb.css" rel="stylesheet" type="text/css" />
</head>

<body >

<h2>Detalles del perfil</h2>

<div class="box">

<h4>Datos del perfil</h4>

<form class="form-horizontal" action="perfilAction.do" name="id_funcs" method="POST">
	<div class="form-group">
	<label for="inputNombre" class="col-sm-4 control-label">Nombre del perfil</label>
	<div class="col-sm-8">
	<input type="text" class="form-control" id="inputNombre" value="<%=nomPer %>" disabled="">
		</div>
</div>
<hr>
<div class="form-group">
<%


while (im.hasNext()){                  // PARA CADA MODULO
ModuloVO m= (ModuloVO)im.next();

Iterator ifun=funs.iterator();

List temp=new LinkedList();              //CREA UNA LISTA TEMPORAL
int cont=0;

// PARA CADA FUNCIÓN , SI PERTENECE AL MODULO, LA GUARDA EN LA LISTA TEMPORAL CONTANDO CUANTAS VAN

while (ifun.hasNext()){
  FuncionalidadVO f=(FuncionalidadVO)ifun.next();
  if(f.getIdModulo().equals(m.getIdModulo())){
    temp.add(f);
    cont++;
  }
}


// SI EN LA LISTA TEMPORAL HAY FUNCIONALIDADES IMPRIME EL MODULO Y LAS FUNCIONALIDADES
if(cont!=0){
  cont_smenu++;
  out.println(
		  "<div class=\"form-group\">"+
			  "<label for=\"\" class=\"col-sm-4 control-label\">"+m.getNombreModulo()+":</label>"+
		  	"<div class=\"col-sm-8\">");
  Iterator itemp=temp.iterator();
  while(itemp.hasNext()){
    FuncionalidadVO ftemp=(FuncionalidadVO)itemp.next();
out.println("    <p class=\"form-control-static\">"+ftemp.getNombreFun()+"</p>");

    }
  out.println("</div>");
  out.println("</div>");
  }

}
%>
 
</form>
<hr>
</div>
</div>

<div class="verMas">
							<a href="javascript:volver()"><span class="glyphicons glyphicons-undo"></span> Volver</a>
							<a href="javascript:void(0)" class="pull-right"><span class="glyphicons glyphicons-circle-exclamation-mark"></span> Ayuda</a>
						</div>
</body>
</html>

