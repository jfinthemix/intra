<%@page import="java.util.List,java.util.Iterator,proyecto_uoct.reservas.VO.RecursoVO" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%

List recursos=(List)request.getAttribute("RECURSOS");
String mensaje=(String) request.getAttribute("mensaje");
Iterator ir=recursos.iterator();
request.setAttribute("ir",ir);
String estado="";
%>

<html>
<head>
<title>Administrar Recursos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3>Administrar Recursos compartidos</h3></td>
  </tr>
  <tr>
    <td><h4>Nuevo Recurso:</h4></td>
  </tr>
  <tr>
    <td>
	      <%if(mensaje!=null){out.print(mensaje);} %>
	<form action="recursosAction.do" name="formulario1" method="POST">
        <input type="hidden" name="accion" value="REGISTRAR_RECURSO" />
        <table width="439" border="1" align="left">
          <tr>
            <td width="111" bgcolor="#ADD8E4">
              <div align="right"><strong>Nombre:</strong></div></td>
            <td width="312">
<input name="nombre" type="text" size="30" maxlength="20"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4">
<div align="right"><strong>Descripci&oacute;n:</strong></div></td>
            <td><textarea name="desc" cols="40"></textarea></td>
          </tr>
          <tr>
            <td height="31" colspan="2">
<div align="center">
                <input type="submit" name="Submit" value="Ingresar">
              </div></td>
          </tr>
        </table>
      </form></td>
  </tr>




<script language="JavaScript" type="text/javascript">
var frmvalidator  = new Validator("formulario1");
frmvalidator.addValidation("nombre","req","Debe ingresar el nombre del recurso");
frmvalidator.addValidation("nombre","alnumspace");
frmvalidator.addValidation("nombre","maxlen=35","Nombre no puede superar los 35 caracteres");

frmvalidator.addValidation("desc","req","Debe indicar la descripci�n del recurso");
frmvalidator.addValidation("desc","maxlen=100","Descripci�n no puede superar los 100 caracteres");

</script>




  <tr>
    <td><h4>Lista de Recursos</h4></td>
  </tr>
  <tr>
    <td>

      <display:table name="ir" class="its" requestURI="recursosAction.do" id="idRecList" >

      <display:column title="Nombre Recurso"> <%=((RecursoVO)idRecList).getNombre() %>
      </display:column>
	   <display:column title="Descripci�n" class="texto"> <%=((RecursoVO)idRecList).getDescripcion() %>
      </display:column>
	  <display:column title="Estado">
      <%if(((RecursoVO)idRecList).getIsActivo()){
   estado="Activo";}
   else{estado="Inactivo";}
    %>
      <%=estado %> </display:column>
	  <display:column title="Editar" href="recursosAction.do?accion=EDITAR_RECURSO" paramId="idRecurso" paramProperty="idRecurso">
      <%="Editar" %> </display:column>


	  	<display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
        <display:setProperty name="basic.empty.showtable" value="true"/>
		<display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
        <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
        <display:setProperty name="paging.banner.placement" value="bottom"/>
		<display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
        <display:setProperty name="paging.banner.one_item_found" value="<span class='pagebanner'>Se encontr&oacute; un {0}.</span>"/>
        <display:setProperty name="paging.banner.all_items_found" value="<span class='pagebanner'>{0} {1} encontrados.</span>"/>
        <display:setProperty name="paging.banner.some_items_found" value="<span class='pagebanner'>{0} {1} encontrados.Mostrando {2} a {3}.</span>"/>
        <display:setProperty name="paging.banner.full" value="<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Ant</a>]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.first" value="	<span class=\"pagelinks\">[Primero/Prev]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
		<display:setProperty name="paging.banner.last" value="	<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Prev</a>]{0}[Sgte/Ultimo]"></display:setProperty>
		<display:setProperty name="export.csv" value="false"/>
        <display:setProperty name="export.xml" value="false"/>
		<display:setProperty name="export.rtf" value="false"/>
        <display:setProperty name="export.excel.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.pdf.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.xml.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.csv.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' height='10'>"/>
        <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' height='10'>"/>
        <display:setProperty name="export.amount" value="list"/>


	  </display:table></td>
  </tr>
</table>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/recursos.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>

