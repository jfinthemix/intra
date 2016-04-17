<%@page import="proyecto_uoct.reservas.VO.RecursoVO" %>
<%
RecursoVO rec=(RecursoVO) request.getAttribute("RECURSO");
%>
<html>
<head>
<title>Edición de Recursos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3>Editar Recurso</h3></td>
  </tr>
  <tr>
    <td><form action="recursosAction.do" name="actuRecForm" method="POST">
        <input type="hidden" name="accion" value="ACTUALIZAR_RECURSO" />
        <input type="hidden" name="idRec" value="<%=rec.getIdRecurso() %>" />
        <table width="417" border="1" align="left">
          <tr>
            <td width="83" bgcolor="#ADD8E4">
              <div align="right"><strong>Nombre</strong></div></td>
            <td width="318">
<input name="nombre" type="text" value="<%=rec.getNombre() %>"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4">
			<div align="right"><strong>Descripci&oacute;n</strong></div></td>
            <td> <textarea name="desc" cols="40"><%= rec.getDescripcion()%></textarea></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4">
			<div align="right"><strong>Estado</strong></div></td>
            <td><select name="idEstado" size="1">
                <%%>
                <option value="1" <%if (rec.getIsActivo()){out.print(" selected=\"selected\"");}%>>Activo</option>
                <option value="0" <%if (!rec.getIsActivo()){out.print(" selected=\"selected\"");}%>>Inactivo</option>
              </select> </td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <input name="Input" type="submit" value="Guardar los Cambios">
                &nbsp;
                <input name="reset" type="reset" value="Restablecer el Formulario" />
              </div>
              <div align="center"> </div></td>
          </tr>
        </table>
      </form></td>
  </tr>

</table>

<script language="JavaScript" type="text/javascript">
var frmvalidator  = new Validator("actuRecForm");
frmvalidator.addValidation("nombre","req","Debe ingresar el nombre del recurso");
frmvalidator.addValidation("nombre","alnumspace");
frmvalidator.addValidation("nombre","maxlen=35","Nombre no puede superar los 35 caracteres");

frmvalidator.addValidation("desc","req","Debe indicar la descripción del recurso");
frmvalidator.addValidation("desc","maxlen=100","Descripción no puede superar los 100 caracteres");

</script>

<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/recursos.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>

