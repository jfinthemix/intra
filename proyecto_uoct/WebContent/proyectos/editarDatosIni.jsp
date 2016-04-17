<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.List,java.util.Iterator,java.util.LinkedList" %>
<%@ page import="proyecto_uoct.usuario.VO.UsuarioVO,proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.proyecto.VO.*,java.text.SimpleDateFormat" %>
<%
List listausu=(List) request.getAttribute("listausu");

SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

DetalleProyectoVO detproy= (DetalleProyectoVO) request.getAttribute("detalleProy");
List enc= detproy.getEquipo();




//--------------- separa una lista de responsables(usus_resp) y una lista de usuarios(usus)
List usus_resp = new LinkedList();
List usus = new LinkedList();

if (enc!=null && listausu!=null){
  Iterator ilista = listausu.iterator();//un iterador para la lista completa de usuarios

  while(ilista.hasNext()){// para cada usuario
  boolean esR=false;
  UsuarioVO usu=(UsuarioVO)ilista.next();
  Iterator irespons= enc.iterator();//un iterador para la lista de responsables
  while (irespons.hasNext()){
    UsuarioVO r=(UsuarioVO)irespons.next();
    if (r.getIdUsu().intValue()==usu.getIdUsu().intValue()){
      usus_resp.add(usu);// si el usuario es responsable lo pone en una lista de responsables
      esR=true;
      break;
    }
  }
  if(!esR){
    usus.add(usu);// si no es responsable, lo pone en otra lista
  }
}
}



%>

<html>
<head>
  <title>Iniciativas de Inversión</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <script language="JavaScript" type="text/javascript">
    <!-- Script para el traspaso de variables
    sortitems = 1;

    function move(fbox,tbox) {
      for(var i=0; i<fbox.options.length; i++) {
        if(fbox.options[i].selected && fbox.options[i].value != "") {
          var no = new Option();
          no.value = fbox.options[i].value;
          no.text = fbox.options[i].text;
          tbox.options[tbox.options.length] = no;
     	  agregaEncargado(fbox);
		  fbox.options[i].value = "";
          fbox.options[i].text = "";
        }
      }
      BumpUp(fbox);
      if (sortitems) SortD(tbox);

    }

	//--------------------------

    function move2(fbox,tbox) {
      for(var i=0; i<fbox.options.length; i++) {
        if(fbox.options[i].selected && fbox.options[i].value != "") {
          var no = new Option();
          no.value = fbox.options[i].value;
          no.text = fbox.options[i].text;
          tbox.options[tbox.options.length] = no;
		  quitarEncargado(fbox);
          fbox.options[i].value = "";
          fbox.options[i].text = "";
        }
      }
      BumpUp(fbox);
	  BumpUp(this.form_proy.id_encargado);
      if (sortitems) SortD(tbox);

    }

//-------------------------------------------------



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

	//-------------------------------------------


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

	//-------------------------------------------


	function agregaEncargado(nuevo){
    for(var i=0; i<nuevo.options.length; i++) {
		if(nuevo.options[i].selected && nuevo.options[i].value != "") {
          var no = new Option();
          no.value = nuevo.options[i].value;
          no.text = nuevo.options[i].text;
          this.form_proy.id_encargado.options[this.form_proy.id_encargado.options.length] = no;
        }
		}
	}

	//----------------------------------------

	function quitarEncargado(box){
    for(var i=0; i<box.options.length; i++) {
	if(box.options[i].selected && box.options[i].value != "") {
		for (var ii=0;ii<this.form_proy.id_encargado.options.length;ii++){
		if(box.options[i].value==this.form_proy.id_encargado.options[ii].value){
          this.form_proy.id_encargado.options[ii].value = "";
          this.form_proy.id_encargado.options[ii].text = "";
        }
		}
		}
	}
	}



	// -->


    <!------------- Funcion para seleccionar  todos los encargados de la Lista

    function SelectAllList(CONTROL){
      for(var i = 0;i < CONTROL.length;i++){
        CONTROL.options[i].selected = true;

      }
    }



<!--   Para el traspaso de variables del Cliente entre Ventanas -->
var otra=null;
function popUp(href, target, features) {
    otra = window.open(href, target, features);
    otra.window.focus();
  }


function pasaCli(nomCli, idCli){
    form_proy.nomCli.value = nomCli;
    form_proy.idCli.value = idCli;
    otra.window.close();
  }









</script>

<!-- American format mm/dd/yyyy -->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->

<link href="../util/styla.css" rel="stylesheet" type="text/css">

 <!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>



