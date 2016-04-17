<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="proyecto_uoct.documentacion.VO.DocumentodeListaVO, java.util.List, java.util.Iterator,java.text.SimpleDateFormat" %>
<%@ page import="proyecto_uoct.EIV.VO.EventoVO" %>
<%

SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

List eventos=null;

eventos=(List) request.getAttribute("eventos");
Integer id_eiv= (Integer) request.getAttribute("id_eiv");

String nomEIV = (String) request.getAttribute("nomEIV");
String mensaje = (String) request.getAttribute("mensaje");


/* Permisos del usuario */
Integer primera=(Integer) request.getAttribute("primera");
Integer reingresar=(Integer) request.getAttribute("reingreso");
Integer despachar=(Integer) request.getAttribute("despachar");
Integer aprobarUOCT=(Integer) request.getAttribute("aprobarUOCT");
Integer rechazarUOCT=(Integer) request.getAttribute("rechazarUOCT");
Integer aprobarSEREMITT=(Integer) request.getAttribute("aprobarSeremitt");
Integer rechazarSEREMITT=(Integer) request.getAttribute("rechazarSeremitt");
Integer otros=(Integer) request.getAttribute("otrosEventos");


/*flag que indican si ya hay registrada una primera revisión o una aprobacion o rechazo por parte de UOCT */

boolean hayprimera=false;
boolean aprob_rechaz_uoct=false;
boolean aprob_rechaz_seremitt=false;

 if (eventos!=null){
 Iterator ite=eventos.iterator();
 while (ite.hasNext()){
   EventoVO even= (EventoVO) ite.next();
   switch (even.getIdTipoEvento().intValue()){
     case 1: // En la base de datos, tipoevento.IdTipoEvento, 1 es primera Revisión
     hayprimera=true;
     break;

     case 4 : // En la base de datos, tipoevento.IdTipoEvento, 4 es aprobación de UOCT
     aprob_rechaz_uoct=true;
     break;

     case 5 : // En la base de datos, tipoevento.IdTipoEvento, 5 es rechazo de UOCT
     aprob_rechaz_uoct=true;
     break;

     case 6 : // En la base de datos, tipoevento.IdTipoEvento, 6 es aprobación de Seremitt
     aprob_rechaz_seremitt=true;
     break;

     case 7: // En la base de datos, tipoevento.IdTipoEvento, 7 es rechazo de Seremitt
     aprob_rechaz_seremitt=true;
     break;
   }

 }
}

%>

<html>
<head>
<title>Editar Bit&aacute;cora</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="CACHE-CONTROL" content="NO-CACHE"/>
  <!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

<link href="../util/styla.css" rel="stylesheet" type="text/css">

<script language="Javascript" type="text/javascript">
<!--
<!--   Para el traspaso de variables entre Ventanas -->
var otra=null;
function popUp(href, target, features) {
    otra = window.open(href, target, features);
    otra.window.focus();
  }

  function pasaDoc(idDoc,codDoc,tipoDoc){
    agregarEvento.idDoc.value = idDoc;
    agregarEvento.codDoc.value = codDoc;
    agregarEvento.tipoDoc.value = tipoDoc;

    otra.window.close();
  }


