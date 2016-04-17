<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.List,java.util.Date, java.util.Iterator,proyecto_uoct.EIV.VO.EIVVO,proyecto_uoct.EIV.VO.FlujoVO,proyecto_uoct.EIV.VO.EventoVO,java.lang.Boolean,java.text.SimpleDateFormat" errorPage=""%>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%

String mensaje=(String) request.getAttribute("mensaje");
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

EIVVO eiv = (EIVVO) request.getAttribute("detalleeiv");
List eventos= (List) request.getAttribute("eventos");

Integer regF=(Integer) request.getAttribute("regFlujos");
boolean regFlujos;
if(regF.intValue()==1){
regFlujos=true;
}else{
regFlujos=false;
}

Integer edB=(Integer)request.getAttribute("editarBitacora");
boolean editarBit;
if(edB.intValue()==1){
editarBit=true;
}else{
editarBit=false;
}


Integer em=(Integer)request.getAttribute("email");
boolean email;
if(em.intValue()==1){
email=true;
}else{
email=false;
}


Integer ed=(Integer)request.getAttribute("editarEIV");
boolean editar;
if(ed.intValue()==1){
editar=true;
}else{
editar=false;
}



Integer regBit=(Integer)request.getAttribute("regBit");
boolean regBit_b;
if(regBit.intValue()==1){
regBit_b=true;
}else{
regBit_b=false;
}

%>



<html>
<head>
<title><%= eiv.getNomEiv() %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>
<body>
   <div align="center"><font size="4" color="red"><%if(mensaje!=null){out.println(mensaje);} %></font>