</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3>Editar Iniciativa de Inversi&oacute;n</h3></td>
  </tr>
  <tr>
    <td valign="top"> <form name="form_proy" method="post" action="proyectoAction.do">
        <input type="hidden" name="hacia" value="actualizarIni">
        <table width="600" border="1" align="left">
          <input type="hidden" name="idIni" value="<%=detproy.getIdProy() %>"/>
          <tr>
            <td width="155" bgcolor="#ADD8E4"> <div align="right"><strong>Título
                de la Iniciativa*:</strong></div></td>
            <td width="395"> <input name="nom_proy" type="text" size="40" maxlength="40" value="<%=detproy.getNomProy() %>"></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right" > <strong>Ejecutor *:</strong>
              </div></td>
            <td> <input type="hidden" name="idCli" value="<%= detproy.getIdCliente()%>"/>
              <input type="text" name="nomCli" readonly="readonly" value="<%=detproy.getNomCliente()%>"/>
              &nbsp; <a href="../documentacion/clienteAction.do?hacia=busCli_pop" target="_blank" onClick="popUp(this.href, this.target, 'width=600,height=400, scrollbars=1'); return false;">Buscar
              Cliente</a> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <div align="right"><strong>Fecha de Inicio*:</strong>
              </div></td>
            <td> <div align="left">
                <input type="text" name="fechaini" size=8 readonly="readonly" value="<%=sdf.format(detproy.getFechaProy()) %>">
                &nbsp;<a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a>
              </div></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Descripci&oacute;n:</strong></div></td>
            <td><textarea name="descrip" cols="45" rows="5"><% if(detproy.getDescripcion()!=null && !detproy.getDescripcion().equals("")){out.print(detproy.getDescripcion());}%></textarea></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <p align="right"><strong>Equipo de Trabajo*:</strong></p></td>
            <td> <div align="center"> </div>
              <div align="center"> </div>
              <div align="left">
                <table border="0">
                  <tr>
                    <td rowspan="2"><select multiple size="4" name="list2">
                        <%
                  Iterator liu= usus.iterator();
                  while (liu.hasNext()){
                    UsuarioVO usu=(UsuarioVO) liu.next();
                    if(usu.getNombreUsu2()!=null){
                      out.println("<option value="+usu.getIdUsu()+">"+usu.getNombreUsu()+" "+usu.getNombreUsu2()+" "+usu.getApellUsu()+"</option>");
                    }else{
                      out.println("<option value="+usu.getIdUsu()+">"+usu.getNombreUsu()+" "+usu.getApellUsu()+"</option>");
                    }
                  }
                  %>
                      </select></td>
                    <td><input type="button" value="Agregar&gt;&gt;"
                  onClick="move(this.form.list2,this.form.list1)" name="B2"></td>
                    <td rowspan="2"><select multiple size="4" name="list1">
                        <%
                  Iterator liu2= usus_resp.iterator();
                  while (liu2.hasNext()){
                    UsuarioVO usu=(UsuarioVO) liu2.next();
                    if(usu.getNombreUsu2()!=null){
                      out.println("<option value="+usu.getIdUsu()+">"+usu.getNombreUsu()+" "+usu.getNombreUsu2()+" "+usu.getApellUsu()+"</option>");
                    }else{
                      out.println("<option value="+usu.getIdUsu()+">"+usu.getNombreUsu()+" "+usu.getApellUsu()+"</option>");
                    }
                  }

                  %>
                      </select></td>
                  </tr>
                  <tr>
                    <td><input type="button" value="&lt;&lt;Quitar"
                    onClick="move2(this.form.list1,this.form.list2)" name="B1"></td>
                  </tr>
                </table>
              </div></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <p align="right"><strong>Encargado de la Iniciativa*:</strong></p></td>
            <td><select name="id_encargado" >
                <%
                  Iterator liu3= usus_resp.iterator();
                  while (liu3.hasNext()){
                    UsuarioVO usu=(UsuarioVO) liu3.next();
                    if(usu.getNombreUsu2()!=null){
                      %>
                <option value="<%=usu.getIdUsu()%>" <%if(usu.getIdUsu().equals(detproy.getIdEncargado())){out.print(" selected");}%>><%=usu.getNombreUsu()+" "+usu.getNombreUsu2()+" "+ usu.getApellUsu()%></option>;

                <%}else{%>
                <option value="<%=usu.getIdUsu()%>" <%if(usu.getIdUsu().equals(detproy.getIdEncargado())){out.print(" selected");}%>><%=usu.getNombreUsu()+" "+usu.getApellUsu()%></option>;

                <%}
                      }
                  %>
              </select></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <p align="right"><strong>Fondos totales de
                la Iniciativa:</strong></p></td>
            <td><input type="text" name="ftotales" value="<%if (detproy.getFondosTotales().intValue()!=0){out.print(detproy.getFondosTotales());} %>"/></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"> <p align="right"><strong>Fondos Anuales:</strong></p></td>
            <td><textarea name="fanual" cols="60" rows="6"><%if(detproy.getFondosAnuales()!=null){out.print(detproy.getFondosAnuales());}%></textarea></td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <input type="submit" name="Submit" value="Actualizar los Datos" onClick="javascript:SelectAllList(document.form_proy.list1);">
              </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
  <script language="JavaScript" type="text/javascript">
var frmvalidator  = new Validator("form_proy");

frmvalidator.addValidation("nom_proy","req","Debe indicar un título para la Iniciativa");
frmvalidator.addValidation("nom_proy","maxlen=100","El título de la Iniciativa no puede superar los 100 caracteres");
frmvalidator.addValidation("nom_proy","alnumspace");

frmvalidator.addValidation("idCli","req","Debe ingresar la persona externa a cargo de la ejecución del proyecto");

frmvalidator.addValidation("fechaini","req","Debe ingresar la fecha de inicio del proyecto");

frmvalidator.addValidation("list1","req","Debe indicar el equipo de trabajo de la iniciativa");

frmvalidator.addValidation("id_encargado","req","Debe indicar el encargado de la iniciativa");

frmvalidator.addValidation("descrip","maxlen=1000","La descripción de la iniciativa no puede superar los 100 caracteres");

frmvalidator.addValidation("ftotales","num");

frmvalidator.addValidation("fanual","maxlen=500","Fondos anuales no puede superar los 500 caracteres");
</script>
  <script language="JavaScript" type="text/javascript">
      var cal1 = new calendar1(document.forms['form_proy'].elements['fechaini']);
      cal1.year_scroll = true;
      cal1.time_comp = false;
    </script>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div>  <div align="right"><a href="../ayuda/iniciativas.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
