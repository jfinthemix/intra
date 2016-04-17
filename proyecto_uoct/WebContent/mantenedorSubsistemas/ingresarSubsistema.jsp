<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.List,proyecto_uoct.mantenedorSubsistemas.VO.*,java.util.Iterator"  errorPage=""%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
String mensaje               = (String) request.getAttribute("mensaje");
List lista_sistema           = (List) request.getAttribute("lista_sistema");

Integer var_sistema          = (Integer) request.getAttribute("sistema");
%>
<html>
<head>
<title>Mantenedor de Subsistemas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
function valida_envia(){
  document.formMantenedorSubsistema.submit();
}

</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
  <form name="formMantenedorSubsistema" method="post" action="../mantenedorSubsistemas/subsistemaAction.do">
    <table width="100%" border="0" align="left">
      <tr>
        <td colspan="2"><h3 align="left">Mantenedor de Subsistemas</h3></td>
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
          <table width="80%" border="1" align="left" id="tabla">
           <tr>
            <td width="30%" bgcolor="#ADD8E4"> <div align="right"><strong>sistema asociado</strong></div></td>
            <td width="70%">
              <%
              Integer valorCero=new Integer(0);
              boolean bandera = true;
              Integer valorUno=new Integer(1);;//el id del primer sistema es igual a 1
              %>
                <select name="id_sistema" size="1" id="id_sistema" >
                  <%
                  Iterator i = lista_sistema.iterator();
                  String nombre_sistema = "";
                  while (i.hasNext()) {
                    SubsistemaVO subsistema = (SubsistemaVO) i.next();
                    if(subsistema.getIdSistema().equals(valorUno)){
                      out.print("<option value=\"" + subsistema.getIdSistema()+ "\" selected>" + subsistema.getNombreSistema() + "</option>");
                    }
                    else{
                      out.print("<option value=\"" + subsistema.getIdSistema()+ "\">" + subsistema.getNombreSistema() + "</option>");
                    }

                    nombre_sistema= subsistema.getNombreSistema();
                  }
                  %>
              </select>
            </td>
          </tr>
           <tr>
            <td width="30%" bgcolor="#ADD8E4"> <div align="right"><strong>nombre subsistema</strong></div></td>
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
                <input type="hidden" name="id_subsistema" value="0">
                <input type="hidden" name="hacer" value="0">
              <td><div align="right"><input type="reset" name="BotonCancelar" value="Cancelar"></div></td>
              </tr>
            </table>

            <script language="JavaScript" type="text/javascript">
            var frmvalidator  = new Validator("formMantenedorSubsistema");
            frmvalidator.addValidation("nombre","req","Debe ingresar el nombre del nuevo Subsistema");
          </script>
        </td>
      </tr>
    </table>
  </form>
        <br>
  <hr><div align="right"><a href="../ayuda/mantSubsistemas.html" target="_blank">Ayuda</a></div>
</body>
</html>
