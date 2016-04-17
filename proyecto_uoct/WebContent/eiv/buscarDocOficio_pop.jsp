<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.List,java.util.Iterator,proyecto_uoct.usuario.VO.UsuarioVO,proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.documentacion.VO.DocumentodeListaVO" errorPage=""%>
<%@ page import="java.text.SimpleDateFormat,proyecto_uoct.documentacion.VO.TipoDocVO" %>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

  List listausu = (List) request.getAttribute("listausu");
  List tiposentrantes = (List) request.getAttribute("tiposentrantes");
  List tipossalientes = (List) request.getAttribute("tipossalientes");
  List listadocs = (List) request.getAttribute("listadocs");
  Iterator iv = tiposentrantes.iterator();
  Iterator iiv = tipossalientes.iterator();

  String mensaje=(String) request.getAttribute("mensaje");

    if (listadocs != null && listadocs.size()==0) {
      mensaje="No hay documentos coincidentes con los parámetros ingresados";
    }

%>
<html>
<head>
<title>Buscar documento</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- European format dd-mm-yyyy -->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->
<!-- American format mm/dd/yyyy -->
<script language="JavaScript" src="calendar2.js" type="text/javascript"></script><!-- Date only with year scrolling -->
<link href="../util/styla.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
function pasaDoc(idDoc,codDoc,tipoDoc){
	window.opener.pasaDoc(idDoc,codDoc,tipoDoc);
}


</script>

</head>
<body>
<table width="630" border="0">
  <tr>
    <td><h3 align="left">Buscar Oficio</h3>
      <div align="left">
        <% if (mensaje!=null){out.println(mensaje);} %>
      </div></td>
  </tr>
  <tr>
    <form action="eivAction.do" name="buscarDocs">
      <input type="hidden" name="hacia" value="buscarDocOficio"/>
      <td> <div align="left">
          <table width="500" border="1" align="center">
            <tr bgcolor="#F7FBC4">
              <td width="29%" bgcolor="FAA564">
<p align="right">
                  <label>
                  <input name="tipoBus" type="radio" value="1" checked >
                  <strong>Por c&oacute;digo</strong> </label>
                </p></td>
              <td colspan="3"> <select name="idTipoDoc">
                  <%
                    while (iv.hasNext()) {// lista los tipos de documentos entrantes
                      TipoDocVO tipo = (TipoDocVO) iv.next();




                      if(tipo.getTipo().equalsIgnoreCase("oficio")){
                      out.println("<option value=" + tipo.getIdTipo() + ">" + tipo.getTipo() + "</option>");
                    }

                                         if(tipo.getTipo().equalsIgnoreCase("ordinario")){
                      out.println("<option value=" + tipo.getIdTipo() + ">" + tipo.getTipo() + "</option>");
                    }
                  }
                  %>
                </select>
                -
                <input type="text"  maxlength="50" name="codigoDoc" size="20"/></td>
            </tr>
            <tr>
              <td width="29%" bgcolor="#ADD8E4"><div align="right"><strong>Materia</strong></div></td>
              <td colspan="2"> <input type="text" name="materia"> </td>
            </tr>
            <tr>
              <td rowspan="2" bgcolor="#ADD8E4"><div align="right"><strong>Fecha</strong></div></td>
              <td width="14%">Desde:</td>
              <td width="57%"> <input type="Text" name="fecha_ini" readonly> <a href="?javascript:cal1.popup();">
                <img src="img/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date">
                </a> </td>
            </tr>
            <tr>
              <td>Hasta:</td>
              <td> <input type="Text" name="fecha_fin" readonly> <a href="javascript:cal2.popup();">
                <img src="img/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date">
                </a> </td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Palabra Clave(**):</strong></div></td>
              <td colspan="2"><input type="text" name="palClave"></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Encargado</strong></div></td>
              <td colspan="2"> <select name="id_usuario">
                  <option selected value="0">nombre del usuario</option>
                  <%
        Iterator ius = listausu.iterator();
        while (ius.hasNext()) {
          UsuarioVO usu = (UsuarioVO) ius.next();
          if(usu.getIsActivo()){
            if(usu.getNombreUsu2()!=null){
              out.println("<option value=" + usu.getIdUsu() + ">" + usu.getNombreUsu() + " " + usu.getNombreUsu2() + " " + usu.getApellUsu() + "</option>");
            }else{
              out.println("<option value=" + usu.getIdUsu() + ">" + usu.getNombreUsu() + " " +usu.getApellUsu() + "</option>");
            }
        }}
      %>
                </select> </td>
            </tr>
            <tr>
              <td colspan="3"> <div align="center">
                  <input type="submit" name="Submit63" value="Buscar">
                  &nbsp;&nbsp;&nbsp;
                  <input type="reset" name="Submit" value="Restablecer">
                </div></td>
            </tr>
          </table>
        </div></td>
    </form>
    <script language="JavaScript" type="text/javascript">
				var cal1 = new calendar1(document.forms['buscarDocs'].elements['fecha_ini']);
				cal1.year_scroll = true;
				cal1.time_comp = false;
				var cal2 = new calendar1(document.forms['buscarDocs'].elements['fecha_fin']);
				cal2.year_scroll = true;
                                cal2.time_comp = false;
				</script>
  </tr>
  <tr>
    <td><div align="left">(**) palabra que se buscar&aacute; en el nombre del
        Cliente, apellido del Cliente, Mat. y Resumen del doc.</div></td>
  </tr>
  <tr>
    <td height="91">
      <h4 align="left"><font size="3"><strong>Lista de Documentos Encontrados</strong></font></h4>
      <div align="left">
<%if(listadocs!=null && listadocs.size()>0) {%>
        <display:table name="listadocs" class="its" id="ld" pagesize="15" requestURI="eivAction.do" >
            <%if( ( (DocumentodeListaVO)ld).getTipoDoc().toUpperCase().equals("OFICIO") || ((DocumentodeListaVO)ld).getTipoDoc().toUpperCase().equals("ORDINARIO") ){%>

            <display:column title="Seleccionar" maxLength="50" sortable="true" sortProperty="codDoc">
              <a href="#" onClick="return pasaDoc('<%=((DocumentodeListaVO)ld).getIdDoc()%>','<%=((DocumentodeListaVO)ld).getCodDoc() %>','<%=((DocumentodeListaVO)ld).getTipoDoc()%>')"><%=((DocumentodeListaVO)ld).getTipoDoc() %>-<%=((DocumentodeListaVO)ld).getCodDoc() %></a>
            </display:column>

            <display:column title="Materia" sortable="true" property="materiaDoc" maxWords="5">
            </display:column>

            <display:column title="Fecha ingreso/egreso" sortable="true" sortProperty="fechaio">
              <%=sdf.format(((DocumentodeListaVO)ld).getFechaio()) %>
            </display:column>

            <display:column title="Estado" sortable="true" sortProperty="idEstado" >
              <%if (((DocumentodeListaVO)ld).getIdEstado()){
                out.println("Respondido");
              }else{
                out.println("Pendiente");}
                %>
              </display:column>
              <%} %>


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

      </div>
    <%} %>
    </td>
  </tr>
</table>
<hr>
  <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>

