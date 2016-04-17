<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%@ page import="proyecto_uoct.reservas.VO.*"%>
<%@ page import="java.util.*"%>

<%
List recursos = (List) request.getAttribute("RECURSOS");

%>

<html>
  <head>
    <title>Recursos compartidos</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <script type="text/javascript">

    function goVerAgenda(id) {
      formulario.idRecurso.value = id;
      formulario.accion.value = "VER_AGENDA";
      formulario.submit();
    }

    </script>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>
<form action="recursosAction.do" method="POST" name="formulario">
  <input type="hidden" name="accion" value="" />
  <input type="hidden" name="idRecurso" value="" />


 <table width="750" border="0">
<tr>
  <td><div align="center"><h3><strong>Recursos compartidos de UOCT</strong> </h3></div></td>
  </tr>
  <tr>
  <td><div align="left">

  <display:table id="recurs" name="RECURSOS" class="its" requestURI="recursosAction.do">
    <display:column title="Recurso" property="nombre" sortable="true" sortProperty="nombre">
    </display:column>

    <display:column title="Descripción" property="descripcion">
    </display:column>

    <display:column title="Agenda">
    <a href="#" onClick="goVerAgenda(<%= ((RecursoVO)recurs).getIdRecurso()%>)"> Ver Agenda</a>
    </display:column>

  </display:table>
</div>
</td>
</tr>
</table>

</form>

  <!--

<table width="750" border="0">
  <tr>
    <td><h3>Recursos compartidos de UOCT </h3></td>
  </tr>
  <tr>
    <td><form name="formulario" action="recursosAction.do" method="POST">
        <input type="hidden" name="idRecurso"/>
        <input type="hidden" name="accion"/>
        <table width="558" border="1" align="left">
          <tr bgcolor="#ADD8E4">
            <td width="215">
              <div align="center"><strong>Recurso</strong></div></td>
            <td width="227">
              <div align="center"><strong>Descripci&oacute;n</strong></div></td>
            <td width="94">
              <div align="center"><strong>Ver Agenda</strong></div></td>
          </tr>
          <%
    Iterator i = recursos.iterator();
    while(i.hasNext()) {
      RecursoVO recurso = (RecursoVO) i.next();
      %>
          <tr>
            <td><%= recurso.getNombre()%></td>
            <td><%= recurso.getDescripcion()%></td>
            <td><a href="#" onClick="goVerAgenda(<%= recurso.getIdRecurso()%>)">
              Ver Agenda</a> </td>
          </tr>
          <%}%>
        </table>
      </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
-->

<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/recursos.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>

