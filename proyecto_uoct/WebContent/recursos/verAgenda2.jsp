<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@taglib prefix="display" uri="/displaytag_12"%>
<%@ page import="proyecto_uoct.reservas.VO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="/tagOutlook" prefix="o" %>


<%
List recursos = (List) request.getAttribute("recursos");
List reservas = (List) request.getAttribute("RESERVAS");
Long idusuario = (Long) request.getAttribute("Id_Usu");
String fecha_s=(String) request.getAttribute("fechaBusqueda");

Date hoy=new Date();
Date fechaReserva;



SimpleDateFormat hora = new SimpleDateFormat("HH:mm");
SimpleDateFormat fecha = new SimpleDateFormat("dd-MM-yyyy");

if(fecha_s==null){
fecha_s= fecha.format(new Date());
}

%>

<html>
<head>
  <title>Agenda de Recursos</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
     <script type="text/javascript" src="../calendario/CalendarPopup.js"></script>
  <script type="text/javascript">

  function popUp(href, target, features) {
    reservar = window.open(href, target, features);
    reservar.window.focus();
  }


  function goBuscar() {
    formulario.accion.value = "VER_RESERVAS";
    formulario.submit();
  }


  function goEliminar(id,idrecurso) {
    formulario.idReserva.value = id;
    formulario.accion.value = "ELIMINAR";
     formulario.fecha.value="<%=fecha_s%>";
    elimin=window.confirm('¿Está seguro(a) de eliminar esta reserva?');
    (elimin)?formulario.submit():'return false';
  }


  function f_reservar(idrecurso,nombrerecurso){
  formulario.idRecurso.value= idrecurso;
  formulario.nombreRecurso.value= nombrerecurso;
  formulario.fecha.value="<%=fecha_s%>";
  reservar = window.open('reservarRecurso.jsp', '_blank', 'width=620,height=250');
  reservar.window.focus();
  return false;
  }


  function goReservar() {
    formulario.idRecurso.value=reservar.document.all["idRecurso"].value;
    formulario.fecha.value = reservar.document.all["fecha"].value;
    formulario.fechaBusqueda.value = reservar.document.all["fecha"].value;
    formulario.horaInicio.value = reservar.document.all["horaInicio"].value;
    formulario.minutosInicio.value = reservar.document.all["minutosInicio"].value;
    formulario.horaFin.value = reservar.document.all["horaFin"].value;
    formulario.minutosFin.value = reservar.document.all["minutosFin"].value;
    formulario.motivo.value = reservar.document.all["motivo"].value;
    reservar.window.close();
    formulario.accion.value = "RESERVAR";
    formulario.submit();
  }


  </script>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>

<form name="formulario" action="recursosAction.do" method="POST">
  <input name="accion" type="hidden"/>
  <input type="hidden" name="idRecurso" />
  <input type="hidden" name="idReserva"/>
  <input type="hidden" name="horaInicio"/>
  <input type="hidden" name="minutosInicio"/>
  <input type="hidden" name="horaFin"/>
  <input type="hidden" name="minutosFin"/>
  <input type="hidden" name="nombreRecurso"/>
  <input type="hidden" name="motivo"/>
   <input type="hidden" name="fecha"/>


<table>
  <tr>
    <td><h2><strong> Reservas de Vehículos </strong></h2></td>
  </tr>
  <tr>
    <td>&nbsp; </td>
  </tr>
<tr>
    <td><strong> Buscar en : <input name="fechaBusqueda" type="text" size="10" readonly="readonly" value="<%=fecha_s%>" >&nbsp; <a href="#"><img src="../calendario/images/calendar.gif" width="16" height="16" border="0" alt="Pinche aquí para escoger la fecha" id="cal1" onClick="calCenso(document.forms[0].fechaBusqueda, 'cal1')"></a></strong> &nbsp; <input type="button" name="buscar" value="Buscar" onclick="javascript:goBuscar()" /></td>
  </tr>
  <tr>
    <td><strong> </strong></td>
  </tr>

</table>

<br />




</form>

  <script language="JavaScript">
