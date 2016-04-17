<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="proyecto_uoct.EIV.VO.EIVVO,java.util.List,java.util.Iterator,proyecto_uoct.usuario.VO.UsuarioVO" %>
<%@ page import="proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.documentacion.VO.CliEntVO" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%
List listaIngenieros=(List) request.getAttribute("listaIngenieros");
List comunas= (List) request.getAttribute("comunas");
List redes= (List) request.getAttribute("redes");
List tiposeiv=(List) request.getAttribute("tiposeiv");
SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");

%>
<html>
<head>
<title>Registrar EIV</title>

<script LANGUAGE="JavaScript" type="text/javascript">

<!--
sortitems = 1;
//-----------------valida y agrega a la lista de redes relacionadas-----//
function mover(fbox,tbox){
	var red= fbox.value;
	if(validaRed(red) && validaRepeticion(red,tbox)) {
		var no = new Option();
		no.value = fbox.value;
		no.text = fbox.value;
		tbox.options[tbox.options.length] = no;
		fbox.value="";
		if (sortitems) SortD(tbox);
	}

}

function validaRed(red){
	var malo=red.search("[^0-9]");
	if(malo!=-1){
		alert("La red solamente se puede indicar con un número");
		return false;

	}
	if(red==""){
	alert("la red no puede ser nula");
	return false;
	}
	var noRed=parseInt(red);
	if(noRed>9999 || noRed<=0){
	alert("La red debe estar entre 1 y 9999");
	return false;
	}
	else return true;
}

function validaRepeticion(red,tbox){
for (var i=0;i<tbox.options.length;i++){
	if(red==tbox.options[i].value){
	alert("la red " +red+" ya está en la lista");
	return false;
	}
}
return true;
}

//------------------

function move(fbox,tbox) {
for(var i=0; i<fbox.options.length; i++) {
if(fbox.options[i].selected && fbox.options[i].value != "") {
var no = new Option();
no.value = fbox.options[i].value;
no.text = fbox.options[i].text;
tbox.options[tbox.options.length] = no;
fbox.options[i].value = "";
fbox.options[i].text = "";
   }
}
BumpUp(fbox);
if (sortitems) SortD(tbox);
}
function BumpUp(box)  {
for(var i=0; i<box.options.length; i++) {
if(box.options[i].value == "")  {
for(var j=i; j<box.options.length-1; j++)  {
box.options[j].value = box.options[j+1].value;
box.options[j].text = box.options[j+1].text;
}
var ln = i;
break;
   }
}
if(ln < box.options.length)  {
box.options.length -= 1;
BumpUp(box);
   }
}

function SortD(box)  {
var temp_opts = new Array();
var temp = new Object();
for(var i=0; i<box.options.length; i++)  {
temp_opts[i] = box.options[i];
}
for(var x=0; x<temp_opts.length-1; x++)  {
for(var y=(x+1); y<temp_opts.length; y++)  {
if(temp_opts[x].text > temp_opts[y].text)  {
temp = temp_opts[x].text;
temp_opts[x].text = temp_opts[y].text;
temp_opts[y].text = temp;
temp = temp_opts[x].value;
temp_opts[x].value = temp_opts[y].value;
temp_opts[y].value = temp;
      }
   }
}
for(var i=0; i<box.options.length; i++)  {
box.options[i].value = temp_opts[i].value;
box.options[i].text = temp_opts[i].text;
   }
}

function borrar(CONTROL){
for (var i =0;i<CONTROL.length;i++){
if (CONTROL.options[i].selected ==true){
CONTROL.options[i]=null;
}
}
}



//funciones para abrir ventana emergente y recibir los paramtros(documento Oficio) desde ésta
var otra=null;
function popUp(href, target, features) {
    otra = window.open(href, target, features);
    otra.window.focus();
  }

function pasaDoc(idDoc,codDoc,tipoDoc){
  formIngresarEIV.idDocOficio.value = idDoc;
  formIngresarEIV.codOficio.value = codDoc;

  otra.window.close();
  }


// -->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


  <!-- calendario popup-->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->

