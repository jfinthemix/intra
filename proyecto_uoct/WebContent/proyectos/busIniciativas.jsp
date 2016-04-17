<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.List,java.util.Iterator,proyecto_uoct.proyecto.VO.DetalleProyectoVO" errorPage="" %>
<%@ page import="proyecto_uoct.usuario.VO.UsuarioVO,proyecto_uoct.proyecto.VO.ProyectodeListaVO " %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

List proyectosaCargo=(List) request.getAttribute("proyectosaCargo");
List proyectosEnEquipo=(List) request.getAttribute("proyectosEnEquipo");
List otrosProyectos=(List) request.getAttribute("otrosProyectos");
Integer edini=(Integer) request.getAttribute("edini");

Date hoy = new Date();
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
Integer ano = Integer.valueOf(sdf2.format(hoy));

%>
<html>
<head>
<title>Búsqueda de Iniciativas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="left">Iniciativas de Inversión</h3></td>
  </tr>
  <tr>
    <td><div align="left">Seleccione el a&ntilde;o de inicio del Proyecto </div></td>
  </tr>
  <form action="proyectoAction.do" method="POST">
  <tr>
    <td>
        <div align="left">
          <input type="hidden" name="hacia" value="buscarIni" />
          <select name="ano" >
            <option value="0">Todos</option>
            <option value="<%=ano.intValue()+1%>"><%=ano.intValue()+1%></option>
            <%   for (int ia=0;ia<=5;ia++){


              if(ia==0){%>

            <option value="<%=ano.intValue()-ia%>" selected="selected"><%=ano.intValue()-ia%></option>
            <%}else{
            %>
            <option value="<%=ano.intValue()-ia%>"><%=ano.intValue()-ia%></option>
           <%}} %>
          </select>


        </div>
      </td>
      </tr>
      <tr>
      <td><input type="checkbox" name="soloActivos"/>Buscar solamente activos</td>
        </tr>
        <tr>
          <td>
        <input type="submit" name="buscarProyecto" value="Buscar" /></td>
      </tr>
  </form>
  <tr>
    <td><div align="left">
        <%if (proyectosaCargo!=null){
%>
        <display:table name="proyectosaCargo" id="inis" pagesize="15" class="its" requestURI="proyectoAction.do" >
          <display:caption> <font size="2" ><strong>Iniciativas a mi cargo </strong>   </font>     </display:caption>
        <display:column title="Nombre de la Iniciativa" property="nomProy" href="proyectoAction.do?hacia=detalleIni" paramProperty="idProy" paramId="idProy">
        </display:column>

        <display:column title="Encargado" property="encargado"><% %>
        </display:column>

        <display:column title="Fecha de Inicio"><%=sdf.format(((ProyectodeListaVO)inis).getFechaProy()) %> </display:column>

        <display:column title="Estado">
        <%if(((ProyectodeListaVO)inis).getIsActivo()){out.print("Activo");}else{out.print("Inactivo");} %>
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
        <%} %>
      </div></td>
  </tr>

  <tr>
    <td height=20>&nbsp;</td>
  </tr>

   <tr>
    <td><div align="left">
        <%if (proyectosEnEquipo!=null){
%>
        <display:table name="proyectosEnEquipo" id="inis" pagesize="15" class="its" requestURI="proyectoAction.do">
          <display:caption><font size="2" ><strong>Iniciativas en que participo </strong></font></display:caption>
        <display:column title="Nombre de la Iniciativa" property="nomProy" href="proyectoAction.do?hacia=detalleIni" paramProperty="idProy" paramId="idProy">
        </display:column>

        <display:column title="Encargado" property="encargado">
        </display:column>

        <display:column title="Fecha de Inicio"><%=sdf.format(((ProyectodeListaVO)inis).getFechaProy()) %> </display:column>

        <display:column title="Estado">
        <%if(((ProyectodeListaVO)inis).getIsActivo()){out.print("Activo");}else{out.print("Inactivo");} %>
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
        <%} %>
      </div></td>
  </tr>

    <tr>
    <td height=20>&nbsp;</td>
  </tr>

   <tr>
    <td><div align="left">
        <%if (otrosProyectos!=null){
%>
        <display:table name="otrosProyectos" id="inis" pagesize="15" class="its" requestURI="proyectoAction.do">
          <display:caption><font size="2" ><strong>Otros Proyectos </strong></font></display:caption>
        <display:column title="Nombre de la Iniciativa" property="nomProy" href="proyectoAction.do?hacia=detalleIni" paramProperty="idProy" paramId="idProy">
        </display:column>

        <display:column title="Encargado" property="encargado">
        </display:column>

        <display:column title="Fecha de Inicio"><%=sdf.format(((ProyectodeListaVO)inis).getFechaProy()) %> </display:column>

        <display:column title="Estado">
        <%if(((ProyectodeListaVO)inis).getIsActivo()){out.print("Activo");}else{out.print("Inactivo");} %>
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
        <%} %>
      </div></td>
  </tr>

</table>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