function setEvent(h1,m1,h2,m2)
{
  alert("Reserva desde "+h1+":"+m1+" hasta "+h2+":"+m2);
}
</script>

<%
if(recursos!=null && !recursos.isEmpty()){
%>

    <table>
      <tr>
        <%

      Iterator irecursos= recursos.iterator();
      while (irecursos.hasNext()){
        RecursoVO rec=(RecursoVO) irecursos.next();

        //Solo si el recurso no es una sala de reuniones (61 y 101 en la base de datos) y el recurso está activo

        if(rec.getIdRecurso().intValue()!= 61 && rec.getIdRecurso().intValue()!= 101 && rec.getIsActivo()== true){

        // Obtenemos la lista de reservas asociada al recurso

        List reservasDelRecurso = new LinkedList();

        Iterator ireservas = reservas.iterator();
        while(ireservas.hasNext()){
        List reservasXrecurso= (List) ireservas.next();
        Iterator iresXrec= reservasXrecurso.iterator();
        if(iresXrec.hasNext()){
          ReservaVO res_tmp=(ReservaVO) iresXrec.next();
          if(res_tmp.getIdRecurso().intValue()== rec.getIdRecurso().intValue()){
          reservasDelRecurso=reservasXrecurso;
          break;
          }
        }
        }

      %>

      <td>
        <table>
          <tr><th>Reservas de <%=rec.getNombre() %></th></tr>
          <tr><td><a href="#" onclick="f_reservar('<%=rec.getIdRecurso()%>','<%=rec.getNombre()%>');">Reservar</a></td></tr>

          <tr>
            <td>


              <o:outlook width="130" start="5" end="23">

                <%
                Iterator ires = reservasDelRecurso.iterator();
                while (ires.hasNext()){

                  ReservaVO reserva= (ReservaVO) ires.next();
                  String horaI = hora.format(reserva.getHoraDeInicio());
                  String horaF = hora.format(reserva.getHoraDeFin());
                  String motivo= reserva.getMotivo();
                  String usuario = reserva.getNombreUsuario();

                  %>
                  <o:event start="<%=horaI%>" end="<%=horaF%>">
                    <% // Solamente se puede eliminar una reserva posterior al momento actual, o hasta un día antes.


                           Calendar hoy_cal= Calendar.getInstance();
                           hoy_cal.setTime(new Date());
                           hoy_cal.add(Calendar.DATE,-1);
                           hoy= hoy_cal.getTime();
                    boolean es_despues=false;

                    if(reserva.getFechaReserva().after(hoy)){es_despues=true;}


                    Integer horaActual=new  Integer(hora.format(hoy).substring(0,2));
                    Integer minutoActual=new  Integer(hora.format(hoy).substring(3,5));

                    Integer horaIniRes=new  Integer(horaI.substring(0,2));
                    Integer minutoIniRes=new  Integer(horaI.substring(3,5));

                    if(fecha.format(hoy).equals(fecha.format(reserva.getFechaReserva()))){
                      if(horaActual.intValue()<horaIniRes.intValue()){
                        es_despues=true;
                      }
                      if(horaActual.intValue()==horaIniRes.intValue() && minutoActual.intValue()<=minutoIniRes.intValue()){
                        es_despues=true;
                      }
                    }

                    if(reserva.getIdUsuario().intValue()== idusuario.intValue() && es_despues){ %>
                   <a href="#" onclick="goEliminar(<%=reserva.getIdReserva() %>,<%=rec.getIdRecurso()%>)" title="<%=usuario %>---<%=motivo %>">Eliminar  </a> <br /><%} %>

                   <a href="#" title="<%=horaI %> - <%=horaF %> - <%=usuario %> - <%=motivo %>">
                     <%=horaI %> - <%=horaF %> <br /> <%=usuario %> - <%=motivo %></a> </o:event>

                <%}%>
                </o:outlook>


              </td>
            </tr>

          </table>
        </td>

<% }} %>
<%} else{ out.println("No hay recursos registrados en la Intranet.Comunicarse con el Administrador");}%>



  </tr>
</table>



<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/recursos.html" target="_blank">Ayuda</a>
  </div>

</body>
</html>
