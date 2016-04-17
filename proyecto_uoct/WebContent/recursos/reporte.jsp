<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%@ page import="proyecto_uoct.reservas.VO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>


<%
List recursos = (List) request.getAttribute("recursos");
List reservas = (List) request.getAttribute("RESERVAS");

SimpleDateFormat hora = new SimpleDateFormat("HH:mm");
SimpleDateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
%>

<html>
<head>
  <title>Agenda de Recursos</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <script type="text/javascript" src="../util/calendario/calendar1.js"></script>
  <script type="text/javascript">

  function goBuscar() {
    formulario.accion.value = "GENERAR_REPORTE";
    formulario.submit();
  }


  var reservar = null;
  function popUp(href, target, features) {
    reservar = window.open(href, target, features);
    reservar.window.focus();
  }


  </script>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
<link href="../util/displaytag.properties" rel="stylesheet" type="text/css">
</head>

<body>

<table width="750" border="0">
  <tr>
    <td valign="top"> <form name="formulario" action="recursosAction.do" method="POST">
        <h3>Reporte de reservas</h3>
        <input type="hidden" name="idReserva"/>
        <input type="hidden" name="accion"/>
        <!--Campos usados para reservar-->
        <input type="hidden" name="fecha"/>
        <input type="hidden" name="horaInicio"/>
        <input type="hidden" name="minutosInicio"/>
        <input type="hidden" name="horaFin"/>
        <input type="hidden" name="minutosFin"/>
        <input type="hidden" name="motivo"/>
        <table width="469" border="0" align="left">
          <tr bgcolor="#ADD8E4">
            <td colspan="3" valign="top"><strong>Buscar reservas hechas entre</strong></td>
          </tr>
          <tr>
            <td width="182"> <input name="fechaDesde" type="text" size="10" readonly="readonly" >
              &nbsp; <a href="javascript:cal1.popup();"><img src="../util/calendario/img/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date"></a>
            </td>
            <td width="183"> <input name="fechaHasta" type="text" size="10" readonly="readonly" >
              &nbsp; <a href="javascript:cal2.popup();"><img src="../util/calendario/img/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date"></a>
            </td>
            <td width="90">&nbsp; </td>
          </tr>
          <tr>

            <td><input type="button" name="buscar" value="Buscar" onClick="javascript:goBuscar()" /></td>
          </tr>
        </table>
		      </form>
</td>
  </tr>
  <tr>
    <%
    if(reservas != null){
    Iterator iRec= reservas.iterator();
    int cont=0;
    String nomRec= null;
   while (iRec.hasNext()){
   List resXrec=(List)iRec.next();
   cont++;
   Iterator iRes= resXrec.iterator();
   if(iRes.hasNext()){   //obtenemos el nombre del recurso
   ReservaVO res_tmp=(ReservaVO)iRes.next();
   Iterator ir=recursos.iterator();

   while(ir.hasNext()){
     RecursoVO rec_tmp=(RecursoVO) ir.next();
     if(res_tmp.getIdRecurso().intValue()== rec_tmp.getIdRecurso().intValue()){
       nomRec=rec_tmp.getNombre();
     }
   }
 }
 String nom_lista="reservas"+Integer.toString(cont);
 request.setAttribute(nom_lista,iRes);

 %>
 <td valign="top" align="left">
   <h4 align="left">Reservas de <%=nomRec %></h4>

   <display:table name="<%=nom_lista %>" id="res" requestURI="recursosAction.do" class="its" export="true">
     <display:column title="Fecha"> <%= fecha.format(((ReservaVO)res).getFechaReserva())%> </display:column>

     <display:column title="Hora" class="hora"> <%= hora.format(((ReservaVO)res).getHoraDeInicio()) + " - " + hora.format(((ReservaVO)res).getHoraDeFin())%> </display:column>

     <display:column title="Solicitante"><%= ((ReservaVO)res).getNombreUsuario()%> </display:column>

     <display:column title="Motivo/Destino">
       <%= ((ReservaVO)res).getMotivo()%>
     </display:column>



     <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
     <display:setProperty name="paging.banner.placement" value="bottom"/>
     <display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
     <display:setProperty name="paging.banner.one_item_found" value="<span class='pagebanner'>Se encontr&oacute; un {0}.</span>"/>
     <display:setProperty name="paging.banner.all_items_found" value="<span class='pagebanner'>{0} {1} encontrados.</span>"/>
     <display:setProperty name="paging.banner.some_items_found" value="<span class='pagebanner'>{0} {1} encontrados.Mostrando {2} a {3}.</span>"/>
     <display:setProperty name="paging.banner.full" value="<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a hreAf=\"{2}\">Ant</a>]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>

         <display:setProperty name="paging.banner.last" value="	<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Prev</a>]{0}[Sgte/Ultimo]"></display:setProperty>
           <display:setProperty name="export.csv" value="false"/> <display:setProperty name="export.xml" value="false"/>
           <display:setProperty name="export.rtf" value="false"/> <display:setProperty name="export.excel.filename" value="ReporteDeReservas.xls"/>
           <display:setProperty name="export.pdf.filename" value="ReporteDeReservas.pfd"/>
           <display:setProperty name="export.xml.filename" value="ReporteDeReservas.xml"/>
           <display:setProperty name="export.csv.filename" value="ReporteDeReservas.csv"/>
           <display:setProperty name="export.pdf.label" value="<img src='../util/img/pdf.gif' width='10' border='0' height='10'>"/>
             <display:setProperty name="export.excel.label" value="<img src='../util/img/excel.gif' width='10' border='0' height='10'>" />
               <display:setProperty name="export.amount" value="list"/>

             </display:table>

<br />
           </td>
           <%}
    }%>

  </tr>

</table>

  <script language="JavaScript" type="text/javascript">
    var cal1 = new calendar1(document.forms['formulario'].elements['fechaDesde']);
    cal1.year_scroll = true;
    cal1.time_comp = false;
    var cal2 = new calendar1(document.forms['formulario'].elements['fechaHasta']);
    cal1.year_scroll = true;
    cal1.time_comp = false;
  </script>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/recursos.html" target="_blank">Ayuda</a>
  </div>

</body>
</html>