<!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="center">Ingreso de EISTU</h3></td>
  </tr>
  <form action="eivAction.do" name="formIngresarEIV" method="post" >
    <tr>
      <td> <div align="center">
          <input type="hidden" name="hacia" value="registrarEIV" />
          <table width="588" border="1" align="center">
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>T&iacute;tulo del EISTU*:</strong></div></td>
              <td width="353" colspan="2"> <input type="text" name="titulo_eiv" size="40" maxlength="90"></td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Documento
                  original*:</strong></div></td>
              <td colspan="2"> OFICIO -
                <input type="text" name="codOficio" size="20" readonly="readonly" />
                &nbsp; <input type="hidden" name="idDocOficio"/> <a href="eivAction.do?hacia=cargarBusDoc" target="_blank" onClick="popUp(this.href, this.target, 'width=670,height=600, scrollbars=1'); return false;"  >Buscar
                Documento</a> </td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Tipo de Estudio*:</strong></div></td>
              <td colspan="2"><select name="id_tipoestudio">
                  <%
        Iterator ite=tiposeiv.iterator();
        while(ite.hasNext()){
          IdStrVO t=(IdStrVO) ite.next();

        %>
                  <option value="<%=t.getId() %>" ><%=t.getStr() %></option>
                  <%} %>
                </select></td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Fecha Presentacion*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaPresentacion" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Env&iacute;o SEREMITT*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaEnvioSeremitt" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal2.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Fecha de Ingreso
                  UOCT*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaIngreso" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal3.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Fecha de Vencimiento*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaVencimiento" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal4.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Comuna*: </strong></div></td>
              <td colspan="2"><select name="id_comuna">
                  <option value="0">----------</option>
                  <%
     if (comunas!= null){

       Iterator ic= comunas.iterator();
       while(ic.hasNext()){
         IdStrVO com= (IdStrVO) ic.next();
         String s_com= "<option value=\""+ com.getId()+"\"";
         s_com += ">"+com.getStr()+"</option>";
         out.println(s_com);
       }

     }

      %>
                </select></td>
            </tr>
            <tr>
              <td width="219" height="26" bgcolor="#ADD8E4">
                <div align="right"><strong>Direcci&oacute;n*:</strong></div></td>
              <td colspan="2"><input type="text" name="direccion" size="40" maxlength="200" ></td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Redes Involucradas*:</strong></div></td>
              <td> <div align="left">
                  <table width="320" border="0">
                    <tr>
                      <td width="56" rowspan="2">
                        <input type="text" name="red" size="6">
                      </td>
                      <td width="79">
                        <div align="center">
                          <input type="button" value="Agregar&gt;&gt;" name="Input" onClick="mover(this.form.red,this.form.listaRel)"/>
                        </div></td>
                      <td width="171" rowspan="2">
                        <select multiple="multiple" name="listaRel" size="3" >
                        </select></td>
                    </tr>
                    <tr>
                      <td height="33">
                        <div align="center">
                          <input type="button" value="Borrar" name="Submit2" onClick="borrar(this.form.listaRel)"/>
                        </div></td>
                    </tr>
                  </table>
                </div></td>
            </tr>
            <tr>
              <td width="219" height="26" bgcolor="#ADD8E4">
                <div align="right"><strong>N&ordm; de estacionamientos *:</strong></div></td>
              <td colspan="2"><input type="text" name="estacionamientos" maxlength="5" size="5"></td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Consultor*:</strong></div></td>
              <td colspan="2"><input type="text" name="consultor" maxlength="100" /></td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Empresa del Consultor:</strong></div></td>
              <td colspan="2"><input type="text" name="empconsultora" maxlength="100" /></td>
            </tr>
            <tr>
              <td width="219" bgcolor="#ADD8E4">
