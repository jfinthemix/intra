<%@page import="proyecto_uoct.EIV.VO.EventoVO,java.text.SimpleDateFormat" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

EventoVO evento=(EventoVO) request.getAttribute("evento");
String id_eiv=(String) request.getAttribute("id_eiv");
String nomEIV=(String) request.getAttribute("nomEIV");
String mensaje =(String) request.getAttribute("mensaje");
%>
<html>
<head>
<title>
Detalle de Evento
</title>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff">
<div align="center">
  <table width="750" border="0" >
    <tr>
      <td width="739"> <h3 align="center"><strong>Detalle de Bit&aacute;cora</strong>
        </h3></td>
    </tr>

    <tr>
    <td><h4 align="center">EISTU - <%=id_eiv %>: <%=nomEIV %>
        <% if (mensaje != null){ %>
      </h4>
      <div align="center"><font color="red"><%=mensaje %></font>
        <%} %>
      </div></td>
  </tr>
    <tr>
      <td><div align="center">
          <table width="550" border="1" align="center">
            <tr>
              <td width="131" bgcolor="#ADD8E4"><p><strong>EISTU</strong><strong>:
                  </strong></p>
                </td>
              <td width="403"><div align="left"><strong>EISTU - <%=id_eiv %>: <%=nomEIV %></strong></div></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><strong>T&iacute;tulo bit&aacute;cora:</strong></td>
              <td><div align="left"><%=evento.getTitulo()%></div></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><strong>Fecha:</strong></td>
              <td><div align="left"><%=sdf.format(evento.getFechaEv()) %></div></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><strong>Descripci&oacute;n:</strong></td>
              <td><div align="left"><%=evento.getDescEv() %></div></td>
            </tr>
            <%if(evento.getIdDocRel().intValue()!=0){ %>
            <tr>
              <td bgcolor="#ADD8E4"><strong>Documento Relacionado</strong></td>
              <td><div align="left"><%=evento.getTipoDoc() %>-<%=evento.getCodDoc() %>&nbsp;&nbsp;<a href="../documentacion/documentoAction.do?hacia=detalleDoc&id_doc=<%=evento.getIdDocRel() %>">Ver
                  Doc.</a></div></td>
            </tr>
            <%}%>
          </table>
        </div></td>
    </tr>
  </table>
</div>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
