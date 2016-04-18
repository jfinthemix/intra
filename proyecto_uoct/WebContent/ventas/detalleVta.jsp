<%@ page import="proyecto_uoct.common.util.UtilVenta,proyecto_uoct.ventas.VO.*,java.text.SimpleDateFormat,java.util.List,java.util.Iterator,java.lang.Float,java.lang.Math" %>

<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
VtaVO venta=(VtaVO)request.getAttribute("venta");
Float uf=(Float)request.getAttribute("uf");
Integer total=new Integer(0);
String mensaje=(String)request.getAttribute("mensaje");
Integer editable= (Integer)request.getAttribute("editable");
UtilVenta util=new UtilVenta();
%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Intranet de la UOCT">
		<meta name="author" content="Unidad Operativa de Control de Tránsito">
		<link rel="icon" href="img/favicon.ico">
		
		<title>Unidad Operativa de Control de Tránsito</title>
		
		<link href="css/grid.css" rel="stylesheet">
		<link href="css/glyphs.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/datepicker.css" rel="stylesheet">
		
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	
	<body>
		
		
		<div class="main">
			<div class="container">
				<div class="row clearfix">
				
					
				
					<div class="col-sm-6 desarrollo">
					
						<h2>Venta: <%=venta.getCodVenta() %></h2>
						
						 <%if (mensaje!=null){out.print("<h3><font color=\"red\"><div align=\"center\"><strong>"+mensaje+"</strong></div></font></h3>");} %>
						<div class="box boxpost">
				 			<h4>Datos de la venta</h4>
				 			<form class="form-horizontal">
				 				<div class="form-group">
    								<label for="selectEstado" class="col-sm-4 control-label">Estado</label>
    								<div class="col-sm-8">
    								<input type="text" class="form-control" id="estado" value="<%=venta.getEstado() %>" disabled>
    								</div>
    							</div>
    							<div class="form-group">
    								<label for="inputCliente" class="col-sm-4 control-label">Cliente</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputCliente" value="<%=venta.getCliente().getNomCli() %>" disabled>
    								</div>
    							</div>
				 				<div class="form-group">
    								<label for="inputFecha" class="col-sm-4 control-label">Fecha de inicio</label>
    								<div class="col-sm-8">
    									<input type="text" class="form-control inputFecha" id="inputFecha" value="<%=sdf.format(venta.getFechaRecepcion()) %>" disabled>
    								</div>
    							</div>
  								<div class="form-group">
    								<label class="col-sm-4 control-label">Fecha de entrega de la cotización</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"> <% if(venta.getFechaCotizacion()!=null){out.print(sdf.format(venta.getFechaCotizacion()));}else{out.print("Fecha no registrada");} %></p>
      							</div>
    							</div>
    							<div class="form-group">
    								<label class="col-sm-4 control-label">Fecha de Pago</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><% if(venta.getFechaPago()!=null){ out.print(sdf.format(venta.getFechaPago()));}else{out.print("Fecha no registrada");} %></p>
      							</div>
    							</div>
    							<div class="form-group">
    								<label class="col-sm-4 control-label">Fecha de Entrega de la Información</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><% if(venta.getFechaEntrega()!=null){ out.print(sdf.format(venta.getFechaEntrega()));}else{out.print("Fecha no registrada");} %></p>
      							</div>
    							</div>
    							<div class="form-group">
    								<label class="col-sm-4 control-label">Fecha Finalización del proceso</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><% if(venta.getFechaFin()!=null){ out.print(sdf.format(venta.getFechaFin()));}else{out.print("Fecha no registrada");} %></p>
      							</div>
    							</div>
    							<div class="form-group">
    								<label class="col-sm-4 control-label">Código de la Factura</label>
    								<div class="col-sm-8">
      								<p class="form-control-static"><% if(venta.getCodFact()!=null){ out.print(venta.getCodFact());}else{out.print("Código aun no registrado");} %></p>
      							</div>
    							</div>
  								<div class="boxOpciones">
    								<div class="form-group">
    									<div class="col-sm-12">
    										<a href="javascript:void(0)" class="botoVerde">Editar Venta</a>
      								</div>
  									</div>
    							</div>
  							</form>
						</div>
						
						
						
 <% if(venta.getDetVenta()!=null){
            Iterator idet=venta.getDetVenta().iterator();
            Float precioItem=new Float("0");
            int precioItemI=0;

              %>						
						
						
						
						
						<div class="box">
				 			<h4>Información vendida</h4>
				 			<table class="table table-bordered table-hover">
      						<thead>
        							<tr>
          							<th>Cantidad</th>
          							<th>Tipo información</th>
          							<th>Descripción</th>
          							<th align="right">Precio unitario ($)</th>
          							<th align="right">Precio total ($)</th>
          						</tr>
      						</thead>
      						
      						<%
      						
      						            while(idet.hasNext()){
              InfoVtaVO inf=(InfoVtaVO) idet.next();
              precioItem=new Float(inf.getPrecio().floatValue()*uf.floatValue());
              int precioItemRedon=Math.round(precioItem.floatValue());
              precioItemI= precioItemRedon* inf.getCantidad().intValue();
              total=new Integer(total.intValue() + precioItemI);
              %>
      						<tbody>
        							<tr>
          							<td><%=inf.getCantidad()%></td>
          							<td><%=inf.getTipoInfo() %></td>
          							<td><%if(inf.getDescripcion()!=null){
            out.print(inf.getDescripcion());}
            else{out.print("&nbsp;");}
            %></td>
          							<td align="right">$<%=util.formateaPrecioPesos((new Integer(precioItemRedon)).toString()) %></td>
          							<td align="right">$<%=util.formateaPrecioPesos((new Integer(precioItemI)).toString()) %></td>
          						</tr>
          						
          					   <%}
        
        %>	
          						
          						<tr>
          							<td><strong>UF=$<%=uf.toString().replace('.',',') %></strong></td>
          							<td colspan="3" align="right"><strong>SubTotal (sin IVA):</strong></td>
          							<td align="right">$<%=util.formateaPrecioPesos(total.toString()) %></td>
          						</tr>
          						<tr>
          							<td colspan="4" align="right"><strong>IVA:</strong></td>
          							<td align="right">$<%
            Float ivaF=new Float(total.floatValue() * 0.19);
            int iva=Math.round(ivaF.floatValue());
            String ivaS=new Integer(iva).toString().replace('.',',');
            out.print(util.formateaPrecioPesos(ivaS));
             %></td>
          						</tr>
          						<tr>
          							<td colspan="4" align="right"><strong>Total ($ con IVA):</strong></td>
          							<td align="right">$<%
            Integer tot= new Integer((int)Math.round(total.floatValue()*1.19));
            out.print(util.formateaPrecioPesos(tot.toString())); %></td>
          						</tr>
        						</tbody>
        					</table>
        					<br />
        					<table class="table table-bordered table-hover">
        						<tbody>
        							<tr>
          							<td class="col-sm-3">Comentario</td>
          							<td><%if(venta.getComentario()!=null){
          out.print(venta.getComentario());
        }else{
        out.print("&nbsp;");
        }
          %></td>
          						</tr>
          					</tbody>
        					</table>
    					</div>
				 			
				 		 <%


      if(editable.intValue()==1 && venta.getIdEstado().intValue()!=5 && venta.getIdEstado().intValue()!=6){%>
          
          <a href="javascript:void(0)" onclick="javascript:LlamadaPagina('ventas/ventasAction.do?accion=editarVenta&idVenta=<%=venta.getIdVenta()%>');" class="botoVerde busca"><span class="glyphicons glyphicons-search"></span> Editar Venta</a>
          <% }
			}          
          %>
				 		
					
					</div>
			
					
			
				</div><!-- /row -->
			
      		
      	</div><!-- /container -->
		
		</div><!-- /main -->
	

      


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/bootstrap-datepicker.es.min.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/truncate.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/uoct.js"></script>
  </body>
</html>
