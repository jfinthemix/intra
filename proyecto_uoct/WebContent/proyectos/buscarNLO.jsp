<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%@ page import="java.text.SimpleDateFormat,proyecto_uoct.proyecto.VO.*,proyecto_uoct.documentacion.VO.DocumentoInVO" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

%>
<html>
<head>
<title>Buscar NLO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

 <!-- European format dd-mm-yyyy -->
<script language="JavaScript" src="../util/calendario/calendar1.js" type="text/javascript"></script>  <!-- Date only with year scrolling -->
  <!-- American format mm/dd/yyyy -->
<script language="JavaScript" src="../util/calendario/calendar2.js" type="text/javascript"></script>  <!-- Date only with year scrolling -->

<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="left">Buscar de NLO</h3></td>
  </tr>
  <tr>
    <td><form action="proyectoAction.do" method="POST" name="form1">
        <div align="left">
          <input type="hidden" name="hacia" value="buscarNLO"/>
          <table width="335" border="1" cellpadding="0">
            <input type="hidden" name="idnlo">

            <tr>
              <td bgcolor="#ADD8E4"><strong>Fecha de la NLO</strong></td>
              <td> <input type="text" name="fechaNLO" size=8 readonly="readonly"/>
                &nbsp; <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><strong>Palabra Clave(*)</strong></td>
              <td><input type="text" name="palClave"></td>
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
    <td><div align="left">
        <script language="JavaScript" type="text/javascript">
      var cal1 = new calendar1(document.forms['form1'].elements['fechaNLO']);
      cal1.year_scroll = true;
      cal1.time_comp = false;
    </script>
        (**) palabra en la NLO,en el título del proyecto o en el título de la
        OT.</div></td>
  </tr>
  <tr>
    <td><h4 align="left">Lista de NLO Encontradas</h4></td>
  </tr>
  <tr>
    <td> <div align="left"><display:table name="nlos" id="o" class="its" requestURI="proyectoAction.do" pagesize="15">

      		<display:column title="Fecha de la NLO"><%=sdf.format(((NLOVO)o).getFechaNLO())%> </display:column> <display:column title="Iniciativa" sortable="true" class="texto" property="nomProy" href="proyectoAction.do?hacia=detalleIni" paramId="idProy" paramProperty="idProy">
        </display:column>

      <display:column title="Descripción de la NLO" property="str" class="texto" >
        </display:column>

		<display:column title="OT" sortable="true" class="texto">
        <%if((((NLOVO)o).getOT().getNomOT())!=null){ %>
        <a href="proyectoAction.do?hacia=detalleOT&idOT=<%=((NLOVO)o).getOT().getIdOT() %>"><%=((NLOVO)o).getOT().getNomOT() %></a>
        <%}else{ %>
        &nbsp;
        <%} %>
        </display:column>
		<display:column title="Documento" class="texo"> <a href="../documentacion/documentoAction.do?hacia=detalleDoc&id_doc=<%=((NLOVO)o).getDocumento().getIdDoc() %>"><%=((NLOVO)o).getDocumento().getTipoDoc() %>-<%=((NLOVO)o).getDocumento().getCodDoc() %></a> </display:column>




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
      </div></td>
  </tr>
</table>
<div align="center">



</div>
<hr>
 <div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div> <div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>

