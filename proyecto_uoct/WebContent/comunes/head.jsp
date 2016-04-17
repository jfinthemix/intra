



	<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Intranet de la UOCT">
		<meta name="author" content="Unidad Operativa de Control de Tránsito">
		<link rel="icon" href="..recursos/css/favicon.ico">
		
		<title>Unidad Operativa de Control de Tránsito</title>
		
		<link href="<%=request.getContextPath()%>${helpPath}/recursos/css/grid.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>${helpPath}/recursos/css/glyphs.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>${helpPath}/recursos/css/style.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>${helpPath}/recursos/css/buttons.dataTables.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>${helpPath}/recursos/css/jquery.dataTables.min.css" rel="stylesheet">
		 
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/jquery-1.12.0.min.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/bootstrap.min.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/moment.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/truncate.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/bootstrap-datepicker.min.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/jquery.tablesorter.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/jquery.timepicker.min.js"></script>
		 <script src="<%=request.getContextPath()%>${helpPath}/recursos/js/CalendarPopup.js"></script>
		<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/uoct.js"></script>
		<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/jquery.validate.min.js"></script>
		<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/additional-methods.js"></script>
		
		<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/jquery.dataTables.min.js"></script>
		
<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/jszip.min.js"></script>
<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/pdfmake.min.js"></script>
<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/vfs_fonts.js"></script>
<script src="<%=request.getContextPath()%>${helpPath}/recursos/js/buttons.html5.min.js"></script>

		
		


<script type="text/javascript">





function SubmitFormulario(action, formulario){
	
  		
		    $.ajax({
		        type: "POST",
		        
		        url: "<%=request.getContextPath()%>${helpPath}"+"/"+action,
		        
		        data: formulario.serialize(),
		        dataType: "json",
		        dataType: "html",
		        
		       
		        success: function (r) {
		       
		        	var doc = (new DOMParser()).parseFromString(r,"text/html");
		        	var htmlContent=doc.body.outerHTML;
		           
		            $('#divContenido').empty(); 
		        	$('#divContenido').append(htmlContent);
		        	$('html,body').scrollTop(0);
		        	CargadoPaginaInicial();
		
		          }
		        ,
		        error:
		            function (XmlHttpError, error, description) {
		               
		                alert(XmlHttpError.responseText);
		            },
		        async: true
		    });
		    
}

function SubmitFormularioFile(action, formulario)
{
	
	

	    var formData = new FormData(formulario[0]);

	    $.ajax({
	    	url: "<%=request.getContextPath()%>${helpPath}"+"/"+action,
	        type: 'POST',
	        data: formData,
	        async: false,
	        success: function (r) {
	        	var doc = (new DOMParser()).parseFromString(r,"text/html");
	        	var htmlContent=doc.body.outerHTML;
	           
	            $('#divContenido').empty(); 
	        	$('#divContenido').append(htmlContent);
	        	$('html,body').scrollTop(0);
	        	CargadoPaginaInicial();
	        },
	        
	        error:
	            function (XmlHttpError, error, description) {
	               
	                alert(XmlHttpError.responseText);
	            },
	        cache: false,
	        contentType: false,
	        processData: false
	    });

	    return false;
		
	
	
}

function LlamadaPagina(link){
	
  		
	var previous=$('#hidCurrentPage').val(); 
	$('#hidPreviousPage').val(previous);
	$('#hidCurrentPage').val(link);
		    $.ajax({
		        type: "GET",
		      
		        url: "<%=request.getContextPath()%>${helpPath}"+"/"+link,
		
		
		        dataType: "json",
		        dataType: "html",
		     
		        success: function (r) {
		       
		        	var doc = (new DOMParser()).parseFromString(r,"text/html");
		        	var htmlContent=doc.body.outerHTML;
		          
		            $('#divContenido').empty(); 
		        	$('#divContenido').append(htmlContent);
		        	CargadoPaginaInicial();
		
		          }
		        ,
		        error:
		            function (XmlHttpError, error, description) {
		                var err = eval("(" + XmlHttpError.responseText + ")");
		                alert(err.Message);
		            },
		        async: true
		    });
		  
}


var otra = null;
function popUp(href, target, features) {
	otra = window.open(href, target, features);
	otra.window.focus();
	otra.moveTo(0,0);
}




</script>


<script>
function volver()
{
	var previa=$('#hidPreviousPage').val();
	LlamadaPagina(previa);
}

function pasaEntExt(nomEntExt, idEntExt){
    $('#txtNomEntidadExt').val(nomEntExt);
    $('#hididEntExt').val(idEntExt);
    otra.window.close();
  }
  
  
function pasaCli(nomCli, idCli){
	$("[name='nomCli']").val(nomCli);
	$("[name='idCli']").val(idCli);
    otra.window.close();
  }
  
function pasaDoc(idDoc,codDoc,tipoDoc){
	$("[name='idDocAnt']").val(idDoc);
	$("[name='codDocAnt']").val(codDoc);
	$("[name='tipoDocAnt']").val(tipoDoc);
	
    otra.window.close();
  }

</script>

