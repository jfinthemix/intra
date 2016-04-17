<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%@ page import="proyecto_uoct.common.VO.IdStrVO,java.util.Iterator,java.text.SimpleDateFormat,java.util.List,java.util.Date,proyecto_uoct.proyecto.VO.DetalleOTVO,proyecto_uoct.proyecto.VO.DetalleProyectoVO" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

List ot=(List)request.getAttribute("ot");
request.setAttribute("ots",ot);

List est=(List)request.getAttribute("est");


%>

<html>
<head>
<title>Buscardor de OT</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="../util/styla.css" rel="stylesheet" type="text/css">

<!-- American format mm/dd/yyyy -->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->


</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="left">Buscador de OT </h3></td>
  </tr>
  <tr>
    <td><form action="proyectoAction.do" name="busOTform" method="POST">
        <div align="left">
          <input type="hidden" name="hacia" value="buscarOT" />
          <table width="331" border="1" align="left" cellpadding="0">

            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Palabra Clave(*)</strong></div></td>
              <td><input type="text" name="palClave"></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Estado</strong></div></td>
              <td><select name="idEstado" size="1">
                  <option value=""></option>
                  <% if(est!=null){
        Iterator ie=est.iterator();
        while (ie.hasNext()){
          IdStrVO id=(IdStrVO)ie.next();
        %>
                  <option value="<%=id.getId()%>"><%=id.getStr() %></option>
                  <%}}%>
                </select></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha Vencimiento</strong></div></td>
              <td> <input type="text" name="fechaVenc" size=8 readonly="readonly"/>
                &nbsp; <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td colspan="2"><div align="center">
                  <input type="submit" name="buscar" value="Buscar">
                </div></td>
            </tr>
          </table>
        </div>
      </form></td>
  </tr>
  <tr>
    <td> <div align="left">
        <script language="JavaScript" type="text/javascript">
      var cal1 = new calendar1(document.forms['busOTform'].elements['fechaVenc']);
      cal1.year_scroll = true;
      cal1.time_comp = false;
    </script>
        (*)Palabra en el nombre de la OT, nombre de la Iniciativa o en el estado
        de pago.</div></td>
  </tr>
  <tr>
    <td><h4 align="left">Lista de OT Encontradas</h4></td>
  </tr>
  <tr>
    <td> <div align="left">
        <%if(ot!=null){
    %>
        <display:table name="ots" class="its" pagesize="15" requestURI="proyectoAction.do" id="o">

         <display:column title="Orden de Trabajo" property="nomOT" sortable="true" href="proyectoAction.do?hacia=detalleOT"  paramProperty="idOT" paramId="idOT">
        </display:column> <display:column title="Estado de la OT" property="estadoOT" sortable="true">
        </display:column> <display:column title="Fecha Vencimiento"> <%=sdf.format(((DetalleOTVO)o).getVencimiento()) %> </display:column> <display:column title="Proyecto" sortable="true">
        <a href="proyectoAction.do?hacia=detalleIni&idProy=<%=((DetalleOTVO)o).getDetProy().getIdProy()%>"><%=((DetalleOTVO)o).getDetProy().getNomProy()%></a> </display:column>

		<display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
        <display:setProperty name="basic.empty.showtable" value="true"/>
	 <display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
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
        <%}%>
      </div></td>
  </tr>
</table>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>

