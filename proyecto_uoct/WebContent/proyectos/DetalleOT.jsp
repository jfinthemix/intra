<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "java.util.List,java.util.Iterator,proyecto_uoct.proyecto.VO.DetalleProyectoVO" %>
<%@ page import= "proyecto_uoct.usuario.VO.UsuarioVO" %>
<%@ page import= "proyecto_uoct.proyecto.VO.DetalleOTVO" %>
<%@ page import= "proyecto_uoct.proyecto.VO.NLOVO,proyecto_uoct.documentacion.VO.DocumentoInVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
Integer regnlo= (Integer)request.getAttribute("regnlo");
Integer editarFechasOT= (Integer)request.getAttribute("editarFechasOT");
Integer idSes= (Integer)request.getAttribute("idSes");
DetalleProyectoVO detproy=(DetalleProyectoVO) request.getAttribute("detproy");
DetalleOTVO detot= (DetalleOTVO) request.getAttribute("detalleOT");


String mensaje=(String)request.getAttribute("mensaje");

%>

<html>
<head>
<title>Detalle de OT</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>


        <table title="opcionesIniciativa">
          <tr>
<td>
<%if(regnlo.intValue()==1 && detproy.getIsActivo() && detproy.getIdEncargado().equals(idSes)){ %>
        <a href="proyectoAction.do?hacia=editarOT&idOT=<%=detot.getIdOT() %>&idProy=<%=detproy.getIdProy()%>"> Editar OT /</a>
<%} %>
</td>


<td>
<%if(regnlo.intValue()==1 && detproy.getIsActivo() && editarFechasOT.intValue()==1){ %>
        <a href="proyectoAction.do?hacia=editarFechasOT&idOT=<%=detot.getIdOT() %>&idProy=<%=detproy.getIdProy()%>"> Editar Fechas OT /</a>
<%} %>
</td>


<td>
<%if(regnlo.intValue()==1 && detproy.getIsActivo() && detproy.getIdEncargado().equals(idSes)){ %>

        <a href="proyectoAction.do?hacia=aRegNLOOT&idOT=<%=detot.getIdOT()%>"> Agregar LO / </a>
<%} %>
</td>
<td>
<%if(regnlo.intValue()==1 && detproy.getIsActivo() && detproy.getIdEncargado().equals(idSes)){ %>

        <a href="proyectoAction.do?hacia=adminNLOdelaOT&idOT=<%=detot.getIdOT()%>"> Admin. LO </a>
<%} %>
</td>


</tr>
        </table>

