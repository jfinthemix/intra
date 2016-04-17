<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@page import="java.util.Iterator,java.util.List,proyecto_uoct.documentacion.VO.TipoDocVO"%>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
List entrantes=(List) request.getAttribute("entrantes");
List salientes=(List) request.getAttribute("salientes");
String mensaje=(String) request.getAttribute("mensaje");
%>
<html>
<head>
<title>Administración de Tipos de Documentos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

  <!-- validador -->
  <script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>

<%
String nomTipos="";
if(entrantes!=null|| salientes!=null){
  Iterator it=entrantes.iterator();
  while(it.hasNext()){
    TipoDocVO t=(TipoDocVO)it.next();
    if(nomTipos.equals("")){
      nomTipos="\""+t.getTipo()+"\"";
    }else{
      nomTipos=nomTipos+",\""+t.getTipo()+"\"";
    }
  }
  it=salientes.iterator();
  while(it.hasNext()){
    TipoDocVO t=(TipoDocVO)it.next();
    if(nomTipos.equals("")){
      nomTipos="\""+t.getTipo()+"\"";
    }else{
      nomTipos=nomTipos+",\""+t.getTipo()+"\"";
    }
  }

}
    %>
   


</head>

<body>
 <script type="text/javascript">

    function validaTD(){
      var codigo=$('#inputSiglas').val();  //form1.codigo.value;
      var codigos=new Array(<%=nomTipos%>);

      for(i=0;i<codigos.length;i++){
        if(codigo==codigos[i]){
          alert('Ya existe un tipo de dato con ese código');
          //form1.codigo.focus();
          return false;
        }
      }
      return true;
    }


</script>

<h2>Administrar tipos de documentos</h2>

<div class="box boxpost">

<h4>Agregar nuevo tipo:</h4>

<form id="formTipoDocs" class="form-horizontal">
<input type="hidden" name="hacia" value="ingresarTipoDoc" />
<div class="form-group">
    	<label for="inputSiglas" class="col-sm-4 control-label">Siglas</label>
    				<div class="col-sm-8">
      								<input name="codigo" maxlength="20" type="text" class="form-control" id="inputSiglas">
    								</div>
 </div>
 
 <div class="form-group">
    								<label for="inputSentido" class="col-sm-4 control-label">Sentido</label>
    								<div class="col-sm-8">
      								<select name="idSentido" class="form-control" id="inputSentido">
    										<option value="0" disabled="" selected="">Seleccionar</option>
    										<option value="1">Ingreso (Entrante)</option>
                						<option value="2">Despacho (Saliente)</option>
    									</select>
    								</div>
  								</div>
  <div class="form-group">
    								<label for="inputSentido" class="col-sm-4 control-label">¿Será usado en Iniciativas de Inversión?</label>
    								<div class="col-sm-8">
      								<select name="enIni" class="form-control" id="inputSentido">
    										<option disabled="" selected="">Seleccionar</option>
    										<option value="0">No</option>
    										<option value="1">Si</option>
    									</select>
    								</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a href="javascript:submitThisform('formTipoDocs')" class="botoVerde">Agregar</a>
      								</div>
  									</div>
    							</div>
  								
</form>
</div>

<%
if(entrantes!=null){
  Iterator ien=entrantes.iterator();
  request.setAttribute("entr",ien);

%> 
<div class="box">
				 			<h4>Tipos de Documentos Entrantes (Ingresos)</h4>
<display:table name="entr" requestURI="documentoAction.do" id="ents" class="table table-striped table-bordered table-hover">
        <display:caption>Tipos de Documentos Entrantes(Ingresos) </display:caption>
        <display:column title="Tipo de documento"><%=((TipoDocVO)ents).getTipo() %> </display:column> <display:column title="Sentido">
        <%if(((TipoDocVO)ents).getIdSentido().intValue()==1){%>
        <%="Entrante"%>
        <%}else{%>
        <%="Saliente"%>
        <%}%>
        </display:column> <display:column title="Estado">
        <%if(((TipoDocVO)ents).getIsActivo()){out.print("Habilitado");}else{out.print("Deshabilitado");} %>
        </display:column> <display:column title="Usado en Iniciativas de Inv.?">
        <%if(((TipoDocVO)ents).getEnIniciativas()){out.print("SI");}else{out.print("NO");}%>
        </display:column> <display:column title="Cambiar estado" media="html">
        <a class="botoGris botoMini" href="javascript:Llamadalink('cambiarEstadoTipoDoc','<%=((TipoDocVO)ents).getIdTipo()%>','<%if(((TipoDocVO)ents).getIsActivo()){out.print("Habilitado");}else{out.print("Deshabilitado");} %>')">
        <%      if(((TipoDocVO)ents).getIsActivo()){out.print("Deshabilitar");}else{out.print("Habilitar");} %>
        </a> </display:column>



        <display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
        <display:setProperty name="basic.empty.showtable" value="true"/>
		<display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
        <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
        <display:setProperty name="paging.banner.placement" value="bottom"/>
		<display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
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
        <%} %>
