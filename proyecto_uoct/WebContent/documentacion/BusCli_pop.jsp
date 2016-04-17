<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.List, java.util.Iterator,proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.documentacion.VO.CliEntVO" errorPage=""%>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
  List clientes = (List) request.getAttribute("listaCliEnt");
%>
<html>
<head>
<title>Buscar cliente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
function pasaNomId(nom,id){
	window.opener.pasaCli(nom,id);
}

</script></head>
<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="left">Buscar Cliente</h3></td>
  </tr>
  <tr>
    <td><div align="center">
        <table width="434" border="1" align="left">
          <tr>
            <td width="253" bgcolor="#FFFF99"> <div align="center"> <strong>Por
                palabra clave:</strong> </div></td>
            <td width="165" bgcolor="#C0FACF">
              <div align="center"> <strong>Clientes
                Particulares</strong> </div></td>
          </tr>
          <tr>
            <td height="69" bgcolor="#FFFF99">
              <div align="center">
                <form action="clienteAction.do" method="POST">
                  <input type="hidden" name="hacia" value="busCli_pop"/>
                  <input type="text" name="palClave">
                  <br>
                  <input type="submit" name="PorPalabra" value="Buscar">
                </form>
              </div></td>
            <td bgcolor="#C0FACF">
              <form action="clienteAction.do">
                <div align="center">
                  <p>
                    <input type="hidden" name="hacia" value="busCli_pop">
                    <input type="submit" name="Particulares" value="Buscar"/>
                  </p>
                </div>
              </form></td>
          </tr>
        </table>
      </div>
      </td>
  </tr>
  <tr>
    <td><h6 align="left"><strong> (*)nombre,apellido, direcci&oacute;n,entidad
        Ext.,etc.</strong></h6></td>
  </tr>
  <tr>
    <td> <div align="left">
        <%if(clientes!=null){
  Iterator icl=clientes.iterator();
  request.setAttribute("icl",icl);
  %>
        <h4>Lista de Clientes </h4>
		<display:table name="icl" pagesize="15" requestURI="clienteAction.do" id="icls" class="its" >
        <display:column title="Seleccionar">
        <a href="#" onClick="return pasaNomId('<%=((CliEntVO)icls).getNomCli()+" "+((CliEntVO)icls).getApeCli()%>','<%=((CliEntVO)icls).getIdCli()%>')">Seleccionar</a>
        </display:column> <display:column sortable="true" title="Cliente"> <%=((CliEntVO)icls).getNomCli()+" "+((CliEntVO)icls).getApeCli() %> </display:column> <display:column sortable="true" title="Entidad externa">
        <%if(((CliEntVO)icls).getNomEnt()!=null){ %>
        <%=((CliEntVO)icls).getNomEnt()%>
        <%}else{ %>
        <%="&nbsp;"%>
        <%} %>
        </display:column> <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
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
        <display:setProperty name="export.amount" value="list"/> </display:table>
        <%} %>
      </div></td>
  </tr>
</table>

<hr>
<div align="right"><a href="../ayuda/documentacion.html" target="_blank">Ayuda</a> </div>
</body>
</html>

