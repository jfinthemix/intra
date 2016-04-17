<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="proyecto_uoct.proyecto.VO.DetalleProyectoVO,java.util.List,java.util.Iterator" errorPage="" %>
<%@ page import="proyecto_uoct.usuario.VO.UsuarioVO" %>
<%@ page import="proyecto_uoct.proyecto.VO.DocumentodeListaProyVO,proyecto_uoct.proyecto.VO.OTdeListaVO"%>
<%@ page import="proyecto_uoct.proyecto.VO.NLOdeListaVO,proyecto_uoct.documentacion.VO.DocumentoInVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

DetalleProyectoVO detproy= (DetalleProyectoVO) request.getAttribute("detalleProy");


%>

<html>
<head>
<title>Detalle de Iniciativa</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

function confirmaEliminacion(){
  alert("Advertencia:La operación de eliminar una OT no se puede deshacer");
var resp=confirm("Al eliminar una OT también se eliminarán las NLO asociadas.\n ¿Está seguro de continuar? ");
return resp;
}

</script>

</head>

<body>
<div align="center">
  <table width="750" border="0">
    <tr>
      <td><h3>OTs de la Iniciativa : <%=detproy.getNomProy() %></h3></td>
    </tr>
    <tr>
      <td><div align="right"><a href="proyectoAction.do?hacia=aRegOT&idProy=<%=detproy.getIdProy()%>">Registrar
          una nueva OT</a></div></td>
    </tr>
    <tr>
      <td> <div align="left">
          <%
 List ots=(List) detproy.getOTs();
 if(ots.size()!=0){
 request.setAttribute("otss",ots);
 %>
          <display:table id="o" name="otss" requestURI="proyectoAction.do" class="its">

          <display:column title="Nombre de la OT" property="str" href="proyectoAction.do?hacia=detalleOT" paramId="idOT" paramProperty="id" maxLength="50">
          </display:column> <display:column title="Fecha Vencimiento" ><%= sdf.format(((OTdeListaVO)o).getFechaInicio()) %> </display:column> <display:column title="Estado" property="estadoOT">
          </display:column> <display:column title="Editar Fechas" href="proyectoAction.do?hacia=editarFechasOT" paramId="idOT" paramProperty="id">
          Editar Fechas </display:column> <display:column title="Editar OT"> <a href="proyectoAction.do?hacia=editarOT&idProy=<%=detproy.getIdProy()%>&idOT=<%=((OTdeListaVO)o).getId()%>" >Editar
          OT</a> </display:column> <display:column title="Editar NLOs de la OT">
          <a href="proyectoAction.do?hacia=adminNLOdelaOT&idOT=<%=((OTdeListaVO)o).getId()%>" >Editar
          NLO de OT</a> </display:column> <display:column title="Borrar OT"> <a href="proyectoAction.do?hacia=borrarOT&idOT=<%=((OTdeListaVO)o).getId()%>&idProy=<%=detproy.getIdProy()%>" onClick="return confirmaEliminacion();" >Borrar
          OT</a> </display:column>


		  <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
  <display:setProperty name="basic.empty.showtable" value="true"/> <display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
  <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
  <display:setProperty name="paging.banner.placement" value="bottom"/> <display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
  <display:setProperty name="paging.banner.one_item_found" value="<span class='pagebanner'>Se encontr&oacute; un {0}.</span>"/>
  <display:setProperty name="paging.banner.all_items_found" value="<span class='pagebanner'>{0} {1} encontrados.</span>"/>
  <display:setProperty name="paging.banner.some_items_found" value="<span class='pagebanner'>{0} {1} encontrados.Mostrando {2} a {3}.</span>"/>
  <display:setProperty name="paging.banner.full" value="<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Ant</a>]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
  <display:setProperty name="paging.banner.first" value="	<span class=\"pagelinks\">[Primero/Prev]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
  <display:setProperty name="paging.banner.last" value="	<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Prev</a>]{0}[Sgte/Ultimo]"></display:setProperty>
  <display:setProperty name="export.csv" value="false"/> <display:setProperty name="export.xml" value="false"/>
  <display:setProperty name="export.rtf" value="false"/> <display:setProperty name="export.excel.filename" value="registroDocumentacion"/>
  <display:setProperty name="export.pdf.filename" value="registroDocumentacion"/>
  <display:setProperty name="export.xml.filename" value="registroDocumentacion"/>
  <display:setProperty name="export.csv.filename" value="registroDocumentacion"/>
  <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' height='10'>"/>
  <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' height='10'>"/>
  <display:setProperty name="export.amount" value="list"/>




		   </display:table>
          <%} %>
        </div></td>
    </tr>
  </table>
</div>


<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="center"><input type="button" value="Volver atrás" onclick="history.back()" style="font-family: Verdana; font-size: 12 pt"></div><div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
