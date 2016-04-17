<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="proyecto_uoct.EIV.VO.EIVVO,java.util.List,java.util.LinkedList,java.util.Iterator,proyecto_uoct.usuario.VO.UsuarioVO" %>
<%@ page import="proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.documentacion.VO.CliEntVO" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%
EIVVO eiv= (EIVVO) request.getAttribute("detalleeiv");
List listaIngenieros=(List) request.getAttribute("listaIngenieros");
List comunas= (List) request.getAttribute("comunas");
List redes= (List) request.getAttribute("redes");
List tiposEIV=(List) request.getAttribute("tiposEIV");
List estados=(List) request.getAttribute("estados");

//--------------- separa una lista de Redes del EIV(usus_resp) de las que no son del EIV
List redRel = new LinkedList();
List redesL = new LinkedList();

if (eiv.getRedes()!=null && redes!=null){
  List redRelTemp = eiv.getRedes();//guarda la lista de redes relacionadas
  Iterator ilista = redes.iterator();//un iterador para la lista completa de usuarios

  while(ilista.hasNext()){  // para cada red
  boolean esR=false;
  Integer rTemp=(Integer)ilista.next();
  Iterator iredRel= redRelTemp.iterator();  //un iterador para la lista de redes relacionadas
  while (iredRel.hasNext()){
    Integer rRel=(Integer)iredRel.next();
    if (rRel.intValue()==rTemp.intValue()){
      redRel.add(rTemp);// si la red pertenece al EIV la guarda en una lista
      esR=true;
      break;
    }
  }
  if(!esR){
    redesL.add(rTemp);// si no, en otra lista
  }
}
}

SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");

%>

