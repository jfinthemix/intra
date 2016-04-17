<%@taglib uri="/WEB-INF/lib/struts-tiles.tld" prefix="tiles"%>
<%@taglib uri="/WEB-INF/lib/struts-nested.tld" prefix="nested"%>
<%@page language="java" import="java.sql.*,java.util.List,java.util.Iterator,proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.usuario.VO.UsuarioVO" errorPage=""%>
<%@page import="proyecto_uoct.documentacion.VO.CliEntVO,proyecto_uoct.documentacion.VO.TipoDocVO"%>
<%@taglib uri="/WEB-INF/lib/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/lib/struts-template.tld" prefix="template"%>
<%@taglib uri="/WEB-INF/lib/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/lib/struts-html.tld" prefix="html"%>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
  List listausu = (List) request.getAttribute("listausu");
  Iterator liu = listausu.iterator();
  List tiposentrantes = (List) request.getAttribute("tiposentrantes");
  Iterator i = tiposentrantes.iterator();
  List tipossalientes = (List) request.getAttribute("tipossalientes");
  String mensaje = null;
  if (request.getAttribute("mensaje") != null) {
    mensaje = (String) request.getAttribute("mensaje");
  }
%>
<html>
  <head>
    <title>  Ingreso de documentación holahola</title>
    <meta http-equiv="Content-Type"  content="text/html; charset=iso-8859-1">
      <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">

        <!-- European format dd-mm-yyyy -->
        <script language="JavaScript" src="calendar1.js" type="text/javascript"></script>  <!-- Date only with year scrolling -->


        <!-- validador -->
        <script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

        <script LANGUAGE="JavaScript" type="text/javascript">

//<!--------- Script para habilitar y deshabilitar los File-->
  function cambiaDoc(file,chk){
    if(chk.checked==false){
      file.disabled=true;
    }
    if(chk.checked==true){
      file.disabled=false;
    }

  }


//<!--- agrega un doc ant a la lista-->
function agregarAnt(){
 var  iddoc=form_regDoc.idDocAnt.value;
 var tipodoc=form_regDoc.tipoDocAnt.value;
 var coddoc=form_regDoc.codDocAnt.value;
var ntext =tipodoc+"-"+coddoc;
var nval =iddoc;


form_regDoc.idDocAnt.value="";
form_regDoc.tipoDocAnt.value="";
form_regDoc.codDocAnt.value="";

var no = new Option();
no.value =nval;
no.text = ntext;
form_regDoc.listaRel.options[form_regDoc.listaRel.options.length] = no;
}



//<!-- valida la agregacion de un doc Ant a la lista-->

function validaAnt(){
 var  iddoc=form_regDoc.idDocAnt.value;
  for (i=0;i<form_regDoc.listaRel.options.length;i++){
    if(iddoc==form_regDoc.listaRel.options[i].value){
      alert("ya existe en la lista");
      return false;
    }
  }
    if(iddoc==""){ alert("Buscar Documento para agregar");return false;}
  agregarAnt();
}


function borrar(CONTROL){
for (var i =0;i<CONTROL.length;i++){
if (CONTROL.options[i].selected ==true){
CONTROL.options[i]=null;
}
}
}


function SelectAllList(CONTROL){
for(var i = 0;i < CONTROL.length;i++){
CONTROL.options[i].selected = true;
SelectAllList2(document.form_regDoc.listaRel);
}
}

function SelectAllList2(CONTROL){
for(var i = 0;i < CONTROL.length;i++){
CONTROL.options[i].selected = true;
}
}


//<!--   Para el traspaso de variables entre Ventanas -->
var otra=null;
function popUp(href, target, features) {
    otra = window.open(href, target, features);
    otra.window.focus();
  }


function pasaCli(nomCli, idCli){
    form_regDoc.nomCli.value = nomCli;
    form_regDoc.idCli.value = idCli;
    otra.window.close();
  }

  function pasaDoc(idDoc,codDoc,tipoDoc){
    form_regDoc.idDocAnt.value = idDoc;
    form_regDoc.codDocAnt.value = codDoc;
    form_regDoc.tipoDocAnt.value = tipoDoc;

    otra.window.close();
  }

</script>


<script type="text/javascript">

 function valLargoFile(arch)
{
  archivo=arch.value; //reemplazar nombre del file
  largo=30; //reemplazar la longitud del campo
  while(archivo.indexOf('\\') !=-1){
  archivo=archivo.slice(archivo.indexOf('\\')+1);
  }
  if(archivo.length>largo){
  alert("nombre del archivo demasiado largo");
  return false;
  }else{
  return true;
  }

}
</script>



