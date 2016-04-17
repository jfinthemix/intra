<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@page import="java.util.List,proyecto_uoct.documentacion.VO.TipoDocVO,proyecto_uoct.usuario.VO.UsuarioVO"%>
<%@page import="java.util.Iterator,proyecto_uoct.documentacion.VO.BusDocsVO,proyecto_uoct.documentacion.VO.DocReservadoVO"%>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
List tiposDoc=(List)request.getAttribute("tiposDoc");
List usus=(List)request.getAttribute("usus");


%>
<html>
<head>
<title>Documentos Reservados</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- European format dd-mm-yyyy -->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->

</head>

<body>

<h2>Reservas de documentos</h2>
<div class="box boxpost">
	<h4>Buscar reserva</h4>
<form id="formBuscarReserva" name="form1" method="post" action="documentoAction.do" class="form-horizontal">
     <div class="form-group">   
          <input type="hidden" name="hacia" value="buscarReservasDeDocs"  />
          <input type="hidden" name="buscar" value="Buscar">
         	<label for="inputTipo" class="col-sm-4 control-label">Tipo de documento</label>
    								<div class="col-sm-8">
      								<select name="idTipoDoc" class="form-control" id="inputTipo">
    										<option value="0" disabled="" selected="">Seleccionar</option>
    										 <%if(tiposDoc!=null){
         Iterator it=tiposDoc.iterator();
         while(it.hasNext()){
           TipoDocVO t=(TipoDocVO)it.next();
           %>
                  <option value="<%=t.getIdTipo()%>"><%=t.getTipo() %></option>
                  <%}}%>
    									</select>
    								</div>
         
         </div>
         <div class="form-group">
         
        <div class="col-sm-10">
    								<label for="inputFecha"   class="col-sm-4 control-label">Fecha de reserva</label>
    								</div>
         	</div>
         <div class="form-group input-daterange">
         							<div class="col-sm-1">
    									
    								</div>
    								<div class="col-sm-1">
    									<label class="control-label">Desde:</label>
    								</div>
    								<div class="col-sm-4">
      								<input type="date" name="fecha_ini" class="form-control inputFecha" id="inputDesde">
      								 
    								</div>
    								<div class="col-sm-1">
      								<label class="control-label">Hasta:</label>
    								</div>
    								<div class="col-sm-4">
    									<input  name="fecha_fin" type="date" class="form-control inputFecha" id="inputHasta">
    									
    								</div>
  								</div>
         <div class="form-group">
    								<label for="inputUsuario" class="col-sm-3 control-label">Usuario</label>
    								<div class="col-sm-8">
      								<select name="idUsu" class="form-control" id="inputUsuario">
    										<option value="0" disabled="" selected="">Seleccionar</option>
    										 <%if(usus!=null){
          Iterator iu=usus.iterator();
          while(iu.hasNext()){
            UsuarioVO u=(UsuarioVO) iu.next();
            if(u.getNombreUsu2()!=null){
              %>
                  <option value="<%=u.getIdUsu() %>"><%=u.getNombreUsu()+" "+u.getNombreUsu2()+" "+u.getApellUsu() %></option>
                  <%} else{%>
                  <option value="<%=u.getIdUsu() %>"><%=u.getNombreUsu()+" "+u.getApellUsu()%></option>
                  <%}
              }
            }
          %>
    									</select>
    								</div>
  								</div>
         
         <div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a name="buscar" href="javascript:submitThisform()" class="botoVerde"><span class="glyphicons glyphicons-search"></span> Buscar</a>
      								</div>
  									</div>
    							</div>
  							</form>
  		</div>
        <script language="JavaScript" type="text/javascript">
			//	var cal1 = new calendar1(document.forms['form1'].elements['fecha_ini']);
			//	cal1.year_scroll = true;
			//	cal1.time_comp = false;
			//	var cal2 = new calendar1(document.forms['form1'].elements['fecha_fin']);
			//	cal2.year_scroll = true;
              //                  cal2.time_comp = false;
