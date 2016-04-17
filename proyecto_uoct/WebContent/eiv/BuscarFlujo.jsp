<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.List, java.util.Iterator,proyecto_uoct.EIV.VO.FlujoVO" errorPage="" %>
<%@ page import="java.text.SimpleDateFormat,proyecto_uoct.foro.VO.DocForoVO" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
List flujos= (List) request.getAttribute("listaFlujos");
%>
<html>
<head>
<title>Busqueda de Flujos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
  <!-- calendario popup-->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->

</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="center">Buscar flujos vehiculares</h3></td>
  </tr>
  <form name="form1" method="post" action="flujoAction.do">
    <input type="hidden" name="hacia" value="buscarFlujos">
    <tr>
      <td><div align="center">
          <table width="437" border="1" align="center">
            <tr>
              <td width="156" bgcolor="#ADD8E4"><strong>Por estudio(EISTU No.):</strong></td>
              <td width="265"> <input name="ideiv" type="text" size="10"> </td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><strong>Por fecha:</strong></td>
              <td><input type="text" name="fecha" size=8 readonly="readonly">
                <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><strong>Por calle involucrada: </strong></td>
              <td><input type="text" name="calle"></td>
            </tr>
            <tr>
              <td colspan="2"><div align="center">
                  <input type="submit" name="Submit" value="Buscar">
                </div></td>
            </tr>
          </table>
        </div></td>
    </tr>
  </form>
  <tr>
    <td><div align="center">
        <script language="JavaScript" type="text/javascript">
				var cal1 = new calendar1(document.forms['form1'].elements['fecha']);
				cal1.year_scroll = true;
				cal1.time_comp = false;

       </script>
        <br/>
        <%if(flujos!=null){
   Iterator iflu=flujos.iterator();
  request.setAttribute("iflu",iflu);
  %>
        <display:table  pagesize="15" name="iflu" requestURI="flujoAction.do" class="its" id="flus" >

        <display:column sortable="true" title="EISTU" sortProperty="idEIV">
          <a href="eivAction.do?hacia=detalleEIV&id_eiv=<%=((FlujoVO)flus).getIdEIV()%>">EISTU-<%=((FlujoVO)flus).getIdEIV()%></a>
        </display:column>
        <display:column  title="Fecha de la Medición"><%=sdf.format(((FlujoVO)flus).getFecha())%> </display:column>
        <display:column  title="Intersección" ><%=((FlujoVO)flus).getInterseccion() %> </display:column>
        <display:column  title="Horas" ><%=((FlujoVO)flus).getHorasMed()%> </display:column>
        <display:column  title="Tipo de Día"><%=((FlujoVO)flus).getTipoDia() %> </display:column>


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

      </display:table>
        <% }%>
      </div></td>
  </tr>
</table>
<hr>
 <div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div> <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
