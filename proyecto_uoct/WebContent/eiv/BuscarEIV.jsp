<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.List,java.util.Iterator, proyecto_uoct.common.VO.IdStrVO,proyecto_uoct.usuario.VO.UsuarioVO,proyecto_uoct.EIV.VO.EIVdeListaVO" errorPage="" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="display" uri="/displaytag_12"%>

<%
List listaingenieros= (List) request.getAttribute("listaIngenieros");
List listaestados= (List) request.getAttribute("listaEstados");
List listaeiv=(List) request.getAttribute("listaEIV");
List comunas=(List)request.getAttribute("comunas");
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>
<html>
<head>
<title>Buscar EIV</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">

  <!-- validador -->
<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>
  <!-- calendario popup-->
<script language="JavaScript" src="calendar1.js" type="text/javascript"></script><!-- Date only with year scrolling -->

</head>

<body>
<table width="750" border="0">
  <tr>
    <td><h3 align="center">Buscar EISTU</h3></td>
  </tr>
  <tr>
    <td><div align="center"></div></td>
  </tr>
  <form action="eivAction.do" name="formBusEIV" method="POST">
    <input type="hidden" name="hacia" value="buscarEIV" />
    <tr>
      <td><div align="center">
          <table width="500" border="1">
            <tr>
              <td width="168" bgcolor="#ADD8E4">
<div align="right"><strong>Por
                  Codigo del EISTU</strong></div></td>
              <td width="316">EISTU - <input type="text" name="ideiv" size="5" maxlength="5"></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Palabra Clave</strong></div></td>
              <td><input name="palClave" type="text" id="palClave" maxlength="50"></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Por Fecha de Vencimiento</strong></div></td>
              <td><table width="196" border="0">
                  <tr>
                    <td width="59" bgcolor="#F7FBC4">Entre el</td>
                    <td width="116"><input type="text" name="fechaVencimiento" size=8 readonly="readonly">
                      <a href="javascript:cal1.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a></td>
                  </tr>
                  <tr>
                    <td bgcolor="#F7FBC4">y el</td>
                    <td><input type="text" name="fechaVencimiento_b" size=8 readonly="readonly">
                      <a href="javascript:cal2.popup();"><img src="img/cal.gif" width="16" height="16" border="0" alt="Seleccionar fecha"></a></td>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <td width="168" bgcolor="#ADD8E4">
<div align="right"><strong>Por Estado</strong></div></td>
              <td><select name="estado">
                  <option value="">&nbsp;</option>
                  <%
        Iterator i =listaestados.iterator();
         while ( i.hasNext()){
           IdStrVO estado= (IdStrVO) i.next();
           out.println("<option value=\""+estado.getId()+"\">"+ estado.getStr()+"</option>" );
         }
         %>
                </select></td>
            </tr>


            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Por Estado en SEREMITT</strong></div></td>
              <td>
                <select name="estadoSeremitt">
                <option value="0"></option>
                <option value="1">Aprobado</option>
                <option value="2">Rechazado</option>

                </select>
              </td>
            </tr>

            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Por Ingeniero encargado</strong></div></td>
              <td><select name="idIngeniero">
                  <option value="">&nbsp;</option>
                  <%

        Iterator ii =listaingenieros.iterator();
         while ( ii.hasNext()){
           UsuarioVO ing= (UsuarioVO) ii.next();
           if(ing.getNombreUsu2()!=null){
             out.println("<option value=\""+ing.getIdUsu()+"\">"+ ing.getNombreUsu()+" "+ing.getNombreUsu2()+" "+ing.getApellUsu()+"</option>" );
           }else{
             out.println("<option value=\""+ing.getIdUsu()+"\">"+ ing.getNombreUsu()+" "+ing.getApellUsu()+"</option>" );
           }
         }


         %>
                </select></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Por Comuna</strong></div></td>
              <td><select name="idComuna">
                  <option value="">&nbsp;</option>
                  <% if(comunas!=null){
            Iterator ic=comunas.iterator();
            while(ic.hasNext()){
              IdStrVO com=(IdStrVO) ic.next();
              %>
                  <option value="<%=com.getId()%>"><%=com.getStr() %></option>
                  <%
           }
         }
         %>
                </select></td>
            </tr>
            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Por Red Involucrada</strong></div></td>
              <td><input type="text" name="red" maxlength="3" size="5" /></td>
            </tr>

            <tr>
              <td bgcolor="#ADD8E4">
<div align="right"><strong>Por Consultor</strong></div></td>
              <td><input type="text" name="consultor" maxlength="50" size="30" /></td>
            </tr>
          </table>
        </div></td>
    </tr>
    <tr>
      <td><div align="center">
          <input type="submit" name="Submit" value="Buscar">
          &nbsp;
          <input type="reset" name="Submit2" value="Anular">
        </div></td>
    </tr>
    <tr>
      <td><div align="center">
          <script language="JavaScript" type="text/javascript">
                var frmvalidator  = new Validator("formBusEIV");
                frmvalidator.addValidation("ideiv","maxlen=10","Codigo del EIV no puede superar los 10 caracteres");
                frmvalidator.addValidation("ideiv","numeric");

                </script>
          <script language="JavaScript" type="text/javascript">
				var cal1 = new calendar1(document.forms['formBusEIV'].elements['fechaVencimiento']);
				cal1.year_scroll = true;
				cal1.time_comp = false;
				var cal2 = new calendar1(document.forms['formBusEIV'].elements['fechaVencimiento_b']);
				cal2.year_scroll = true;
				cal2.time_comp = false;
            </script>
        </div>
        <%    if(listaeiv !=null){
  Iterator ieiv= listaeiv.iterator();
  request.setAttribute("eivses",ieiv);
  %>
        <display:table name="eivses" pagesize="15" id="eivs" requestURI="eivAction.do" class="its" >
        <display:column  title="EISTU" href="eivAction.do?hacia=detalleEIV" sortable="true" sortProperty="idEIV">
        <a href="eivAction.do?hacia=detalleEIV&id_eiv=<%=((EIVdeListaVO)eivs).getIdEIV()%>">EISTU-<%=((EIVdeListaVO)eivs).getIdEIV() %></a>
        </display:column>
        <display:column title="Nombre del EISTU"> <%=((EIVdeListaVO)eivs).getNomEiv() %>
        </display:column>
        <display:column title="Fecha de Vencimiento" sortable="true"><%=sdf.format(((EIVdeListaVO)eivs).getFechaVenc()) %>
        </display:column>
        <display:column title="Estado del EISTU" sortable="true"><%=((EIVdeListaVO)eivs).getEstado() %>
        </display:column>
        <display:column title="Ingeniero Encargado" sortable="true">
        <%
if(((EIVdeListaVO)eivs).getNom2Encarg()!=null){
out.print(((EIVdeListaVO)eivs).getNomEncarg()+" "+ ((EIVdeListaVO)eivs).getNom2Encarg()+" "+((EIVdeListaVO)eivs).getApeEncarg());
}else{
out.print(((EIVdeListaVO)eivs).getNomEncarg()+" "+((EIVdeListaVO)eivs).getApeEncarg());
}

%>
        </display:column>
        <display:column title="Consultor" sortable="true"><%=((EIVdeListaVO)eivs).getNomCons() %>
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
        <% }%>
      </td>
    </tr>
  </form>
</table>
<hr>
<div align="center"><img src="../util/img/volver.jpg" alt="Volver" onclick="history.back()"></div> <div align="right"><a href="../ayuda/eiv.html" target="_blank">Ayuda</a>
  </div>
</body>
</html>