<div align="right"><strong>Encargado del EISTU*:</strong></div></td>
              <td colspan="2"><select name="id_ingeniero">
                  <option value="0">---------</option>
                  <%
      if (listaIngenieros!=null){
        Iterator a= listaIngenieros.iterator();
        while (a.hasNext()){
          UsuarioVO inge= (UsuarioVO) a.next();
          String str=null;
          str= "<option value=\""+inge.getIdUsu()+"\"";
          if(inge.getNombreUsu2()!=null){
            str +=" >"+inge.getNombreUsu()+" "+inge.getNombreUsu2()+" "+inge.getApellUsu()+"</option>";
          }else{
            str +=" >"+inge.getNombreUsu()+" "+inge.getApellUsu()+"</option>";
          }
          out.println(str);
        }
      }
      %>
                </select> </td>
            </tr>
          </table>
        </div>
          <script language="JavaScript" type="text/javascript">
    var frmvalidator  = new Validator("formIngresarEIV");
    frmvalidator.addValidation("titulo_eiv","req","Debe ingresar título");
    frmvalidator.addValidation("titulo_eiv","maxlen=90","Título no puede superar los 90 caracteres");
    frmvalidator.addValidation("titulo_eiv","alnumspace");

    frmvalidator.addValidation("codOficio","req","Debe asociar un Oficio al EIV");

    frmvalidator.addValidation("id_tipoestudio","req","Indique el tipo de estudio");

    frmvalidator.addValidation("fechaPresentacion","req","Indique la fecha de Presentación");

    frmvalidator.addValidation("fechaEnvioSeremitt","req","Indique la fecha de Envío de SEREMITT");

    frmvalidator.addValidation("fechaIngreso","req","Indique la fecha de ingreso(Recepción)");

    frmvalidator.addValidation("fechaVencimiento","req","Indique la fecha de Vencimiento");

    frmvalidator.addValidation("id_comuna","req","Debe indicar la comuna");
    frmvalidator.addValidation("id_comuna","dontselect=0");

    frmvalidator.addValidation("direccion","req","Debe indicar la dirección");
    frmvalidator.addValidation("direccion","maxlen=200","Dirección no puede superar los 200 caracteres");
    frmvalidator.addValidation("direccion","alnumspace");

    frmvalidator.addValidation("listaRel","req","Debe indicar las redes involucradas");
    frmvalidator.addValidation("estacionamientos","req","Debe indicar la cantidad de estacionamientos");
    frmvalidator.addValidation("estacionamientos","maxlen=5","Estacionamientos no puede superar los 5 caracteres");
    frmvalidator.addValidation("estacionamientos","numeric");

    frmvalidator.addValidation("consultor","req","Debe indicar el consultor del EIV");
    frmvalidator.addValidation("consultor","maxlen=100","Consultor no puede superar los 100 caracteres");
    frmvalidator.addValidation("consultor","alnumspace");

    frmvalidator.addValidation("empconsultora","maxlen=100","Empresa del Consultor no puede superar los 100 caracteres");
    frmvalidator.addValidation("empconsultora","alnumspace");

    frmvalidator.addValidation("id_ingeniero","req","Debe indicar ingeniero a cargo");
    frmvalidator.addValidation("id_ingeniero","dontselect=0");
  </script>
      </td>
    </tr>
    <tr>
      <td><div align="center">
          <input type="submit" name="Submit" value="Registrar Y enviar email" onClick="javascript:SelectAllList(document.formIngresarEIV.listaRel);">
      &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="noEmail" value="Registrar SIN enviar email " onClick="javascript:SelectAllList(document.formIngresarEIV.listaRel);">
        </div></td>
    </tr>
  </form>
</table>
<script language="JavaScript" type="text/javascript">
<!-- // create calendar object(s) just after form tag closed
// specify form element as the only parameter (document.forms['formname'].elements['inputname']);
// note: you can have as many calendar objects as you need for your application
				var cal1 = new calendar1(document.forms['formIngresarEIV'].elements['fechaPresentacion']);
				cal1.year_scroll = true;
				cal1.time_comp = false;

                                var cal2 = new calendar1(document.forms['formIngresarEIV'].elements['fechaEnvioSeremitt']);
				cal2.year_scroll = true;
				cal2.time_comp = false;

                                var cal3 = new calendar1(document.forms['formIngresarEIV'].elements['fechaIngreso']);
				cal3.year_scroll = true;
				cal3.time_comp = false;

                                var cal4 = new calendar1(document.forms['formIngresarEIV'].elements['fechaVencimiento']);
				cal4.year_scroll = true;
				cal4.time_comp = false;
							//-->
</script>


<script language="JavaScript" type="text/javascript">
function SelectAllList(CONTROL){
for(var i = 0;i < CONTROL.length;i++){
CONTROL.options[i].selected = true;
}
}
</script>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
