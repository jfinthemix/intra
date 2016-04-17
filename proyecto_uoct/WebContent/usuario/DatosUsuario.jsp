<%@page contentType="text/html; charset=iso-8859-1" language="java" import="proyecto_uoct.usuario.VO.UsuarioVO" errorPage=""%>
<%@page import="java.io.*,proyecto_uoct.common.util.UtilString,java.text.SimpleDateFormat,java.util.List,java.util.Iterator,proyecto_uoct.usuario.VO.InformeActividadesVO"%>
<%
  UsuarioVO usuario = (UsuarioVO) request.getAttribute("usuario");
  SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
  List informes = (List) request.getAttribute("informes");

  UtilString us=new UtilString();
  int cont = 0;
  File fotoFile = new File("foto.jpg");
  if(usuario.getFoto()!=null){
  try {
    DataOutputStream dostr = new DataOutputStream(new
    BufferedOutputStream(new FileOutputStream(
    fotoFile.getName())));
    dostr.write(usuario.getFoto());
    dostr.close();
  }
  catch (FileNotFoundException ex) {
    ex.printStackTrace();
  }}
%>
<html>
<head>
<title>Datos de Funcionario</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<meta http-equiv="Cache-Control" content="no-cache">

</head>
<body>
<h2>Administrar usuarios</h2>

<div class="box">
<h4>Datos de: <strong><%= usuario.getNombreUsu()%>
  <%
  if (usuario.getNombreUsu2() != null) {
    out.print(usuario.getNombreUsu2());
  }%>
  <%= usuario.getApellUsu() %>
</strong></h4>
<form class="form-horizontal">
<div class="form-group">
    			<label for="inputNombre" class="col-sm-4 control-label">Fotografía</label>
    			<div class="col-sm-8 formFoto">
    				<span class="noReg">Sin registro</span>
    				<% if(usuario.getFoto() != null) {
      				out.print("<img src=\"usuario/usuarioAction.do?hacia=getFotoUsu&idUsu="+usuario.getIdUsu()+"\">"); 
      				} %>
    			</div>
  			</div>
  			<div class="form-group">
    								<label for="inputNombre" class="col-sm-4 control-label">Nombre</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputNombre" value="<%= usuario.getNombreUsu() %> <%
      								if (usuario.getNombreUsu2() != null) { out.print(usuario.getNombreUsu2());   }%>" disabled="">
    								</div>
  								</div>
  			<div class="form-group">
    								<label for="inputApellidos" class="col-sm-4 control-label">Apellidos</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputApellidos" value="<%= usuario.getApellUsu() %> <%
      								if (usuario.getApellUsu2() != null) { out.print(usuario.getApellUsu2());   }%>" disabled="">
    								</div>
  								</div>
  			<div class="form-group">
    								<label for="inputTeléfono" class="col-sm-4 control-label">Teléfono</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputTelefono" value="<%
      											if (usuario.getTelefono().intValue() != 0) {
        												out.print(usuario.getTelefono());
      												}
      										else {out.print("teléfono no registrado");}%>" placeholder="Sin registro" disabled="">
    								</div>
  								</div>
  								
  									<div class="form-group">
    								<label for="inputCelular" class="col-sm-4 control-label">Celular</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputCelular" value="<%if (usuario.getCelular().intValue() != 0) {
        							out.print(usuario.getCelular());}else {out.print("celular no registrado");}%>" placeholder="Sin registro" disabled="">
    								</div>
  								</div>
  							<div class="form-group">
    								<label for="inputEmail" class="col-sm-4 control-label">E-mail</label>
    								<div class="col-sm-8">
      								<input type="email" class="form-control" id="inputEmail" value="<%if (usuario.getEmail() != null) {out.print(usuario.getEmail());
      								}else {out.print("email no registrado");}%>" disabled="">
    								</div>
  								</div>
  							<div class="form-group">
    								<label for="inputDireccion" class="col-sm-4 control-label">Dirección</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputDireccion" value="<%if (usuario.getDir() != null) {
       							 out.print(usuario.getDir());}else {out.print("dirección no registrada");
      								}%>" placeholder="Sin registro" disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputCumple" class="col-sm-4 control-label">Cumpleaños</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control inputFecha" id="inputCumple" value="<%
      								if (usuario.getCumpleanos() != null) {String c = us.formatoFecha(sdf.format(usuario.getCumpleanos()));
        							out.print(c);}else {out.print("cumpleaños no registrado");}%> " disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputArea" class="col-sm-4 control-label">Área de trabajo</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputCumple" value="<%= usuario.getArea() %> " disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputAnexo" class="col-sm-4 control-label">Anexo telefónico</label>
    								<div class="col-sm-8">
      								<input type="text" class="form-control" id="inputAnexo" value="<%if (usuario.getAnexo() != null) {
        							out.print(usuario.getAnexo());}else {out.print("Anexo no registrado");}%>" disabled="">
    								</div>
  								</div>
  								<div class="form-group">
    								<label for="inputCV" class="col-sm-4 control-label">Curriculum</label>
    								<div class="col-sm-8">
      								<%if (usuario.getIsCurric()){ %> <a href="usuario/usuarioAction.do?hacia=descargarCurriculoUsu&idUsu=<%=usuario.getIdUsu()%>">Descargar</a>
            						<% }else{out.print("&nbsp;");}%> 
    								</div>
  								</div>
  				</form>
  		</div>


	<jsp:include page="/comunes/pieContenido.jsp" />
</body>
</html>