<table width="750" border="0">
  <tr>
    <td colspan="2"><h1 align="center">EISTU <%=eiv.getIdEIV() %> : <%= eiv.getNomEiv()%></h1></td>
  </tr>
  <tr>
    <td width="578"><div align="center">
        <table width="431" border="1" align="left">
          <tr>
            <td width="148" bgcolor="#ADD8E4"><div align="right"><strong>EISTU
                No.:</strong></div></td>
            <td colspan="2"> <h4>EISTU - <%=eiv.getIdEIV() %> </h4></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>T&igrave;tulo:</strong></div></td>
            <td colspan="2"><%=eiv.getNomEiv() %></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Tipo de Estudio:</strong></div></td>
            <td colspan="2"><%=eiv.getTipoEstudio() %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha Presentación:</strong></div></td>
            <td colspan="2"><%= sdf.format(eiv.getFechaPresent()) %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Envío desde SEREMITT:</strong></div></td>
            <td colspan="2"><%= sdf.format(eiv.getFechaEnvioSeremitt()) %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha Ingreso:</strong></div></td>
            <td colspan="2"><%= sdf.format(eiv.getFechaIng()) %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Fecha de Vencimiento:</strong></div></td>
            <td colspan="2"><%= sdf.format(eiv.getFechaVenc()) %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Estado del EISTU
                en UOCT:</strong></div></td>
            <td colspan="2"><%= eiv.getEstado() %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Estado del EISTU
                en SEREMITT:</strong></div></td>
            <td colspan="2"><%if (eiv.getEstadoSeremitt().intValue()==1){
             out.print("Aprobado por SEREMITT");}
            if (eiv.getEstadoSeremitt().intValue()==2){
             out.print("Rechazado por SEREMITT");}
             else{
             out.print("--");
           }
             %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Comuna:</strong></div></td>
            <td colspan="2"><%= eiv.getComuna() %> </td>
          </tr>
          <tr>
            <td width="180" bgcolor="#ADD8E4"><div align="right"><strong>Direcci&oacute;n:</strong></div></td>
            <td colspan="2"><%=eiv.getDir() %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Redes Involucradas:</strong></div></td>
            <td width="267"> <%
      List redes = eiv.getRedes();
      if (redes != null) {
        Iterator ir = redes.iterator();
        while (ir.hasNext()) {
          Integer red = (Integer) ir.next();
          out.println(red + " - ");
        }
      }
    %> </td>
          </tr>
          <tr>
            <td width="148" bgcolor="#ADD8E4"><div align="right"><strong>Nº de
                estacionamientos:</strong></div></td>
            <td colspan="2"><%= eiv.getEstacionamientos() %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Consultor:</strong></div></td>
            <td colspan="2"><%= eiv.getNomCons() %></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Empresa Consultora:</strong></div></td>
            <td colspan="2"> <%if(eiv.getEmpCons()!=null){out.print(eiv.getEmpCons());}else{out.print("&nbsp;");} %> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Encargado del EISTU:</strong></div></td>
            <td colspan="2"> <%
         if(eiv.getNom2Encarg()!=null){
           out.print(eiv.getNomEncarg()+ " "+ eiv.getNom2Encarg()+" "+ eiv.getApeEncarg());
         }else{
           out.print(eiv.getNomEncarg()+ " "+ eiv.getApeEncarg());
         }
         %> </td>
          </tr>
          <tr>
            <td  bgcolor="#ADD8E4"><div align="right"><strong>Oficio del EISTU:</strong></div></td>
            <td><a href="../documentacion/documentoAction.do?hacia=detalleDoc&id_doc=<%=eiv.getIdOficio()%>"><%=eiv.getNomDocumento() %></a></td>
          </tr>
        </table>
      </div></td>
    <td width="162"><p align="center"><a href="eivAction.do?hacia=detEIVyle&id_eiv=<%=eiv.getIdEIV()%>" target="_blank">Detalle
        del EISTU+Lista de bit&aacute;coras</a></p>
      <p align="center"> <a href="eivAction.do?hacia=detEIVydetEventos&id_eiv=<%=eiv.getIdEIV()%>" target="_blank">Detalle
        del EISTU+bit&aacute;coras</a> </p>
      <p align="center"><a href="eivAction.do?hacia=detEIVydetEventyflujos&id_eiv=<%=eiv.getIdEIV()%>" target="_blank">Detalle
        del EISTU+bit&aacute;coras+Flujos</a></p>
      <div align="center">
        <%if (editar){ %>
      </div>
      <p align="center"><a href="eivAction.do?hacia=editarEIV&id_eiv=<%=eiv.getIdEIV()%>&nomEIV=<%=eiv.getNomEiv()%>" >Editar
        Datos del EISTU</a></p>
      <div align="center">
        <%} %>
        <%if(email && (eiv.getIdEstado().intValue()==1 || eiv.getIdEstado().intValue()==2)&& eiv.getFechaVenc().compareTo(new Date())<=0){  %>
      </div>
      <p align="center"><a href="eivAction.do?hacia=aEnvioEmail&id_eiv=<%=eiv.getIdEIV() %>&nomEIV=<%=eiv.getNomEiv()%>" >Enviar
        Email de Vencimiento</a></p>
      <div align="center">
        <%}%>
      </div></td>
  </tr>
  <tr>
    <td colspan="2"><h4 align="center">Flujos Vehiculares registrados para este
        EISTU</h4></td>
  </tr>
  <tr>
    <td colspan="2" align="left"> <%
  List flujos = eiv.getFlujos();
  request.setAttribute("flujos",flujos);%> <display:table name="flujos" id="flu" requestURI="eivAction.do" class="its">
      <display:column title="Fecha" sortable="true" sortProperty="fecha"> <%= sdf.format(((FlujoVO)flu).getFecha())%> </display:column> <display:column title="Tipo de Día" property="tipoDia" sortable="true">
      </display:column> <display:column title="Intersección" property="interseccion" sortable="true">
      </display:column> <display:column title="Intervalo horario" property="horasMed" >
      </display:column> <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
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
      <div align="right">
        <% if ((boolean)regFlujos){ %>
        <a href="flujoAction.do?hacia=cargarRegFlujo&id_eiv=<%=eiv.getIdEIV() %>&nomEIV=<%=eiv.getNomEiv()%>">Admin. flujos </a>
        <%} %>
      </div></div>
      </td>
  </tr>
  <tr>
    <td colspan="2"><h4 align="center">Bit&aacute;cora del EISTU</h4></td>
  </tr>
  <tr>
    <td align="left">
      <display:table name="eventos" requestURI="eivAction.do" class="its" id="ev">
      <display:column title="Fecha" sortable="true" sortProperty="fechaEv"> <%=sdf.format(((EventoVO)ev).getFechaEv()) %> </display:column>
      <display:column title="Título" class="texto">
      <a href="eivAction.do?hacia=detEvento&id_evento=<%=((EventoVO)ev).getIdEvento() %>&id_eiv=<%=eiv.getIdEIV() %>&nomEIV=<%=eiv.getNomEiv()%>"><%=((EventoVO)ev).getTitulo()%></a></display:column>

      <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>

      <display:setProperty name="basic.empty.showtable" value="true"/>
      <display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
      <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
      <display:setProperty name="paging.banner.placement" value="bottom"/> <display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
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
    </td>
    <td align="left"><p align="center">
        <%if (editarBit){ %>
        <a href="eivAction.do?hacia=editarBitacora&id_eiv=<%= eiv.getIdEIV() %>&nomEIV=<%=eiv.getNomEiv()%>&id_estado=<%=eiv.getIdEstado() %>">Admin.
        Bit&aacute;cora</a>
        <% }else{ %>
        &nbsp;
        <% }%>
      </p>
      <% if (regBit_b){ %><p align="center"><a href="eivAction.do?hacia=aAgregarBit&id_eiv=<%=eiv.getIdEIV() %>&nomEIV=<%=eiv.getNomEiv()%>" >Agregar Bitácora</a> </p>
        <%} %>
      </td>
  </tr>
</table>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>

</body>
</html>
