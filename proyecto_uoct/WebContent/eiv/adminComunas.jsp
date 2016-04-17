<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>
<%@page import="java.util.List,java.util.Iterator,proyecto_uoct.common.VO.IdStrVO"%>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%List comunas = (List) request.getAttribute("comunas");
String mensaje=(String) request.getAttribute("mensaje");
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Cache-Control" content="no-cache">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
  <!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
</head>
<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="center">Administrar Comunas</h3>
      <font color="red">
        <% if(mensaje!=null){out.print(mensaje);}%>
        </font></td>
  </tr>
  <tr>
    <td> <div align="center">
        <table width="500" border="1" align="center">
          <tr>
            <td><strong>Agregar comuna:</strong></td>
            <td><form action="eivAction.do" method="POST" name="formComuna">
                <input type="hidden" name="hacia" value="agregarComuna" />
                <input type="text" name="nuevaComuna" maxlength="30">
                <input type="submit" name="Submit" value="Agregar">
                <script language="JavaScript" type="text/javascript">
    var frmvalidator  = new Validator("formComuna");
    frmvalidator.addValidation("nuevaComuna","req","Debe ingresar el nombre de la comuna");
    frmvalidator.addValidation("nuevaComuna","maxlen=30","Nombre no puede superar los 30 caracteres");
    frmvalidator.addValidation("nuevaComuna","alnumspace");
  </script>
              </form></td>
          </tr>
        </table>
      </div></td>
  </tr>
  <tr>
    <td> <div align="left">
      <h4>Lista de Comunas</h4>
      <display:table name="comunas" id="co"  class="its" requestURI="eivAction.do">

        <display:column title="comuna" property="str">
        </display:column>

        <display:column title="Eliminar">
          <a href="eivAction.do?hacia=eliminarComuna&idComuna=<%=((IdStrVO)co).getId()%>">borrar</a>
        </display:column>


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

      </div></td>
  </tr>
</table>
<br><hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div><div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
