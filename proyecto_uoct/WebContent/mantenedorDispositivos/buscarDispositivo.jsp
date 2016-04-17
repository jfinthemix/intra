<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*,proyecto_uoct.mantenedorDispositivos.VO.*,proyecto_uoct.mantenedorSubsistemas.VO.*,java.util.Iterator"  errorPage=""%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.util.Calendar" %>
<%@taglib uri="/WEB-INF/lib/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/lib/struts-template.tld" prefix="template"%>
<%@taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/lib/struts-html.tld" prefix="html"%>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
String nombreSubsistema    = (String) request.getAttribute("nombreSubsistema");
if(nombreSubsistema==null){
  nombreSubsistema="CAMARAS";
}

//System.out.println("nombreSubsistema: "+nombreSubsistema);
String mensaje                               = (String) request.getAttribute("mensaje");
Integer idPerfil                             = (Integer) request.getAttribute("idPerfil");
LinkedList listaSubsistema                   = new LinkedList();
listaSubsistema                              = (LinkedList) request.getAttribute("listaSubsistema");
//Integer idAdmin                               = new Integer(1);
//Integer idGFallas                             = new Integer(43);

if(mensaje!="ok" && mensaje !=null){ %>
  <META HTTP-EQUIV="Refresh" CONTENT="3; URL=../mantenedorDispositivos/dispositivoAction.do?hacia=Buscar&mensaje='ok'&subsistema=<%=nombreSubsistema%>"><%
}



//Integer var_subsistema                       = (Integer) request.getAttribute("lista_subsistema");
//Integer var_empresa                          = (Integer) request.getAttribute("lista_empresa");

//LinkedList listaSubsistema                   = new LinkedList();
//listaSubsistema                              = (LinkedList) request.getAttribute("listaSubsistema");
//LinkedList listaEmpresa                      = new LinkedList();
//listaEmpresa                                 = (LinkedList) request.getAttribute("listaEmpresa");
LinkedList listaDispositivo                    = new LinkedList();
listaDispositivo                               = (LinkedList) request.getAttribute("listaDispositivo");

Integer cero                                 = new Integer(0);

%>
<html>
<head>
<title>Mantenedor de Dispositivos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/javascript">

function valida_envia(){
  document.formMantenedorDispositivo.submit();
}

function confirmaEliminacion(){
  var resp=confirm("Al eliminar este dispositivo se eliminará todo lo asociado a él.\n ¿Desea continuar con la eliminación?");
  return resp;
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
        <td colspan="2">Subsistema

          <select name="subsistema" size="1" id="subsistema">
            <%
            //out.println("<option value=\"" + nombreSubsistema + "\" selected>" + nombreSubsistema + "</option>");
            Iterator i = listaSubsistema.iterator();
            while (i.hasNext()) {
              SubsistemaVO subs = (SubsistemaVO) i.next();
              if(nombreSubsistema.equals(subs.getNombreSubsistema())){
                out.println("<option value=\"" + nombreSubsistema + "\" selected>" + nombreSubsistema + "</option>");
              }
              out.println("<option value=\"" + subs.getNombreSubsistema() + "\" >" + subs.getNombreSubsistema() + "</option>");
            }
            %>
          </select>
          <input type="submit" name="hacia" value="Buscar">
        </td>
      </tr>
      <tr>
        <td colspan="2">

         <display:table  name="listaDispositivo" export="true" class="its" id="ld" pagesize="30" requestURI="dispositivoAction.do">

          <display:column media="html excel pdf" class="centrado" title="nombre "  sortable="true" sortProperty="nombre"><%=((DispositivoVO)ld).getNombre() %></display:column>
          <display:column media="html excel pdf" class="centrado" title="descripcion"  sortable="true" sortProperty="descripcion"><%=((DispositivoVO)ld).getDescripcion() %></display:column>
          <display:column media="html excel pdf" class="centrado" title="subsistema asociado"  sortable="true" sortProperty="nombreSubsistema"><%=((DispositivoVO)ld).getNombreSubsistema() %></display:column>
          <display:column media="html excel pdf" class="centrado" title="empresa mantenedora"  sortable="true" sortProperty="nombreEmpresa"><%=((DispositivoVO)ld).getNombreEmpresa() %></display:column>
          <display:column media="html excel pdf" class="centrado" title="tipo de dispositivo"  sortable="true" sortProperty="tipoDispositivo"><%=((DispositivoVO)ld).getTipoDispositivo() %></display:column>


          <display:column media="html"           class="centrado" title="mod"          sortable="false" sortProperty="modificar">
            <a href="dispositivoAction.do?hacia=modificar&&id_dispositivo=<%out.print(((DispositivoVO)ld).getIdDispositivo());%>&&nombre=<%out.print(((DispositivoVO)ld).getNombre());%>&&descripcion=<%out.print(((DispositivoVO)ld).getDescripcion());%>&&id_subsistema=<%out.print(((DispositivoVO)ld).getIdSubsistema());%>&&nombre_subsistema=<%out.print(((DispositivoVO)ld).getNombreSubsistema());%>&&id_empresa=<%out.print(((DispositivoVO)ld).getIdEmpresa());%>&&nombre_empresa=<%out.print(((DispositivoVO)ld).getNombreEmpresa());%>&&id_tipo_dispositivo=<%out.print(((DispositivoVO)ld).getIdTipoDispositivo());%>&&tipo_dispositivo=<%out.print(((DispositivoVO)ld).getTipoDispositivo());%>" title="Modificar dispositivo"><img src="imagenes/icono_detalle.png" width="17" height="17" alt="" border="0"></a>
          </display:column>

          <% //if(idAdmin.equals(idPerfil) || idGFallas.equals(idPerfil)){
            if(idPerfil.equals(cero)){
              idPerfil=idPerfil;
            }
          else{%>
             <display:column media="html"           class="centrado" title="elim "           sortable="false" sortProperty="eliminar">
             <a href="dispositivoAction.do?hacia=eliminar&&id_dispositivo=<%out.print(((DispositivoVO)ld).getIdDispositivo());%>" title="Eliminar dispositivo" onClick='return confirmaEliminacion()'><img src="imagenes/icono_delete.png" alt="" width="17" height="17" border="0"></a>
             </display:column>
          <% }
          %>


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
        <display:setProperty name="export.excel.filename" value="ListaDispositivo.xls"/>
        <display:setProperty name="export.pdf.filename" value="ListaDispositivo.pdf"/>
        <display:setProperty name="export.xml.filename" value="ListaDispositivo.xml"/>
        <display:setProperty name="export.csv.filename" value="ListaDispositivo.csv"/>
        <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' height='10' border='0'>"/>
        <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' height='10' border='0'>"/>
        <display:setProperty name="export.amount" value="list"/>
        </display:table>

        </td>
      </tr>
      <tr>
        <td colspan="2">
            <script language="JavaScript" type="text/javascript">
            var frmvalidator  = new Validator("formMantenedorDispositivo");
          </script>
        </td>
      </tr>

    </table>

<br>
  <hr><div align="right"><a href="../ayuda/mantDispositivos.html" target="_blank">Ayuda</a></div>
  </form>
</body>
</html>