<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>
<body>


					
						<h2>Ingresar documento</h2>
						
						<div class="box boxpost">
							<h4>Datos del documento:</h4>
				 			<html:form action="/documentacion/documentoAction.do" name="form_regDoc"   method="post" type="proyecto_uoct.documentacion.controller.RegDocFormBean" enctype="multipart/form-data">
				 			<input type="hidden"  name="hacia" value="ingresarDocumento"/>
  								<div class="form-group">
  								<input type="hidden" value="1" name="sentido" />
    								<label for="inputCodigo" class="col-sm-4 control-label">Código*</label>
    								<div class="col-sm-4">
      								<select name="idTipoDoc" class="form-control" id="inputSentido">
    										<option value="0" disabled="" selected="">Seleccionar</option>
    										  <%
									              while (i.hasNext()) {
									                TipoDocVO tipo = (TipoDocVO) i.next();
									                if(tipo.getIsActivo() && !tipo.getEnIniciativas()){
									                out.println("<option value=" + tipo.getIdTipo() + ">" + tipo.getTipo() + "</option>");
									        	    }}
            	%>
    									</select>
    								</div>
    								<div class="col-sm-4">
      								<input type="text" maxlength="100" name="codDoc" class="form-control" id="inputCodigo">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputRemitente" class="col-sm-4 control-label">Remitente (cliente)*</label>
    								<div class="col-sm-5">
    								<input type="hidden" name="idCli" value="" />
      								<input type="text" name="nomCli" readonly="readonly" class="form-control" id="inputRemitente">
    								</div>
    								<div class="col-sm-3">
      								<a href="documentacion/clienteAction.do?hacia=busCli_pop" target="_blank" onClick="popUp('documentacion/clienteAction.do?hacia=buscarCli', this.target, 'width=1000,height=700,scrollbars=yes'); return false;"   class="botoGris botoMini noMarg"><span class="glyphicons glyphicons-search"></span> Buscar</a>
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="textareaMat" class="col-sm-4 control-label">Mat.*</label>
    								<div class="col-sm-8">
      								<textarea name="materia" rows="5" class="form-control" id="textareaMat"></textarea>
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputIngreso" class="col-sm-4 control-label">Fecha de ingreso*</label>
    								<div class="col-sm-8">
      								<input name="fecha_IO" type="date" class="form-control inputFecha" id="inputIngreso">
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputFechadoc" class="col-sm-4 control-label">Fecha de Documento*</label>
    								<div class="col-sm-8">
      								<input name="fecha_doc" type="date" class="form-control inputFecha" id="inputFechadoc">
    								</div>
    							</div>
  								<div class="form-group">
  								<input type="hidden" name="idDocAnt"/>
    								<label for="inputAnt2" class="col-sm-4 control-label">Ant.</label>
    								<div class="col-sm-2 guionpost">
      								<input type="text" name="tipoDocAnt" readonly="readonly" class="form-control" id="inputAnt1">
    								</div>
    								<div class="col-sm-6">
      								<input maxlength="20" name="codDocAnt"  readonly="readonly" type="text" class="form-control" id="inputAnt2">
    								</div>
    								<div class="col-sm-8 col-sm-offset-4 mTop10 bmMarg7">
      								<a href="documentoAction.do?hacia=abuscarDocs_pop" target="_blank" onClick="popUp('documentacion/documentoAction.do?hacia=busDoc&tipoBus=', this.target, 'width=1000,height=600,scrollbars=yes'); return false;"   class="botoGris botoMini"><span class="glyphicons glyphicons-search"></span> Buscar</a>
      								<a href="javascript:AgregarAnt()" class="botoGris botoMini"><span class="glyphicons glyphicons-circle-plus" ></span> Agregar</a>
      								<a href="javascript:QuitarAnt()" class="botoRojo botoMini noMarg"><span class="glyphicons glyphicons-delete"></span> Borrar</a>
    								</div>
    								<div class="col-sm-8 col-sm-offset-4 mTop10">
    									<select name="listaRel"  multiple="" class="form-control" size="4">
    									</select>
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputResponsable" class="col-sm-4 control-label">Responsable*</label>
    								<div class="col-sm-8">
    									<select multiple="" name="list2" id="grupoA" class="form-control" size="4">
    										 <%
	                    while (liu.hasNext()) {
                              UsuarioVO usu = (UsuarioVO) liu.next();
                              if(usu.getIsActivo()==true){
                                if(usu.getNombreUsu2()!=null){
                                  out.println("<option value=" + usu.getIdUsu() + ">" + usu.getNombreUsu() + " " + usu.getNombreUsu2() + " " + usu.getApellUsu() + "</option>");
                                }else{
                                  out.println("<option value=" + usu.getIdUsu() + ">" + usu.getNombreUsu() + " " + usu.getApellUsu() + "</option>");
                                }
                              }
                            }
        	          %>
    									</select>
    								</div>
    								<div class="col-sm-8 col-sm-offset-4 mTop10 text-right">
      								<a id="botoAdd" href="javascript:void(0)"  onClick="move('list2','list1')" class="botoGris botoMini"><span class="glyphicons glyphicons-chevron-down"></span> Agregar</a>
      								<a id="botoRemove" href="javascript:void(0)" onClick="move('list1','list2')" class="botoGris botoMini noMarg"><span class="glyphicons glyphicons-chevron-up"></span> Quitar</a>
    								</div>
    								<div class="col-sm-8 col-sm-offset-4 mTop10">
    									<select multiple="" name="list1" id="grupoB" class="form-control" size="4">
    									</select>
    								</div>
    							</div>
  								<div class="form-group">
    								<label for="inputAdjuntos" class="col-sm-4 control-label">Subir documento</label>
    								<div class="col-sm-8">
    									<div class="checkbox">
  											<label>
    											<input type="checkbox" class="checkUp" value="" name="eldoc_chk"  onClick="cambiaDoc(this.form.eldoc,this.form.eldoc_chk)">
    											<html:file property="eldoc" disabled="true" onblur="valLargoFile(this.form.eldoc)"/>
    											<!-- <input type="file" class="fileUp" disabled=""> -->
  											</label>
										</div>
										<div class="checkbox mTop10">
  											<label>
    											<input type="checkbox" class="checkUp" value="" name="eldoc1_chk" onClick="cambiaDoc(this.form.eldoc1,this.form.eldoc1_chk)">
    											<html:file property="eldoc1" disabled="true" onblur="valLargoFile(this.form.eldoc1)"/>
  											</label>
										</div>
										<div class="checkbox mTop10">
  											<label>
    											<input type="checkbox" class="checkUp" value="" name="eldoc2_chk" onClick="cambiaDoc(this.form.eldoc2,this.form.eldoc2_chk)">
    											<html:file property="eldoc2" disabled="true" onblur="valLargoFile(this.form.eldoc2)"/>
  											</label>
										</div>
      							</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a href="javascript:submitThisForm()"  class="botoVerde"><span class="glyphicons glyphicons-disk-save"></span> Guardar</a>
      								</div>
  									</div>
    							</div>
  							  </html:form>
				 		</div>
						
				 	
				 		
