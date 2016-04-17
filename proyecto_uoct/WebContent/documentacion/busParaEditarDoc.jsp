<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.List,java.util.Iterator,proyecto_uoct.usuario.VO.UsuarioVO,proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.documentacion.VO.DocumentodeListaVO" errorPage=""%>
<%@ page import="java.text.SimpleDateFormat,proyecto_uoct.documentacion.VO.TipoDocVO" %>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

  List listausu = (List) request.getAttribute("listausu");
  List tiposentrantes = (List) request.getAttribute("tiposentrantes");
  List tipossalientes = (List) request.getAttribute("tipossalientes");
  List listadocs = (List) request.getAttribute("listadocs");
  Iterator iv = tiposentrantes.iterator();
  Iterator iiv = tipossalientes.iterator();

  Integer id_tipousu= null;
  if (request.getAttribute("id_tipousu")!= null){
  id_tipousu= (Integer)request.getAttribute("id_tipousu");
  }

%>
<html>
<head>
<title>Buscar documento</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- European format dd-mm-yyyy -->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->
<!-- American format mm/dd/yyyy -->
<script language="JavaScript" src="calendar2.js" type="text/javascript"></script><!-- Date only with year scrolling -->
<link href="../util/styla.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function habilitaEnIni(){
buscarDocs.enIni.disabled=false;
}
function deshabilitaEnIni(){
buscarDocs.enIni.disabled=true;
}
</script>

</head>
<body>
<script type="text/javascript">


function SeleccionaOpcion(opcion){
	
	$('#hidTipoBus').val(opcion);
	$('#divFormulario').css("display", "block");
	if(opcion==1){
		$('#divCodigo').css("display", "block");
					
	}else{
		
		$('#divCodigo').css("display", "none");
	}
	
}


</script>

<h2>Editar documentos</h2>
						
						<div class="box clearfix">
				 			<h4>Buscar documento:</h4>
				 			<div class="col-md-6 linktab">
				 				<a href="javascript:SeleccionaOpcion(1)" class="buscaCod">
				 					<span class="glyphicons glyphicons-search"></span><br>
				 					Por c�digo
				 				</a>
				 			</div>
				 			<div class="col-md-6 linktab">
				 				<a href="javascript:SeleccionaOpcion(2)" class="buscaSen">
				 					<span class="glyphicons glyphicons-search"></span><br>
				 					Por sentido
				 				</a>
				 			</div>
				 		</div>
				 		
