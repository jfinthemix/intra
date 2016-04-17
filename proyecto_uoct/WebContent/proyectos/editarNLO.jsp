<%@page import="proyecto_uoct.proyecto.VO.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
DetalleProyectoVO proy=(DetalleProyectoVO)request.getAttribute("detalleProy");
NLOdeListaVO nlo= (NLOdeListaVO)request.getAttribute("detnlo");
DetalleOTVO ot=(DetalleOTVO)request.getAttribute("ot");
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>
<html>
<head>
<title>
editarNLO
</title>

<link href="../util/styla.css" rel="stylesheet" type="text/css">
<!-- American format mm/dd/yyyy -->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->
<!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

<script language="JavaScript" type="text/javascript">

function confirmarEliminacion(f){
  borrar = window.confirm('Al eliminar esta NLO no quedará ningún registro de ella, ni en el modulo de Iniciativas de Inversión, ni en el de Documentación: ¿Está seguro que desea continuar?');
  (borrar)?f.submit():'return false';
}


</script>

</head>
<body>
<table width="750" border="0">
  <tr>
    <td><h3>Edicion de NLO</h3></td>
  </tr>
  <form action="proyectoAction.do" name="form1" method="POST">
  <tr>
    <td>
        <input type="hidden"  name="hacia" value="actualizarNLO"/>
        <input type="hidden" name="idNLO" value="<%=nlo.getId()%>" />
        <div align="center">
          <table width="417" border="1" align="left">
            <tr>
              <td width="136" bgcolor="#ADD8E4"><div align="right"><strong>Iniciativa</strong></div></td>
              <td width="215"><%=proy.getNomProy() %></td>
            </tr>
            <%if(ot!=null){ %>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>OT</strong></div></td>
              <td><%=ot.getNomOT() %></td>
            </tr>
            <%} %>

            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Descripción de
                  la NLO</strong></div></td>
              <td><textarea cols="50" rows="6" name="nota"><%=nlo.getStr() %></textarea></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha de la NLO</strong></div></td>
              <td> <input type="text" name="fechaNLO" size=8 readonly="readonly" value="<%=sdf.format(nlo.getFechaNLO()) %>"/>
                &nbsp; <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
          </table>

        </div>

      </td>
  </tr>

  <tr>
    <td><input type="submit" name="s" value="Guardar los cambios" /> &nbsp; <input type="reset" name="r" value="Reestablecer los valores" />   </form>

    </td>
  </tr>
</table>

<form action="proyectoAction.do" name="borrarNLO" method="POST">
  <input type="hidden" name="idNLO" value="<%=nlo.getId()%>">
    <input type="hidden" name="hacia" value="eliminarNLO">
<input type="button" name="eliminar" value="Eliminar NLO" onclick="confirmarEliminacion(this.form);" />
</form>




<script language="JavaScript" type="text/javascript">
var frmvalidator  = new Validator("form1");

frmvalidator.addValidation("nota","req","Debe indicar la descripción de la nlo");
    frmvalidator.addValidation("nota","maxlen=500","Descripción de la NLO no puede superar los 500 caracteres");

</script>

<script language="JavaScript" type="text/javascript">
      var cal1 = new calendar1(document.forms['form1'].elements['fechaNLO']);
      cal1.year_scroll = true;
      cal1.time_comp = false;
    </script>
<hr>
 <div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div> <div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>

</body>
</html>