<script>

function submitThisForm()
{
	
	var formulario= $("[name='form_regDoc']");
	var action='/documentacion/documentoAction.do';
	
	
	
		formulario.validate({
			  rules: {
			    // simple rule, converted to {required:true}
			    idTipoDoc: {
			    	required:true
			    },
			    codDoc: {
			    	required:true
			    },
			    idCli: {
			    	required:true
			    },
			    materia: {
			    	required:true
			    },
			    fecha_IO: {
			    	required:true
			    },
			    fecha_doc: {
			    	required:true
			    },
			    list1: {
			    	required:true
			    }
			  
			    },
			    messages: {
			    	idTipoDoc: {
				    	required:"Debe ingresar el tipo de documento"
				    },
				    codDoc: {
				    	required:"Debe ingresar el código del documento"
				    },
				    idCli: {
				    	required:"Debe indicar el cliente"
				    },
				    materia: {
				    	required:"Debe ingresar materia"
				    },
				    fecha_IO: {
				    	required:"Debe Ingresar fecha de ingreso"
				    },
				    fecha_doc: {
				    	required:"Debe Ingresar fecha del documento"
				    },
				    list1: {
				    	required:"Debe Ingresar Responsable del documento"
				    }
	            }
			  });
		
		
		if(formulario.valid()) 
		 {
			
			 
			    SubmitFormularioFile(action, formulario);
			
			//SubmitFormulario(action, formulario);
	 	   
		    
		 }
	
}

function CargadoPaginaInicial(){
	
$("[name='form_regDoc']" ).addClass('form-horizontal');
	
}
//<!--------- Script para habilitar y deshabilitar los File-->
function cambiaDoc(file,chk){
  if(chk.checked==false){
    file.disabled=true;
  }
  if(chk.checked==true){
    file.disabled=false;
  }
}
  
  
  
  function move(name1,name2) {
	  
	  
	  return !$("[name='"+name1+"'] option:selected").remove().appendTo("[name='"+name2+"']");  
	 
	
  }

  function AgregarAnt(){
	  	  
	  if($("[name='idDocAnt']").val()!=null && $("[name='idDocAnt']").val()!=""){
	  $("[name='listaRel']").append("<option value=" + $("[name='idDocAnt']").val() + ">" + $("[name='tipoDocAnt']").val() + "-" + $("[name='codDocAnt']").val() + "</option>");
	  $("[name='idDocAnt']").val("");
	  $("[name='tipoDocAnt']").val("");
	  $("[name='codDocAnt']").val("");
	  }else
	  {
		  alert('Seleccione Ant.')		  
	  }
  	
  }
  
  function QuitarAnt(){
	  $("[name='listaRel'] option:selected").remove()
	  	  
  }
  
  function valLargoFile(arch)
  {
    archivo=arch.value; //reemplazar nombre del file
    largo=30; //reemplazar la longitud del campo
    while(archivo.indexOf('\\') !=-1){
    archivo=archivo.slice(archivo.indexOf('\\')+1);
    }
    if(archivo.length>largo){
    alert("nombre del archivo demasiado largo");
    return false;
    }else{
    return true;
    }

  }

</script>

  <jsp:include page="/comunes/pieContenido.jsp" />
</body>

</html>