<div class="box boxpost boxCod" style="display: block;">
							<h4>Datos del documento:</h4>
				 			<form class="form-horizontal">	
				 			 <input type="hidden" name="hacia" value="buscarParaEditarDoc"/>
				 			 <input type="hidden" id="hidTipoBus" name="tipoBus" value=""/>			 		
				 	<div id="divCodigo" class="form-group">
    								<label for="inputCodigo" class="col-sm-4 control-label">C�digo</label>
    								<div class="col-sm-4 guionpost">
      								<select name="id_tipoDoc" class="form-control" id="inputSentido">
    										<option value="0" selected></option>
                  <%
                    while (iv.hasNext()) {
                      TipoDocVO tipo = (TipoDocVO) iv.next();
                      if(tipo.getIsActivo()){
                      out.println("<option value=" + tipo.getIdTipo() + ">" + tipo.getTipo() + "</option>");
                    }}
                  %>
                  <%
                    while (iiv.hasNext()) {
                      TipoDocVO tipo = (TipoDocVO) iiv.next();
                      out.println("<option value=" + tipo.getIdTipo() + ">" + tipo.getTipo() + "</option>");
                    }
                  %>
    									</select>
    								</div>
    								<div class="col-sm-4">
      								<input  maxlength="20" name="codDoc" type="text" class="form-control" id="inputCodigo">
    								</div>
  								</div>	
  								<div class="form-group">
    								<label for="inputSentido2" class="col-sm-4 control-label">Sentido</label>
    								<div class="col-sm-8">
      								<label class="radio-inline">
  											<input type="radio"  name="id_sentido" id="sentido3" value="opcion1"> Entrante
										</label>
										<label class="radio-inline">
  											<input type="radio" name="id_sentido" id="sentido4" value="opcion2"> Saliente
										</label>
    								</div>
    							</div>
				 		<div class="form-group">
    								<label for="inputMateria2" class="col-sm-4 control-label">Materia</label>
    								<div class="col-sm-8">
      								<input name="materia" type="text" class="form-control" id="inputMateria2">
									</div>
    							</div>
    							
    							<div class="form-group input-daterange">
    								<label for="inputFecha2" class="col-sm-4 control-label">Fecha</label>
    								<div class="col-sm-1">
    									<label class="control-label">Desde:</label>
    								</div>
    								<div class="col-sm-3">
      								<input type="date"  name="fecha_ini" class="form-control inputFecha" id="inputDesde2">
    								</div>
    								<div class="col-sm-1">
      								<label class="control-label">Hasta:</label>
    								</div>
    								<div class="col-sm-3">
    									<input name="fecha_fin" type="date" class="form-control inputFecha" id="inputHasta2">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputPalabra2" class="col-sm-4 control-label">Palabra clave</label>
    								<div class="col-sm-8">
      								<input type="text" name="palClave"  class="form-control" id="inputPalabra2">
      								<span id="helpBlock"  class="help-block">Palabra que se buscar� en el nombre y apellido del cliente, mat. y resumen del doc.</span>
									</div>
    							</div>
    							<div class="form-group">
    								<label for="selectEncargado2" class="col-sm-4 control-label">Encargado</label>
    								<div class="col-sm-8">
      								<select class="form-control" id="selectEncargado2">
      									 <option selected value="0">nombre del usuario</option>
                  <%
        Iterator ius = listausu.iterator();
        while (ius.hasNext()) {
          UsuarioVO usu = (UsuarioVO) ius.next();
          if(usu.getNombreUsu2()!=null){
            out.println("<option value=" + usu.getIdUsu() + ">" + usu.getNombreUsu() + " " + usu.getNombreUsu2() + " " + usu.getApellUsu() + "</option>");
          }else{
            out.println("<option value=" + usu.getIdUsu() + ">" + usu.getNombreUsu() + " " + usu.getApellUsu() + "</option>");
          }
        }
      %>
      								</select>
    								</div>
    							</div>
    							
    							<div class="form-group">
    								<div class="col-sm-8 col-sm-offset-4">
    									<div class="checkbox">
  											<label>
    											<input name="enIni" type="checkbox" value="true">  Incluir Documentos de Iniciativas de Inversi�n
    										</label>
										</div>
									</div>
  								</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
      									<a href="javascript:void(0)" class="botoVerde busca"><span class="glyphicons glyphicons-search"></span> Buscar</a>
      								</div>
  									</div>
    							</div>
  							</form>
				 		</div>
				 		
				 		
				 		<%if (listadocs != null) {
   Iterator idocs = listadocs.iterator();
   request.setAttribute("docses",idocs);
   %>
        <display:table class="box boxpost boxpostdoble" name="docses" pagesize="15" requestURI="documentoAction.do" id="docss">
        <display:caption>Documentos Encontrados </display:caption>
        <display:column title="Codigo(Editar)" sortable="true" href="documentoAction.do?hacia=aeditarDoc" paramId="id_doc" paramProperty="idDoc">
        <%=((DocumentodeListaVO)docss).getTipoDoc()+"-"+((DocumentodeListaVO)docss).getCodDoc()%> </display:column>

        <display:column title="Materia" property="materiaDoc" class="texto"></display:column>

        <display:column title="Fecha de Ingreso o Egreso" sortable="true" sortProperty="fechaio" maxLength="14"><%=sdf.format(((DocumentodeListaVO)docss).getFechaio())%> </display:column>

        <display:column title="Estado" sortable="true" sortProperty="idEstado">
        <% if (((DocumentodeListaVO)docss).getIdEstado()){
        out.println("Respondido");
      }else{
        out.println("Pendiente");
      }
      %>
        </display:column>

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
				 		
				 		
			
   </body>
</html>