<table width="750" border="0">
  <tr>
    <td><h3>Orden de Trabajo </h3></td>
  </tr>



  <tr>

    <td>

         <%if(mensaje!=null){ out.println("<h3><font style=\"mensaje\" color=\"red\" >"+mensaje+"</font></h3>");} %>

      <table width="500" border="1">

        <tr>
          <td bgcolor="#ADD8E4"> <div align="right"><strong>Nombre OT</strong></div></td>
          <td><%= detot.getNomOT() %></td>
        </tr>
        <tr>
          <td bgcolor="#ADD8E4"> <div align="right"><strong>Documento de la OT</strong></div></td>
          <td><a href="../documentacion/documentoAction.do?hacia=detalleDoc&id_doc=<%= detot.getDocumento().getIdDoc()%>"><%= detot.getDocumento().getTipoDoc()+"-"+detot.getDocumento().getCodDoc() %></a></td>
        </tr>
        <tr>
          <td height="23" bgcolor="#ADD8E4"> <div align="right"><strong>Estado
              de la OT</strong></div></td>
          <td><%= detot.getEstadoOT() %></td>
        </tr>
        <tr>
          <td height="23" bgcolor="#ADD8E4"> <div align="right"><strong>Iniciativa
              a la cual pertenece</strong></div></td>
          <td><%= detot.getDetProy().getNomProy() %></td>
        </tr>
        <tr>
          <td height="23" bgcolor="#ADD8E4"> <div align="right"><strong>Ejecutor
              de la OT</strong></div></td>
          <td><%= detot.getCli().getNomCli()+" "+detot.getCli().getApeCli() %></td>
        </tr>
        <tr>
          <td height="23" bgcolor="#ADD8E4"> <div align="right"><strong>Plazo
              de Ejecución</strong></div></td>
          <td> <%if(detot.getPlazo()!=null && detot.getPlazo().intValue()!=0){
        out.print(detot.getPlazo());}else{out.print("no definido");} %> </td>
        </tr>
        <tr>
          <td height="23" bgcolor="#ADD8E4"> <div align="right"><strong>Estado
              de Pago</strong></div></td>
          <td> <%if(detot.getEP()!=null && !detot.getEP().equals("")){
        out.print(detot.getEP());}else{out.print("&nbsp;");} %> </td>
        </tr>
        <tr>
          <td height="23" bgcolor="#ADD8E4"> <div align="right"><strong>Encargados
              de la OT</strong></div></td>
          <td> <%

      List encargados= detot.getEncargados();
      if(encargados!=null)
      {
        Iterator ienc=encargados.iterator();
        while (ienc.hasNext()){
          UsuarioVO usu=(UsuarioVO) ienc.next();
          if(usu.getNombreUsu2()!=null){
            out.println("<div align=\"center\">"+usu.getNombreUsu()+" "+usu.getNombreUsu2()+" "+ usu.getApellUsu()+"</div>");
          }else{
            out.println("<div align=\"center\">"+usu.getNombreUsu()+" "+usu.getApellUsu()+"</div>");
          }
        }
      }
      %> </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="20"> <div align="left">
        <h4>Fechas</h4>
      </div></td>
  </tr>
  <tr>
    <td height="20"><table width="500" border="1">
        <tr>
          <td width="210" bgcolor="#ADD8E4"><div align="right"><strong>Fecha OT</strong></div></td>
          <td width="274"> <%

      if (detot.getFechaOT()!=null){
         out.print(sdf.format(detot.getFechaOT()));}
        else{out.print("&nbsp;");
        }

       %> </td>
        </tr>
        <tr>
          <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha de Vencimiento</strong></div></td>
          <td> <%
       if (detot.getVencimiento()!=null){
         out.print(sdf.format(detot.getVencimiento()));}
        else{out.print("&nbsp;");
        }


      %> </td>
        </tr>
        <tr>
          <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha de Suscripci&oacute;n</strong></div></td>
          <td> <% if (detot.getSuscrip()!=null){
          out.print(sdf.format(detot.getSuscrip()));}
          else{out.print("&nbsp;");
        } %> </td>
        </tr>
        <tr>
          <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha de finalizaci&oacute;n
              de tareas</strong></div></td>
          <td> <% if (detot.getFinTareas()!=null){
            out.print(sdf.format(detot.getFinTareas()));}
        else{out.print("&nbsp;");
      } %> </td>
        </tr>
        <tr>
          <td bgcolor="#ADD8E4"><div align="right"><strong>Aprobaci&oacute;n</strong></div></td>
          <td> <%if (detot.getAprobacion()!=null){
            out.print(sdf.format(detot.getAprobacion()));}
        else{out.print("&nbsp;");
      } %> </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="20"><h4>Notas al Libro de Obras(NLO)</h4></td>
  </tr>
  <tr>
    <td>
      <div align="left">
        <%
   List nlos=detot.getNLOs();
   if ( nlos!=null){
   request.setAttribute("nlos",nlos);
   %>
        <display:table name="nlos" id="n" pagesize="15" class="its" requestURI="proyectoAction.do">
        <display:column title="Fecha de la NLO"><%=sdf.format(((NLOVO)n).getFechaNLO())%> </display:column>

        <display:column title="Descripci&oacute;n NLO" property="str">
        </display:column>

        <display:column title="Documento asociado a la NLO">
        <a href="../documentacion/documentoAction.do?hacia=detalleDoc&id_doc=<%=((NLOVO)n).getDocumento().getIdDoc()%>"><%=((NLOVO)n).getDocumento().getTipoDoc()%>-<%=((NLOVO)n).getDocumento().getCodDoc()%></a> </display:column>


   <display:column title="Editar NLO"> <a href="proyectoAction.do?hacia=editarNLO&idOT=<%=detot.getIdOT() %>&idNLO=<%=((NLOVO)n).getId()%>">Editar
  NLO</a> </display:column>

		 <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
        <display:setProperty name="basic.empty.showtable" value="true"/> <display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
        <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
        <display:setProperty name="paging.banner.placement" value="bottom"/> <display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
        <display:setProperty name="paging.banner.one_item_found" value="<span class='pagebanner'>Se encontr&oacute; un {0}.</span>"/>
        <display:setProperty name="paging.banner.all_items_found" value="<span class='pagebanner'>{0} {1} encontrados.</span>"/>
        <display:setProperty name="paging.banner.some_items_found" value="<span class='pagebanner'>{0} {1} encontrados.Mostrando {2} a {3}.</span>"/>
        <display:setProperty name="paging.banner.full" value="<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Ant</a>]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.first" value="	<span class=\"pagelinks\">[Primero/Prev]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.last" value="	<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Prev</a>]{0}[Sgte/Ultimo]"></display:setProperty>
        <display:setProperty name="export.csv" value="false"/> <display:setProperty name="export.xml" value="false"/>
        <display:setProperty name="export.rtf" value="false"/> <display:setProperty name="export.excel.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.pdf.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.xml.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.csv.filename" value="registroDocumentacion"/>
        <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' height='10'>"/>
        <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' height='10'>"/>
        <display:setProperty name="export.amount" value="list"/> </display:table>
        <%}  %>
      </div></td>
  </tr>

</table>
  </table>

<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
