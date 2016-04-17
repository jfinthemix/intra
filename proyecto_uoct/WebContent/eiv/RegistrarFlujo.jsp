<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>
<%@page import="proyecto_uoct.EIV.VO.FlujoVO,java.text.SimpleDateFormat" %>
<%@page import="java.util.List,java.util.Iterator" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy");
Integer id_eiv = (Integer) request.getAttribute("id_eiv");
String nomEIV = (String) request.getAttribute("nomEIV");
FlujoVO flujo_ant=(FlujoVO) request.getAttribute("flujo_ant");
List flujos = (List) request.getAttribute("flujos");
String mensaje=(String)request.getAttribute("mensaje");
%>

<html>
<head>
<title>Ingreso de Flujos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
  <!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
  <!-- calendario popup-->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->

</head>
<body>

<table width="750" border="0" >
  <tr>
    <td><h3 align="center">Flujos Vehiculares de EISTU:</h3></td>
  </tr>
  <tr>
    <td><h4 align="center">EISTU-<%=id_eiv %>: <%=nomEIV %>
        <%if(mensaje!=null){ %>
      </h4>
      <div align="center"><font color="red"><%=mensaje%></font>
        <%}%>
      </div></td>
  </tr>
  <form action="flujoAction.do" name="formFlujo">
    <tr>
      <td> <div align="center">
          <input type="hidden" name="hacia" value="ingresarFlujo"/>
          <input type="hidden" name="id_eiv" value="<%=id_eiv%>" />
          <input type="hidden" name="nomEIV" value="<%=nomEIV%>"/>
          <table width="599" border="1" align="center">
            <tr>
              <td width="200" bgcolor="#ADD8E4">
                <div align="right"><strong>Fecha
                  del flujo:</strong></div></td>
              <td width="480">
<input type="text" name="fechaflujo" size=8 readonly="readonly" value="<% if (flujo_ant!=null){  if (!flujo_ant.getFecha().equals("")){ out.print(sdf.format(flujo_ant.getFecha()));}}%>" >
                &nbsp; <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="200" bgcolor="#ADD8E4">
<div align="right"><strong>Tipo de d&iacute;a
                  :</strong></div></td>
              <td><select name="tipodia">
                  <option value="1" <%if (flujo_ant!=null){  if (flujo_ant.getIdTipoDia().equals("1")){out.print("selected");} }%>>Laboral</option>
                  <option value="2"<%if (flujo_ant!=null){  if (flujo_ant.getIdTipoDia().equals("2")){out.print("selected");} }%>>
                  S&aacute;bado </option>
                  <option value="3"<%if (flujo_ant!=null){  if (flujo_ant.getIdTipoDia().equals("3")){out.print("selected");} }%>>Domingo</option>
                </select></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#ADD8E4">
<div align="right"><strong>calle 1: </strong></div></td>
              <td><input type="text" name="calle1" value="<%if (flujo_ant!=null){  if(!flujo_ant.getCalle1().equals("null")){ out.print(flujo_ant.getCalle1());}} %>"></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#ADD8E4">
<div align="right"><strong>calle 2: </strong></div></td>
              <td><input type="text" name="calle2" value="<%if (flujo_ant!=null){  if(!flujo_ant.getCalle2().equals("null")){ out.print(flujo_ant.getCalle2());}} %>"></td>
            </tr>
            <tr>
              <td width="200" bgcolor="#ADD8E4">
<div align="right"><strong>Horas de las Mediciones:</strong></div></td>
              <td><input name="horasMed" maxlength="200" type="text" size="80" value="<% if (flujo_ant!=null){  if(!flujo_ant.getHorasMed().equals("null")){ out.print(flujo_ant.getHorasMed()); }}%>">
                (ej:06:00-07:00; 18:30-19:00) </td>
            </tr>
          </table>
        </div></td>
    </tr>
    <tr>
      <td> <div align="center">
          <input type="submit" name="Submit" value="Guardar">
        </div></td>
    </tr>
  </form>
  <script language="JavaScript" type="text/javascript">
    var frmvalidator  = new Validator("formFlujo");
    frmvalidator.addValidation("fechaflujo","req","Debe ingresar la fecha del flujo");
    frmvalidator.addValidation("calle1","req","Debe ingresar la calle");
    frmvalidator.addValidation("calle1","maxlen=50","Calle 1 no puede superar los 50 caracteres");
    frmvalidator.addValidation("calle1","alnumspace");

    frmvalidator.addValidation("calle2","maxlen=50","Calle 2 no puede superar los 50 caracteres");
    frmvalidator.addValidation("calle2","alnumspace");

    frmvalidator.addValidation("horasMed","req","Debe ingresar las horas de las mediciones");
    frmvalidator.addValidation("horasMed","maxlen=200","Horas de las mediciones no puede superar los 200 caracteres");
  </script>
  <script language="JavaScript" type="text/javascript">
			<!-- // create calendar object(s) just after form tag closed
				 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
				 // note: you can have as many calendar objects as you need for your application
				var cal1 = new calendar1(document.forms['formFlujo'].elements['fechaflujo']);
				cal1.year_scroll = true;
				cal1.time_comp = false;

                                //-->
                              </script>
  <tr>
    <td> <div align="center">
        <table width="650" border="1" align="center">
          <tr bgcolor="">
            <td width="72" bgcolor="#A6F7BA"> <div align="center"><strong>Fecha</strong></div></td>
            <td width="69" bgcolor="#A6F7BA"> <div align="center"><strong>Tipo
                de d&iacute;a</strong></div></td>
            <td width="90" bgcolor="#ADD8E4"> <div align="center"><strong>Calle
                1</strong></div></td>
            <td width="87" bgcolor="#F7FBC4"> <div align="center"><strong>Calle
                2</strong></div></td>
            <td width="226" bgcolor="#A6F7BA"> <div align="center"><strong>Horas
                de Mediciones</strong></div></td>
            <td width="66" bgcolor="#A6F7BA"> <div align="center"><strong>Borrar</strong></div></td>
          </tr>
          <% if (flujos!=null){
    Iterator i =flujos.iterator();
    while(i.hasNext()){
    FlujoVO flujo = (FlujoVO)i.next();
    %>
          <tr>
            <td><%=sdf.format(flujo.getFecha()) %></td>
            <td><%=flujo.getTipoDia()%></td>
            <td><%=flujo.getCalle1()%></td>
            <td><%if(flujo.getCalle2()!=null){
           out.print(flujo.getCalle2());}
           else{
             out.print("&nbsp;");
           }
             %></td>
            <td><%=flujo.getHorasMed()%></td>
            <td width="66"> <div align="center"><strong><a href="flujoAction.do?hacia=eliminarFlujo&id_eiv=<%=id_eiv %>&nomEIV=<%=nomEIV %>&idFlujo=<%=flujo.getIdFlujo()%>">borrar</a></strong></div></td>
          </tr>
          <%
    }
    }%>
        </table>
      </div></td>
  </tr>
  <tr><td><a href="eivAction.do?hacia=detalleEIV&id_eiv=<%=id_eiv%>">Ir al detalle del EISTU</a></td></tr>
</table>
<br />
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