<html>
<head>
<title><%= eiv.getNomEiv() %></title>

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
	if(noRed>999 || noRed<=0){
	alert("La red debe estar entre 1 y 999");
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


// -->
</script>
  <!-- calendario popup-->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="../util/styla.css" rel="stylesheet" type="text/css">

<!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

</head>




<body>
<table width="750" border="0">
  <tr>
    <td><div align="center">
        <h3 align="center">Editar datos de<br>
          <strong>EISTU-<%=eiv.getIdEIV() %></strong> </h3>
      </div></td>
  </tr>
  <form action="eivAction.do" name="formActualizarEIV" >
    <tr>
      <td> <div align="center">
          <input type="hidden" name="hacia" value="actualizarEIV" />
          <input type="hidden" name="id_eiv" value="<%=eiv.getIdEIV()%>" />
          <table width="588" border="1" align="center">
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>T&iacute;tulo:</strong></div></td>
              <td colspan="2"><%= eiv.getNomEiv() %></td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Tipo
                  de Estudio:</strong></div></td>
              <td><select name="id_tipoestudio">
                  <% if(tiposEIV!=null){
        Iterator itipos=tiposEIV.iterator();
        while (itipos.hasNext()){
          IdStrVO ti=(IdStrVO) itipos.next();
          %>
                  <option value="<%=ti.getId()%>" <%if (ti.getId().intValue()==eiv.getIdTipoEstudio().intValue()){out.print("selected");} %>><%=ti.getStr()%></option>
                  <%}
          } %>
                </select></td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Estado
                  del EISTU:</strong></div></td>
              <td colspan="2"><select name="id_estado">
                  <% if(estados!=null){
        Iterator iest=estados.iterator();
        while (iest.hasNext()){
          IdStrVO es=(IdStrVO) iest.next();
          %>
                  <option value="<%=es.getId()%>"<%if (eiv.getIdEstado().intValue()==es.getId().intValue()){out.print("selected");}%> ><%=es.getStr()%></option>
                  <%}
        } %>
                </select> </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Fecha
                  Presentacion*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaPresentacion" value="<%=sdf.format(eiv.getFechaPresent())%>" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Env&iacute;o
                  SEREMITT*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaEnvioSeremitt" value="<%=sdf.format(eiv.getFechaEnvioSeremitt())%>" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal2.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Fecha
                  de Ingreso UOCT*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaIngreso" value="<%=sdf.format(eiv.getFechaIng())%>" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal3.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Fecha
                  de Vencimiento*:</strong></div></td>
              <td colspan="2"> <input type="text" name="fechaVencimiento" value="<%=sdf.format(eiv.getFechaVenc())%>" size=8 readonly="readonly">
                &nbsp; <a href="javascript:cal4.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Comuna:
                  </strong></div></td>
              <td colspan="2"><select name="idComuna">
                  <%
     if (comunas!= null){

       Iterator ic= comunas.iterator();
       while(ic.hasNext()){
         IdStrVO com= (IdStrVO) ic.next();
         String s_com= "<option value=\""+ com.getId()+"\"";

         if (com.getId().intValue()==eiv.getIdComuna().intValue()) {
           s_com += " selected";
         }
         s_com += ">"+com.getStr()+"</option>";
         out.println(s_com);
       }

     }

      %>
                </select></td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Direcci&oacute;n:</strong></div></td>
              <td colspan="2"><input type="text" size="40" name="direccion" value="<%= eiv.getDir() %>" maxlength="200" ></td>
            </tr>
            <tr>
              <td width="198" height="64" bgcolor="#ADD8E4">
                <div align="right"><strong>Redes
                  Involucradas:</strong></div></td>
              <td width="374"> <table width="376" border="0">
                  <tr>
                    <td width="55" rowspan="2"> <input type="text" name="red" size="6">
                    </td>
                    <td width="89"> <div align="center">
                        <input type="button" value="Agregar&gt;&gt;" name="Input" onClick="mover(this.form.red,this.form.listaRel)"/>
                      </div></td>
                    <td width="218" rowspan="2"> <select multiple size="3" name="listaRel">
                        <%
              if (redRel!=null){
                Iterator ir= redRel.iterator();
                while (ir.hasNext()){
                  Integer red1= (Integer) ir.next();
                  %>
                        <option value="<%=red1%>"><%=red1 %> </option>
                        <%
                }
              }
              %>
                      </select></td>
                  </tr>
                  <tr>
                    <td> <div align="center">
                        <input type="button" value="Borrar" name="Submit2" onClick="move(this.form.listaRel,this.form.red)"/>
                      </div></td>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <td width="198" height="26" bgcolor="#ADD8E4">
                <div align="right"><strong>N&ordm;
                  de estacionamientos:</strong></div></td>
              <td colspan="2"><input type="text" name="estacionamientos" value="<%= eiv.getEstacionamientos()%>"></td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Consultor:</strong></div></td>
              <td colspan="2"><input type="text" name="consultor" value="<%= eiv.getNomCons()%>"  />
              </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Empresa
                  Consultora:</strong></div></td>
              <td colspan="2"><input type="text" name="empconsultora" value="<%if(eiv.getEmpCons()!=null){out.print(eiv.getEmpCons());}else{out.print("");}%>" />
              </td>
            </tr>
            <tr>
              <td width="198" bgcolor="#ADD8E4"> <div align="right"><strong>Encargado
                  del EISTU:</strong></div></td>
              <td colspan="2"><select name="id_ingeniero">
                  <%
            if (listaIngenieros!=null){
              Iterator a= listaIngenieros.iterator();
              while (a.hasNext()){
                UsuarioVO inge= (UsuarioVO) a.next();
                String str=null;
                str= "<option value=\""+inge.getIdUsu()+"\"";
                if(inge.getIdUsu().intValue()== eiv.getIdEncargado().intValue()){
                  str +=" selected ";
                }
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
        <div align="center">
          <script language="JavaScript" type="text/javascript">
    var frmvalidator  = new Validator("formActualizarEIV");

    frmvalidator.addValidation("fechaPresentacion","req","Indique la fecha de Presentación");

    frmvalidator.addValidation("fechaEnvioSeremitt","req","Indique la fecha de Envío de SEREMITT");

    frmvalidator.addValidation("fechaIngreso","req","Indique la fecha de ingreso(Recepción)");

    frmvalidator.addValidation("fechaVencimiento","req","Indique la fecha de Vencimiento");

    frmvalidator.addValidation("idComuna","req","Debe indicar la comuna");

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
  </script>
        </div></td>
    </tr>
    <tr>
      <td> <div align="center">
          <input type="submit" name="Submit" value="Guardar Cambios" onClick="javascript:SelectAllList(document.formActualizarEIV.listaRel);">
          &nbsp;&nbsp;
          <input name="reset" type="reset" value="Restablecer Valores" />
        </div></td>
    </tr>
  </form>
</table>
<script language="JavaScript" type="text/javascript">
<!-- // create calendar object(s) just after form tag closed
// specify form element as the only parameter (document.forms['formname'].elements['inputname']);
// note: you can have as many calendar objects as you need for your application
				var cal1 = new calendar1(document.forms['formActualizarEIV'].elements['fechaPresentacion']);
				cal1.year_scroll = true;
				cal1.time_comp = false;

                                var cal2 = new calendar1(document.forms['formActualizarEIV'].elements['fechaEnvioSeremitt']);
				cal2.year_scroll = true;
				cal2.time_comp = false;

                                var cal3 = new calendar1(document.forms['formActualizarEIV'].elements['fechaIngreso']);
				cal3.year_scroll = true;
				cal3.time_comp = false;

                                var cal4 = new calendar1(document.forms['formActualizarEIV'].elements['fechaVencimiento']);
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