function verTipoBitacora(){
  <% if (primera.intValue()==1){%>
    if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value == "primeraRev"){
      agregarEvento.hacia.value="primeraRev";
      agregarEvento.tituloEvento.value="Primera Revisión";
      agregarEvento.tituloEvento.readOnly = true;
      agregarEvento.busdoc.value="";
      agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocsSal_pop";
    }
  <% }
  if (reingresar.intValue()==1){
    %>
    if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="reingreso"){
      agregarEvento.hacia.value="reingresarEIV";
      agregarEvento.tituloEvento.value="Reingreso de documentación";
      agregarEvento.tituloEvento.readOnly = true;
      agregarEvento.busdoc.value="";
      agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocs_pop";
    }
  <%}

  if(despachar.intValue()==1){
  %>
	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="despacho"){
	agregarEvento.hacia.value="despacharEIV";
	agregarEvento.tituloEvento.value="Despacho de documentación";
	agregarEvento.tituloEvento.readOnly = true;
        agregarEvento.busdoc.value="";
	agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocsSal_pop";
	}

  <%}

  if(aprobarUOCT.intValue()==1){
  %>
	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="aprobacionUOCT"){
	agregarEvento.hacia.value="aprobar_UOCT";
	agregarEvento.tituloEvento.value="Aprobación por UOCT";
	agregarEvento.tituloEvento.readOnly= true ;
        agregarEvento.busdoc.value="";
        agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocsSal_pop";
	}

  <%}

  if(rechazarUOCT.intValue()==1){
  %>

	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="rechazoUOCT"){
	agregarEvento.hacia.value="rechazar_UOCT";
	agregarEvento.tituloEvento.value="Rechazo por UOCT";
	agregarEvento.tituloEvento.readOnly= true;
        agregarEvento.busdoc.value="";
	agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocsSal_pop";
	}

  <%}

  if(aprobarSEREMITT.intValue()==1){
  %>

	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="aprobacionSEREMITT"){
	agregarEvento.hacia.value="aprobar_SEREMITT";
	agregarEvento.tituloEvento.value="Aprobación por SEREMITT";
	agregarEvento.tituloEvento.readOnly = true;
        agregarEvento.busdoc.value="";
	agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocs_pop";
	}

  <%}

  if(rechazarSEREMITT.intValue()==1){
  %>


	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="rechazoSEREMITT"){
	agregarEvento.hacia.value="rechazar_SEREMITT";
	agregarEvento.tituloEvento.value="Rechazo por SEREMITT";
	agregarEvento.tituloEvento.readOnly = true;
        agregarEvento.busdoc.value="";
	agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocs_pop";
	}

  <%}

  if(otros.intValue()==1){
  %>

	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="otro"){
	agregarEvento.hacia.value="agregarEvento";
	agregarEvento.tituloEvento.value="";
	agregarEvento.tituloEvento.readOnly= false;
        agregarEvento.busdoc.value="";
	agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocs_pop";
	}

	if (agregarEvento.tipobitacora.options[agregarEvento.tipobitacora.selectedIndex].value=="consolidado"){
	agregarEvento.hacia.value="agregarEvento";
	agregarEvento.tituloEvento.value="Consolidado SEREMITT";
	agregarEvento.tituloEvento.readOnly= false;
        agregarEvento.busdoc.value="";
	agregarEvento.busdoc.value="../documentacion/documentoAction.do?hacia=abuscarDocs_pop";
	}


  <%}




  %>

}//-->
</script>
  <!-- calendario popup-->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->
  <!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

<META http-equiv="pragma" content="no-cache">

</head>

