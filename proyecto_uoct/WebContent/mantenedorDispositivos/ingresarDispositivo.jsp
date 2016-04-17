<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*,proyecto_uoct.mantenedorDispositivos.VO.*,java.util.Iterator"  errorPage=""%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
String mensaje          = (String) request.getAttribute("mensaje");


LinkedList listaSubsistema      = new LinkedList();
listaSubsistema                 = (LinkedList) request.getAttribute("listaSubsistema");
LinkedList listaEmpresa         = new LinkedList();
listaEmpresa                    = (LinkedList) request.getAttribute("listaEmpresa");
LinkedList listaTipoDispositivo = new LinkedList();
listaTipoDispositivo            = (LinkedList) request.getAttribute("listaTipoDispositivo");


%>
<html>
<head>
<title>Mantenedor de Dispositivos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
function valida_envia(){
  document.formMantenedorDispositivo.submit();
}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
  <form name="formMantenedorDispositivo" method="post" action="../mantenedorDispositivos/dispositivoAction.do">
    <table width="100%" border="0" align="left">
      <tr>
        <td colspan="2"><h3 align="left">Mantenedor de Dispositivos</h3></td>
      </tr>
      <tr>
        <td colspan="2"><font color="red">
        <%
        if (mensaje != null)
        out.print(mensaje);
        %></font>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">

          <table width="100%" border="1" align="center" id="tabla">
          <tr>
            <td width="30%" bgcolor="#ADD8E4"> <div align="right"><strong>nombre</strong></div></td>
            <td width="70%"> <input name="nombre" type="text" value="" size="60" maxlength="50"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>descripci&oacute;n</strong></div></td>
            <td> <input name="descripcion" type="text" value="" size="60" maxlength="50"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>subsistema</strong></div></td>
            <td>
              <select name="subsistema">
              <%
                Iterator i = listaSubsistema.iterator();
                while (i.hasNext()) {
                  DispositivoVO subsistema = (DispositivoVO) i.next();
                  out.print("<option value=\"" + subsistema.getIdSubsistema()+ "\">" + subsistema.getNombreSubsistema() + "</option>");
                }
                %>
              </select></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>empresa mantenedora</strong></div></td>
            <td>
              <select name="empresaMantenedora">
               <%
                Iterator ii = listaEmpresa.iterator();
                while (ii.hasNext()) {
                  DispositivoVO empresam = (DispositivoVO) ii.next();
                  out.print("<option value=\"" + empresam.getIdEmpresa()+ "\">" + empresam.getNombreEmpresa() + "</option>");
                }
                %>
              </select> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>tipo dispositivo</strong></div></td>
            <td>
              <select name="tipoDispositivo">
               <%
                Iterator iii = listaTipoDispositivo.iterator();
                while (iii.hasNext()) {
                  DispositivoVO tipoDispositivo = (DispositivoVO) iii.next();
                  out.print("<option value=\"" + tipoDispositivo.getIdTipoDispositivo()+ "\">" + tipoDispositivo.getTipoDispositivo() + "</option>");
                }
                %>
              </select></td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <table width="60%" border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td><font size="2">
                <input type="hidden" name="accion" value="1">
                <input type="submit" name="hacia" value="Grabar">
                </font>
              </td>
              <td><div align="right"><font size="2">
                <input type="reset" name="BotonCancelar" value="Cancelar">
                </font></div>
              </td>
              </tr>
            </table>
            <script language="JavaScript" type="text/javascript">
            var frmvalidator  = new Validator("formMantenedorDispositivo");
            frmvalidator.addValidation("nombre","req","Debe ingresar el nombre del nuevo Dispositivo");
			 frmvalidator.addValidation("descripcion","req","Debe ingresar la descripción del nuevo Dispositivo");
          </script>
        </td>
      </tr>
    </table>
<br>
  <hr><div align="right"><a href="../ayuda/mantDispositivos.html" target="_blank">Ayuda</a></div>
  </form>
</body>
</html>