</div>

   <%
if(salientes!=null){
  Iterator isa=salientes.iterator();
  request.setAttribute("sali",isa);

%>
<div class="box">
				 			<h4>Tipos de Documentos Salientes (Despachos)</h4>
				 			
<display:table name="sali" requestURI="documentoAction.do" id="sals" class="table table-striped table-bordered table-hover">
        <display:caption>Tipos de Documentos Salientes(Despachos) </display:caption>
        <display:column title="Tipo de documento"><%=((TipoDocVO)sals).getTipo() %>
        </display:column> <display:column title="Sentido">
        <%if(((TipoDocVO)sals).getIdSentido().intValue()==1){%>
        <%="Entrante"%>
        <%}else{%>
        <%="Saliente"%>
        <%}%>
        </display:column> <display:column title="Estado">
        <%if(((TipoDocVO)sals).getIsActivo()){out.print("Habilitado");}else{out.print("Deshabilitado");} %>
        </display:column> <display:column title="Usado en Iniciativas de Inv.?">
        <%if(((TipoDocVO)sals).getEnIniciativas()){out.print("SI");}else{out.print("NO");}%>
        </display:column> <display:column title="Cambiar estado" media="html">
        <a class="botoGris botoMini" href="javascript:Llamadalink('cambiarEstadoTipoDoc','<%=((TipoDocVO)sals).getIdTipo()%>','<%if(((TipoDocVO)sals).getIsActivo()){out.print("Habilitado");}else{out.print("Deshabilitado");} %>')">
        <% if(((TipoDocVO)sals).getIsActivo()){out.print("Deshabilitar");}else{out.print("Habilitar");} %>
        </a> </display:column>




     		<display:setProperty name="basic.msg.empty_list" value="No se encontraron elementos para mostrar"/>
        <display:setProperty name="basic.empty.showtable" value="true"/>
		<display:setProperty name="basic.msg.empty_list_row" value="<tr class='empty'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
        <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
        <display:setProperty name="paging.banner.placement" value="bottom"/>
		<display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
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
      <%} %>
</div>

<script>
function submitThisform(formulario){
	
	if(validaTD()){
	var form= $('#'+formulario);
	var action='documentacion/documentoAction.do';
	
	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    codigo: {required:true, alfaconespacio:true},
		    
		    idSentido:{required:true},
		    enIni:{required:true}
		    	    
		    
		    },
		    messages: {
		    	  codigo: {required:'Debe indicar las siglas del nuevo tipo de documento', alfaconespacio:'El código debe estar compuesto de caracteres alfanuméricos'},
				    
				    idSentido:{required:'Debe indicar el sentido del tipo de documento'},
				    enIni:{required:'Debe indicar si el tipo de documento será usado en Iniciativas de Inversión o no'}          
			    }
		  });
	
	 if(form.valid()) 
	 {
	  SubmitFormulario(action, form);
	 }
	
	
	}
	
}


function Llamadalink(hacia,tipo,estado){

	//tipo=tipo.replace('#','');
	var link='documentacion/documentoAction.do?idTipoDoc='+tipo+'&hacia='+hacia+'&estado='+estado;
		LlamadaPagina(link);
	
}

</script>
</body>
</html>