<body onLoad="verTipoBitacora()">
<table width="750" border="0">
  <tr>
    <td height="21"> <h3 align="center">Agregar Bitácora a EISTU:</h3></td>
  </tr>
  <tr>
    <td><h4 align="center">EISTU - <%=id_eiv %>: <%=nomEIV %>
        <% if (mensaje != null){ %>
      </h4>
      <div align="center"><font color="red"><%=mensaje %></font>
        <%} %>
      </div></td>
  </tr>
  <form action="eivAction.do" name="agregarEvento">
    <tr>
      <td> <div align="center">
          <input type="hidden" name="hacia" value="agregarEvento" />
          <input type="hidden" name="id_eiv" value="<%= id_eiv%>" />
          <input type="hidden" name="nomEIV" value="<%=nomEIV%>" />
          <input type="hidden" name="busdoc" value="../documentacion/documentoAction.do?hacia=abuscarDocs_pop"/>
          <table width="556" border="1" align="center">
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>TIPO DE BIT&Aacute;CORA:</strong></div></td>
              <td> <select name="tipobitacora" onChange="verTipoBitacora()">
                  <%
  if(primera.intValue()==1 && !hayprimera){
  %>
                  <option value="primeraRev">primera revisi&oacute;n</option>
                  <%}
  if(reingresar.intValue()==1 && hayprimera  ){
  %>
                  <option value="reingreso">reingreso</option>
                  <%}

  if(despachar.intValue()==1){
  %>
                  <option value="despacho">despacho</option>
                  <%}

  if(aprobarUOCT.intValue()==1 && !aprob_rechaz_uoct){
  %>
                  <option value="aprobacionUOCT">aprobaci&oacute;n UOCT</option>
                  <%}

  if(rechazarUOCT.intValue()==1 && !aprob_rechaz_uoct){
  %>
                  <option value="rechazoUOCT">rechazo UOCT</option>
                  <%}

  if(aprobarSEREMITT.intValue()==1 && !aprob_rechaz_seremitt){
  %>
                  <option value="aprobacionSEREMITT">aprobacion SEREMITT</option>
                  <%}

  if(rechazarSEREMITT.intValue()==1 && !aprob_rechaz_seremitt){
  %>
                  <option value="rechazoSEREMITT">rechazo SEREMITT</option>
                  <%}

  if(otros.intValue()==1){
    %>
    <option value="consolidado">consolidado SEREMITT</option>
    <option value="otro">OTRO...</option>

                  <%}%>
                </select></td>
            </tr>
            <tr>
              <td width="145" bgcolor="#ADD8E4"><div align="right"><strong>Título
                  de la Bit&aacute;cora: </strong></div></td>
              <td width="395"> <input type="text" name="tituloEvento" size="35" maxlength="45" >
              </td>
            </tr>
            <tr>
              <td width="145" bgcolor="#ADD8E4"><div align="right"><strong>Fecha
                  de la Bit&aacute;cora: </strong></div></td>
              <td width="395"> <input type="text" name="fechaEvento" size=8 readonly="readonly">
                &nbsp;<a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Descripci&oacute;n:
                  </strong></div></td>
              <td><textarea name="desc_ev" cols="60"  rows="6" ></textarea></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4"><div align="right"><strong>Documento Relacionado:
                  </strong></div></td>
              <td><div align="left">
                  <input name="idDoc" type="hidden" value="" />
                  <input name="tipoDoc" type="text" size="5" readonly="readonly"/>
                  -
                  <input type="text" size="12" readonly="readonly" name="codDoc"/>
                  <a href="" target="_blank" onClick="popUp(agregarEvento.busdoc.value, this.target, 'width=1000,height=400, scrollbars=1'); return false;">Buscar
                  Documento</a> </div></td>
            </tr>
          </table>
        </div></td>
    </tr>
    <tr>
      <td> <div align="center">
          <input type="submit" name="agregar" value="Registrar Bitácora">
          &nbsp;
          <input name="reset"  type="reset" value="Borrar formulario"/>
        </div></td>
    </tr>
	  </form>

	  <script language="JavaScript" type="text/javascript">
    var frmvalidator  = new Validator("agregarEvento");
    frmvalidator.addValidation("tituloEvento","req","Debe ingresar el título de la bitácora");
    frmvalidator.addValidation("tituloEvento","maxlen=50","El titulo de la bitácora no puede superar los 50 caracteres");
    frmvalidator.addValidation("tituloEvento","alnumspace");

    frmvalidator.addValidation("fechaEvento","req","Debe ingresar la fecha de la bitácora");

    frmvalidator.addValidation("desc_ev","req","Debe ingresar la descripción de la bitácora");
    frmvalidator.addValidation("desc_ev","maxlen=500","La descripción de la bitácora no puede superar los 500 caracteres");


  </script>

<script language="JavaScript" type="text/javascript">

				var cal1 = new calendar1(document.forms['agregarEvento'].elements['fechaEvento']);
				cal1.year_scroll = true;
				cal1.time_comp = false;
</script>

    <tr>
      <td><h4 align="center">Bit&aacute;cora del EISTU</h4></td>
    </tr>
    <tr>
      <td><div align="center">
          <table width="585" border="1" align="center">
            <tr bgcolor="#C0C0C0">
              <td width="98"> <div align="center"><strong>Fecha</strong></div></td>
              <td width="220"> <div align="center"><strong>T&iacute;tulo de bit&aacute;cora
                  </strong></div></td>
              <td width="93"><strong>Documento </strong></td>
            </tr>
            <%
 if (eventos!=null){
 Iterator ie=eventos.iterator();
 while (ie.hasNext()){
   EventoVO even= (EventoVO) ie.next();

   %>
            <tr>
              <td><%= sdf.format(even.getFechaEv()) %></td>
              <td><%= even.getTitulo() %></td>
              <% if (even.getIdDocRel().intValue()!=0){ %>
              <td> <%=even.getTipoDoc() %>-<%= even.getCodDoc()%></td>
              <%} else {
     %>
              <td>&nbsp;</td>
              <%}%>
            </tr>
            <%
}
}
 %>
          </table>
        </div></td>
    </tr>


</table>

<hr>
 <div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div> <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>

</body>
</html>