//-->
</script>  



     

 <%
 
 List docs=(List)request.getAttribute("reservas");
 if(docs!=null){

  %>      
<div id="divResultadoBusqueda" class="box clearfix encuentra">

<h4>Resultados de b�squeda</h4>
 <display:table class="table table-striped table-bordered table-hover tablesorter" requestURI="documentoAction.do" name="reservas" id="d" pagesize="15">
        <display:caption>Documentos Reservados</display:caption>
        <display:setProperty name="basic.empty.showtable" value="true"/>
        <display:setProperty name="basic.msg.empty_list_row" value="<tr class='alert alert-warning'><td colspan='0'>No se encontraron elementos para mostrar.</td></tr></tr>"/>
        <display:setProperty name="export.banner" value="<div class='exportlinks'>Exportar: {0}</div>"/>
        <display:setProperty name="paging.banner.placement" value="bottom"/>
        <display:setProperty name="paging.banner.no_items_found" value="<span class='pagebanner'>&nbsp;</span>"/>
        <display:setProperty name="paging.banner.one_item_found" value="<span class='pagebanner'>Se encontr&oacute; un {0}.</span>"/>
        <display:setProperty name="paging.banner.all_items_found" value="<span class='pagebanner'>{0} {1} encontrados.</span>"/>
        <display:setProperty name="paging.banner.some_items_found" value="<span class='pagebanner'>{0} {1} encontrados.Mostrando {2} a {3}.</span>"/>
        <display:setProperty name="paging.banner.full" value="<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Ant</a>]{0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.first" value="	<span class=\"pagelinks\">[Primero/Prev]
        {0}[<a href=\"{3}\">Sgte</a>/<a href=\"{4}\">Ultimo</a>]"></display:setProperty>
        <display:setProperty name="paging.banner.last" value="	<span class=\"pagelinks\">[<a href=\"{1}\">Primero</a>/<a href=\"{2}\">Prev</a>]{0}
        [Sgte/Ultimo]"></display:setProperty>
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

        <display:column title="C�digo del Doc." sortable="true" sortProperty="tipoDoc">
        <%=((DocReservadoVO)d).getTipoDoc() +" - "+((DocReservadoVO)d).getCodigo() %> </display:column>

        <display:column title="Usuario">
        <%if((((DocReservadoVO)d).getUsu().getNombreUsu2())!=null){%>
        <%=((DocReservadoVO)d).getUsu().getNombreUsu()+" "+((DocReservadoVO)d).getUsu().getNombreUsu2()+" "+ ((DocReservadoVO)d).getUsu().getApellUsu()%>
        <%}else{ %>
        <%=((DocReservadoVO)d).getUsu().getNombreUsu()+" "+((DocReservadoVO)d).getUsu().getApellUsu()%>
        <% }%>
        </display:column>

        <display:column title="Fecha de Reserva" property="fechaReg" sortable="true" sortProperty="fechaRegDate">
        </display:column>

        <display:column title="Utilizado" sortable="true" sortProperty="idDoc" >
        <%if(((DocReservadoVO)d).getIdDoc()!=null){
          out.print("<a href=\"documentoAction.do?hacia=detalleDoc&id_doc="+((DocReservadoVO)d).getIdDoc()+"\">Ver Doc.</a>");
        }
        else{
          out.print("--"); }%>
        </display:column>

      </display:table>
</div>
     <%} %>

<jsp:include page="/comunes/pieContenido.jsp" />

<script>
function submitThisform()
{
	
	var form= $('#formBuscarReserva');
	var action='documentacion/documentoAction.do';
		 
/*	form.validate({
		  rules: {
		    // simple rule, converted to {required:true}
		    idTipoDoc: {
		    	required:true
		    	
		    },
		   
		    fecha_ini:{
		    	required:true
		    	
		    },
		    fecha_fin:{
		    	required:true
		    	
		    }
		  
		    },
		    messages: {
		    	  idTipoDoc: {
				    	required:"Debe seleccionar el tipo de documento"
				    	
				    },
				   
				    fecha_ini:{
				    	required:"Indique la fecha inicial"
				    	
				    },
				    fecha_fin:{
				    	required:"Indique la fecha final" 
				    	
				    }
          }
		  });*/
	
	// if(form.valid()) 
	// {
	  SubmitFormulario(action, form);
	  $('#divResultadoBusqueda').removeClass('encuentra');
	 //}
	 
	 
		
}

</script>


</body>

</html>
