<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,proyecto_uoct.documentacion.VO.DocumentoVO,java.util.List, java.util.Iterator,proyecto_uoct.usuario.VO.UsuarioVO, proyecto_uoct.documentacion.VO.DocumentodeListaVO" errorPage="" %>
<%@page import="java.text.SimpleDateFormat,proyecto_uoct.documentacion.VO.ArchivoDocVO" %>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
DocumentoVO detDoc= (DocumentoVO) request.getAttribute("detDoc");
Integer ses_idtipousu= (Integer) request.getAttribute("ses_idtipousu");
%>
<html>
<head>
<title>Detalle Documento</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">
</head>

<body>
	<h2>Buscar documento</h2>
						
						<div class="box">
							<h4>Datos del documento:</h4>
				 			<form class="form-horizontal">
  								<div class="form-group">
    								<label for="inputCodigo" class="col-sm-4 control-label">Código</label>
    								<div class="col-sm-4 guionpost">
      								<input type="text" class="form-control" id="inputTipo" value="<%=detDoc.getTipoDoc() %>" disabled="">
    								</div>
    								<div class="col-sm-4">
      								<input type="text" class="form-control" id="inputCodigo" value="<%=detDoc.getCodDoc() %>" disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputRemitente" class="col-sm-4 control-label">Cliente</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputRemitente" value="<%=detDoc.getIdCli()%><%= detDoc.getNomCli()%> <%= detDoc.getApeCli()%>" disabled="">
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputInstitu" class="col-sm-4 control-label">Institución del Cliente</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputInstitu" value="<%=detDoc.getIdEntidad() %><%= detDoc.getEntidad()%>" disabled="">
    								</div>
    							</div>
  								<div class="form-group">
    								<label for="textareaMat" class="col-sm-4 control-label">Mat.</label>
    								<div class="col-sm-8">
      								<textarea rows="5" class="form-control" id="textareaMat" disabled=""><%=detDoc.getMateriaDoc() %></textarea>
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputIngreso" class="col-sm-4 control-label">Ingreso o egreso</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control inputFecha" id="inputIngreso" value="<%= sdf.format(detDoc.getFechaio()) %>" disabled="">
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputFechadoc" class="col-sm-4 control-label">Fecha de Documento</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control inputFecha" id="inputFechadoc" value="<%=sdf.format(detDoc.getFechaDoc()) %>" disabled="">
    								</div>
    							</div>
  								<div class="form-group">
    								<label for="inputAnt2" class="col-sm-4 control-label">Ant.</label>
    								<div class="col-sm-2 guionpost">
    								
    								 <%List docs= detDoc.getDocsRelacionados();
       								if(docs.size()!=0){
       									Iterator ii=docs.iterator();
       									while (ii.hasNext()){
         								DocumentodeListaVO doc= (DocumentodeListaVO) ii.next();
         								out.println ("<a href=\"documentoAction.do?hacia=detalleDoc&id_doc="+doc.getIdDoc()+"\">"+doc.getTipoDoc()+"-"+doc.getCodDoc()+"</a><br>");
       									}
      								}
        							%>	
      								</div>
    								
    							</div>
    							
    							<div class="form-group">
    								<label for="inputAnt2" class="col-sm-4 control-label">Respuesta</label>
    								<div class="col-sm-2 guionpost">
    								
    								 <%
              List docsPos= detDoc.getDocsPosteriores();
              if(docsPos.size()!=0){
                Iterator iii=docsPos.iterator();
                while (iii.hasNext()){
                  DocumentodeListaVO doc= (DocumentodeListaVO) iii.next();
                  out.println ("<a href=\"documentoAction.do?hacia=detalleDoc&id_doc="+doc.getIdDoc()+"\">"+doc.getTipoDoc()+"-"+doc.getCodDoc()+"</a><br>");
                }
              }
              %>
      								</div>
    								
    							</div>
    							<div class="form-group">
    								<label for="inputResponsable" class="col-sm-4 control-label">Responsable</label>
    								<div class="col-sm-8">
    									<select multiple="" id="grupoB" class="form-control" size="4" disabled="">
    									
    									<%
       List resps=detDoc.getResponsableDoc();
       if(resps!=null){
         Iterator i=resps.iterator();
         while (i.hasNext()){
           UsuarioVO unresp= (UsuarioVO) i.next();
           if(unresp.getNombreUsu2()!=null){
             out.println("<option value=\""+unresp.getIdUsu()+"\">"+unresp.getNombreUsu()+" "+ unresp.getNombreUsu2()+" "+unresp.getApellUsu()+"</option>");
           }else{
             out.println("<option value=\""+unresp.getIdUsu()+"\">"+unresp.getNombreUsu()+" "+unresp.getApellUsu()+"</option>");
           }
         }
       }
        %>
    										
    									</select>
    								</div>
    							</div>
    							<!-- <div class="form-group">
    								<label class="col-sm-4 control-label">Archivos</label>
    								<div class="col-sm-8">
    									<table class="table table-striped table-bordered table-hover">
      									<tbody>
        										<tr>
          										<td>documento.doc</td>
          									</tr>
          									<tr>
          										<td>documento.doc</td>
          									</tr>
        										<tr>
          										<td>documento.doc</td>
          									</tr>
          								</tbody>
        								</table>
    								</div>
    							</div> -->
  							</form>
				 		</div>
						
				 		<div class="verMas">
							<a href="javascript:history.back()"><span class="glyphicons glyphicons-undo"></span> Volver</a>
							<a href="javascript:void(0)" class="pull-right"><span class="glyphicons glyphicons-circle-exclamation-mark"></span> Ayuda</a>
						</div>


</body>
</html>
