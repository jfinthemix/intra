<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*,proyecto_uoct.mantenedorDispositivos.VO.*,java.util.Iterator"  errorPage=""%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
String mensaje                  = (String) request.getAttribute("mensaje");

LinkedList listaSubsistema      = new LinkedList();
listaSubsistema                 = (LinkedList) request.getAttribute("listaSubsistema");
LinkedList listaEmpresa         = new LinkedList();
listaEmpresa                    = (LinkedList) request.getAttribute("listaEmpresa");
LinkedList listaTipoDispositivo = new LinkedList();
listaTipoDispositivo            = (LinkedList) request.getAttribute("listaTipoDispositivo");
Integer id_dispositivo          = (Integer) request.getAttribute("id_dispositivo");
String nombre                   = (String)  request.getAttribute("nombre");
String descripcion              = (String)  request.getAttribute("descripcion");
Integer id_subsistema           = (Integer) request.getAttribute("id_subsistema");
String nombre_subsistema        = (String)  request.getAttribute("nombre_subsistema");
Integer id_empresa              = (Integer) request.getAttribute("id_empresa");
String empresa                  = (String)  request.getAttribute("empresa");
Integer id_tipo_dispositivo     = (Integer) request.getAttribute("id_tipo_dispositivo");
String tipo_dispositivo         = (String)  request.getAttribute("tipo_dispositivo");


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
        if (mensaje != null){
          out.print("<br>"+mensaje+"<br>");
        }
        %></font>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">

          <table width="80%" border="1" align="left" id="tabla">
          <tr>
            <td width="30%" bgcolor="#ADD8E4"> <div align="right"><strong>nombre</strong></div></td>
            <td width="70%"> <input name="nombre" type="text" value="<% out.print(nombre); %>" size="50" maxlength="50"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>descripci&oacute;n</strong></div></td>
            <td> <input name="descripcion" type="text" value="<% out.print(descripcion); %>" size="50" maxlength="50"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>subsistema</strong></div></td>
            <td>
              <select name="subsistema">
               <%
                Iterator i = listaSubsistema.iterator();
                while (i.hasNext()) {
                  DispositivoVO subsistema = (DispositivoVO) i.next();
                  if(subsistema.getIdSubsistema().equals(id_subsistema)){
                    out.print("<option value=\"" + subsistema.getIdSubsistema()+ "\" selected>" + subsistema.getNombreSubsistema() + "</option>");
                   }
                  else{
                    out.print("<option value=\"" + subsistema.getIdSubsistema()+ "\">" + subsistema.getNombreSubsistema() + "</option>");
                  }
                }
                %>
              </select>
            </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>empresa mantenedora</strong></div></td>
            <td>
              <select name="empresaMantenedora">
                <%
                Iterator ii = listaEmpresa.iterator();
                while (ii.hasNext()) {
                  DispositivoVO empresam = (DispositivoVO) ii.next();
                  if(empresam.getIdEmpresa().equals(id_empresa)){
                    out.print("<option value=\"" + empresam.getIdEmpresa()+ "\" selected>" + empresam.getNombreEmpresa() + "</option>");
                   }
                  else{
                    out.print("<option value=\"" + empresam.getIdEmpresa()+ "\">" + empresam.getNombreEmpresa() + "</option>");
                  }
                }
                %>
            </select>
            </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>tipo dispositivo</strong></div></td>
            <td>
              <select name="tipoDispositivo">
                <%
                Iterator iii = listaTipoDispositivo.iterator();
                while (iii.hasNext()) {
                  DispositivoVO tipoDispositivo = (DispositivoVO) iii.next();
                  if(tipoDispositivo.getIdTipoDispositivo().equals(id_tipo_dispositivo)){
                    out.print("<option value=\"" + tipoDispositivo.getIdTipoDispositivo()+ "\" selected>" + tipoDispositivo.getTipoDispositivo() + "</option>");
                   }
                  else{
                    out.print("<option value=\"" + tipoDispositivo.getIdTipoDispositivo()+ "\">" + tipoDispositivo.getTipoDispositivo() + "</option>");
                  }
                }
                %>
            </select>
          </tr>
         </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">

          <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td><div align="left"><input type="submit" name="hacia" value="Grabar"></div></td>
                <input type="hidden" name="id_dispositivo" value="<% out.print(id_dispositivo);%>">
                <input type="hidden" name="accion" value="-1">
              <td><div align="right"><input type="reset" name="BotonCancelar" value="Cancelar"></div></td>
              </tr>
            </table>
            <script language="JavaScript" type="text/javascript">
            var frmvalidator  = new Validator("formMantenedorDispositivo");
            frmvalidator.addValidation("nombre","req","Debe ingresar el nombre del Dispositivo");
          </script>
        </td>
      </tr>
    </table>
<br>
  <hr><div align="right"><a href="../ayuda/mantDispositivos.html" target="_blank">Ayuda</a></div>
  </form>
</body>
</html>
