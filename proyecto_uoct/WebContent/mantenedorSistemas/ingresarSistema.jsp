<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.List,proyecto_uoct.mantenedorSistemas.VO.*,java.util.Iterator"  errorPage=""%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
String mensaje          = (String) request.getAttribute("mensaje");
%>
<html>
<head>
<title>Mantenedor de Sistemas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
function valida_envia(){
  document.formMantenedorSistema.submit();
}
</script>
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
        if (mensaje != null)
        out.print(mensaje);
        %></font>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">

          <table width="80%" border="1" align="left" id="tabla">
           <tr>
            <td width="30%" bgcolor="#ADD8E4"> <div align="right"><strong>nombre sistema</strong></div></td>
            <td width="70%"> <input name="nombre" type="text" value="" size="60" maxlength="20"></td>
          </tr>
         </table>

        </td>
      </tr>
      <tr>
        <td colspan="2">

          <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td><div align="left"><input type="submit" name="hacia" value="Grabar"></div></td>
                <input type="hidden" name="id_sistema" value="0">
              <td><div align="right"><input type="reset" name="BotonCancelar" value="Cancelar"></div></td>
              </tr>
            </table>

            <script language="JavaScript" type="text/javascript">
            var frmvalidator  = new Validator("formMantenedorSistema");
            frmvalidator.addValidation("nombre","req","Debe ingresar el nombre del nuevo Sistema");
          </script>
        </td>
      </tr>
    </table>
  </form>
    <br>
  <hr><div align="right"><a href="../ayuda/mantSistemas.html" target="_blank">Ayuda</a></div>
</body>
</html>
