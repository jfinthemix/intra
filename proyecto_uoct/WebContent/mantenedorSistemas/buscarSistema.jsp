<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*,proyecto_uoct.mantenedorSistemas.VO.*,java.util.Iterator"  errorPage=""%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
String mensaje          = (String) request.getAttribute("mensaje");
//inicializo lista_sistema
LinkedList listaSistema                      = new LinkedList();
listaSistema                                 = (LinkedList) request.getAttribute("listaSistema");
Integer idPerfil                              = (Integer) request.getAttribute("idPerfil");
Integer cero                                  = new Integer(0);
%>
<html>
<head>
<title>Mantenedor de Sistemas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/javascript">
function valida_envia(){
  document.formMantenedorSistema.submit();
}
function confirmaEliminacion(){
  var resp=confirm("Al eliminar este sistema se eliminará todo lo asociado a él.\n ¿Desea continuar con la eliminación?");
  return resp;
}
</script>
<style type="text/css">
.centrado{
align="center";
}</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
  <form name="formMantenedorSistema" method="post" action="../mantenedorSistemas/sistemaAction.do">
    <table width="100%" border="0" align="left">
      <tr>
        <td colspan="2"><h3 align="left">Mantenedor de Sistemas</h3></td>
      </tr>
      <tr>
        <td colspan="2"><font color="red">
       <%
        if (mensaje != null){
          out.print("<br>"+mensaje+"<br>");
        }
        %></font>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">


          <display:table  name="listaSistema" export="true" class="its" id="ls" pagesize="20" requestURI="sistemaAction.do">
          <display:column media="html excel pdf" class="centrado" title="nombre del sistema"  sortable="false" sortProperty="nombre"><%=((SistemaVO)ls).getNombre() %></display:column>
          <display:column media="html"           class="centrado" title="modificar "          sortable="false" sortProperty="modificar">
            <a href="sistemaAction.do?hacia=modificar&&id_sistema=<%out.print(((SistemaVO)ls).getIdSistema());%>&&nombre=<%out.print(((SistemaVO)ls).getNombre());%>" title="Modificar sistema"><img src="imagenes/icono_detalle.png" width="17" height="17" alt="" border="0"></a>
          </display:column>

          <% if(idPerfil.equals(cero)){
           idPerfil=idPerfil;
         }
          else{%>
          <display:column media="html"           class="centrado" title="eliminar "           sortable="false" sortProperty="eliminar">
            <a href="sistemaAction.do?hacia=eliminar&&id_sistema=<%out.println(((SistemaVO)ls).getIdSistema());%>" title="Eliminar sistema" onClick='return confirmaEliminacion()'><img src="imagenes/icono_delete.png" alt="" width="17" height="17" border="0"></a>
          </display:column>
          <% }%>


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
        <display:setProperty name="export.excel.filename" value="ListaSistema.xls"/>
        <display:setProperty name="export.pdf.filename" value="ListaSistema.pdf"/>
        <display:setProperty name="export.xml.filename" value="ListaSistema.xml"/>
        <display:setProperty name="export.csv.filename" value="ListaSistema.csv"/>
        <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' height='10' border='0'>"/>
        <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' height='10' border='0'>"/>
        <display:setProperty name="export.amount" value="list"/>
        </display:table>

        </td>
      </tr>
      <tr>
        <td colspan="2">
            <script language="JavaScript" type="text/javascript">
            var frmvalidator  = new Validator("formMantenedorSistema");
          </script>
        </td>
      </tr>
    </table>
    <br>
  <hr><div align="right"><a href="../ayuda/mantSistemas.html" target="_blank">Ayuda</a></div>
  </form>
</body>
</html>
