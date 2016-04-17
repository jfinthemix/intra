
<html>
<head>
<title>Registrar Clientes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../util/styla.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="../util/valid/gen_validatorv2.js" type="text/javascript"></script>


</head>

<body>
  <form action="ventasAction.do" method="POST" name="cliForm">
  <table width="750" border="0">
    <tr>
      <td><h3>Registrar Cliente de Ventas
          <input type="hidden" name="accion" value="RegClienteVta" />
        </h3></td>
    </tr>
    <tr>
      <td><table width="419" border="1" align="left">
          <tr>
            <td width="97" bgcolor="#ADD8E4">
<div align="right"><strong>Nombre*:</strong></div></td>
            <td width="306">
              <input type="text" name="nom_cli"> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>RUT:</strong></div></td>
            <td><input name="rut" type="text" size="8" maxlength="8" id="rut2">
              -
              <input type="text" size="1" name="codRut" maxlength="1" /> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Telefono:</strong></div></td>
            <td> <input type="text" name="fono_cli"> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Email:</strong></div></td>
            <td> <input type="text" name="email_cli"> </td>
          </tr>
          <tr>
            <td height="45" bgcolor="#ADD8E4"><div align="right"><strong>Giro:</strong></div></td>
            <td><input type="text" name="giro"></td>
          </tr>
          <tr>
            <td height="45" bgcolor="#ADD8E4"><div align="right"><strong>Direcci&oacute;n:</strong></div></td>
            <td> <input type="text" name="dir_cli"> </td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Personas de contacto:</strong></div></td>
            <td>
              <textarea name="contactos" cols="40" id="contactos"></textarea></td>
          </tr>
          <tr>
            <td bgcolor="#ADD8E4"><div align="right"><strong>Comentario:</strong></div></td>
            <td><textarea name="comentario" cols="40"></textarea></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><input type="submit" name="Submit" value="Guardar"></td>
    </tr>
  </table>

</form>
 <script language="JavaScript" type="text/javascript">
var frmvalidator  = new Validator("cliForm");
frmvalidator.addValidation("nom_cli","req","Debe indicar el  Nombre del Cliente");
frmvalidator.addValidation("nom_cli","maxlen=35","Nombre no puede superar los 35 caracteres");


frmvalidator.addValidation("rut","num");
frmvalidator.addValidation("rut","maxlen=8");

frmvalidator.addValidation("codRut","alnum");
frmvalidator.addValidation("codRut","maxlen=1","Sólo 1 caracter en el codigo del rut");

frmvalidator.addValidation("dir_cli","alnumspace");
frmvalidator.addValidation("dir_cli","maxlen=100", "Hasta 100 caracteres en la Dirección" );

frmvalidator.addValidation("fono_cli","alnumspace");
frmvalidator.addValidation("fono_cli","maxlen=15","Hasta 15 caracteres en el télefono" );

frmvalidator.addValidation("email_cli","email");
frmvalidator.addValidation("email_cli","maxlen=40","Hasta 40 caracteres en el email" );

frmvalidator.addValidation("giro","alnumspace");
frmvalidator.addValidation("giro","maxlen=50","Hasta 50 caracteres en el giro");

frmvalidator.addValidation("contactos","alnumspace");
frmvalidator.addValidation("contactos","maxlen=100","Hasta 100 caracteres en campo Contactos" );

frmvalidator.addValidation("comentario","alnumspace");
frmvalidator.addValidation("comentario","maxlen=200","Hasta 200 caracteres en el comentario" );

</script>


<hr>
  <div align="right"><a href="../ayuda/ventas.html" target="_blank">Ayuda</a>
  </div>

</body>
</html>
