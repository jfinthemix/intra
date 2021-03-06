package proyecto_uoct.usuario.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import proyecto_uoct.common.LocalizadorServicios;
import proyecto_uoct.common.LocalizadorServiciosException;
import proyecto_uoct.common.VO.DatosSesVO;
import proyecto_uoct.usuario.VO.AnexoVO;
import proyecto_uoct.usuario.VO.CurriculoVO;
import proyecto_uoct.usuario.VO.InformeActividadesVO;
import proyecto_uoct.usuario.VO.UsuarioVO;
import proyecto_uoct.usuario.model.PerfilLocal;
import proyecto_uoct.usuario.model.Usuario;
import proyecto_uoct.usuario.model.UsuarioLocal;

public class UsuarioAction extends Action {
    @Override
    public ActionForward execute(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest servletRequest,
	    HttpServletResponse servletResponse) {

	HttpSession httpSession = servletRequest.getSession();
	DatosSesVO datoses;
	try {

	    datoses = (DatosSesVO) httpSession.getAttribute("Ses_Usu");
	    datoses.getId();
	} catch (Exception e) {
	    servletRequest.setAttribute("mensaje", "La sesi�n ha caducado");
	    return actionMapping.findForward("mensaje_fw");
	}

	String hacia = " ";
	UsuarioLocal usuarioLocal = null;
	if (servletRequest.getParameter("hacia") != null) {
	    hacia = servletRequest.getParameter("hacia");
	} else {
	    servletRequest.setAttribute("mensaje",
		    "Error al cargar la p�gina. Si est� subiendo un archivo, verifique que su tama�o no supera los 10 MB ");
	    return actionMapping.findForward("mensaje_fw");
	}

	// ----------------------------------
	if (hacia.compareTo("aagregarUsuario") == 0) {
	    return aagregarUsuario(actionMapping, servletRequest);
	}

	if (hacia.compareTo("nuevoUsuario") == 0) {
	    return ingresaUsuario(actionMapping, servletRequest);
	}

	if (hacia.compareTo("cambiarEstadoUsu") == 0) {
	    return cambiarEstadoUsu(actionMapping, servletRequest);
	}

	if (hacia.compareTo("aadminUsus") == 0) {
	    return aadminUsus(actionMapping, servletRequest);
	}

	if (hacia.compareTo("actualizarUsuario") == 0) {
	    return actualizarUsuario(actionMapping, servletRequest);
	}

	if (hacia.compareTo("editarDatosPersonales") == 0) {
	    return aeditarDatosPersonales(actionMapping, servletRequest, httpSession);
	}
	if (hacia.compareTo("aeditarUsuario") == 0) {
	    return aeditarUsuario(actionMapping, servletRequest);
	}

	if (hacia.equals("actualizarDatosPersonales")) {
	    return actualizarDatosPersonales(actionMapping, servletRequest);
	}
	if (hacia.equals("verDatosUsuario")) {
	    return verDatosUsuario(actionMapping, servletRequest, httpSession);
	}

	if (hacia.equals("acuadroCumpleanos")) {
	    return cuadroCumpleanos(actionMapping, servletRequest, httpSession);
	}

	if (hacia.equals("cambiarContrasena")) {
	    return cambiarContrasena(actionMapping, servletRequest, actionForm, httpSession, servletResponse);
	}
	if (hacia.equals("aReasignarContrasena")) {
	    return aReasignarContrasena(actionMapping, servletRequest);
	}

	if (hacia.equals("reasignarContrasena")) {
	    return reasignarContrasena(actionMapping, servletRequest);
	}
	// --------------------------
	// CURRICULO
	// --------------------------
	if (hacia.equals("aactualizarCurriculo")) {
	    return aactualizarCurriculo(actionMapping, servletRequest, httpSession);
	}

	if (hacia.equals("actualizarCurriculo")) {
	    return actualizarCurriculo(actionMapping, servletRequest, actionForm, httpSession);
	}

	if (hacia.equals("descargarCurriculo")) {
	    return descargarCurriculo(actionMapping, servletRequest, actionForm, httpSession, servletResponse);
	}

	if (hacia.equals("descargarCurriculoUsu")) {
	    return descargarCurriculoUsuario(actionMapping, servletRequest, actionForm, httpSession, servletResponse);
	}

	// -------------------------
	// iNFORMES DE ACTIVIDADES PERSONALES
	// -------------------------
	if (hacia.compareTo("informesActPers") == 0) {
	    return ainformesActPers(actionMapping, httpSession, servletRequest);
	}

	if (hacia.compareTo("registrarInforme") == 0) {
	    return registrarInforme(actionMapping, servletRequest, actionForm, httpSession);
	}

	if (hacia.compareTo("borrarInforme") == 0) {
	    return borrarInforme(actionMapping, servletRequest, actionForm, httpSession);
	}

	if (hacia.compareTo("descargarInforme") == 0) {
	    return descargarInforme(actionMapping, servletRequest, actionForm, httpSession, servletResponse);
	}

	// --------------------------
	// FOTOGRAF�A
	// ---------------------------------
	if (hacia.compareTo("acambiarFotografia") == 0) {
	    return actionMapping.findForward("cambiarFoto_fw");
	}
	if (hacia.compareTo("actualizarFoto") == 0) {
	    return actualizarFoto(actionMapping, servletRequest, actionForm, httpSession);
	}
	if (hacia.compareTo("getFotoUsu") == 0) {
	    return getFotoUsu(actionMapping, servletRequest, actionForm, httpSession, servletResponse);
	}

	// --------------------------
	// �REAS DE TRABAJO
	// ---------------------------------
	if (hacia.compareTo("aadminAreas") == 0) {
	    return aadminAreas(actionMapping, servletRequest, actionForm, httpSession);
	}
	if (hacia.compareTo("agregarArea") == 0) {
	    return agregarArea(actionMapping, servletRequest, actionForm, httpSession);
	}
	if (hacia.compareTo("eliminarArea") == 0) {
	    return eliminarArea(actionMapping, servletRequest, actionForm, httpSession, servletResponse);
	}

	// ------------------------------
	// ANEXOS
	// -----------------------------------
	if (hacia.compareTo("cuadroAnexos") == 0) {
	    return acuadroAnexos(actionMapping, servletRequest);
	}

	if (hacia.compareTo("aadminAnexos") == 0) {
	    return aadminAnexos(actionMapping, servletRequest);
	}

	if (hacia.compareTo("aeditarAnexo") == 0) {
	    return aeditarAnexo(actionMapping, servletRequest);
	}

	if (hacia.compareTo("actualizarAnexo") == 0) {
	    return actualizarAnexo(actionMapping, servletRequest);
	}

	if (hacia.compareTo("registraAnx") == 0) {
	    return registraAnexo(actionMapping, servletRequest);
	}
	if (hacia.compareTo("borrarAnexo") == 0) {
	    return borrarAnexo(actionMapping, servletRequest);
	}

	// ----------------------------------
	if (hacia.compareTo("listaUsuarios") == 0) {
	    Usuario usu = new Usuario();
	    try {
		usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
		// usu = LocalizadorServicios.getInstance().getUsuarioLocal();
	    } catch (LocalizadorServiciosException ex) {
		System.out.println("no se pudo llamar a EJB");
	    }
	    List listausu = null;
	    // listausu = usuarioLocal.getUsuariosActivos();
	    listausu = usu.getUsuariosActivos();
	    servletRequest.setAttribute("listausu", listausu);

	    return actionMapping.findForward("listausu_fw");
	}
	// ------------------------------------------
	if (hacia.compareTo("listaInformes") == 0) {
	    return actionMapping.findForward("informActdelPers_fw");
	}

	// --------------------------------------------

	if (hacia.compareTo("eliminarUsuario") == 0) {
	    Integer id_usu = new Integer(0);
	    if (servletRequest.getParameter("id_usu") != null) {
		id_usu = Integer.valueOf(servletRequest.getParameter("id_usu"));
		try {
		    usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
		} catch (LocalizadorServiciosException ex) {
		    System.out.println("no se pudo llamar a EJB");
		}
		usuarioLocal.eliminarUsuario(id_usu);

		List listausu = null;
		listausu = usuarioLocal.getListaUsuarios();
		servletRequest.setAttribute("listausu", listausu);
		return actionMapping.findForward("listausu_fw");

	    }

	}
	servletRequest.setAttribute("mensaje", "URL no valida");
	return actionMapping.findForward("mensaje_fw");
    }

    /**
     * reasignarContrasena
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward reasignarContrasena(ActionMapping actionMapping, HttpServletRequest servletRequest) {
	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    if (usuarioLocal.reasignarContrasena(Integer.valueOf(servletRequest.getParameter("id_usu")),
		    servletRequest.getParameter("nuevaContrasena"))) {
		servletRequest.setAttribute("mensaje", "La contrase�a ha sido actualizada");
	    } else {
		servletRequest.setAttribute("mensaje", "La contrase�a no pudo ser actualizada");
	    }
	    return actionMapping.findForward("mensaje_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "URL no valida");
	    return actionMapping.findForward("mensaje_fw");

	}
    }

    /**
     * aReasignarContrasena
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aReasignarContrasena(ActionMapping actionMapping, HttpServletRequest servletRequest) {
	try {
	    servletRequest.setAttribute("id_usu", servletRequest.getParameter("id_usu"));
	    servletRequest.setAttribute("nomUsu", servletRequest.getParameter("nomUsu"));
	    return actionMapping.findForward("reasignarContrasena_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "URL no valida");
	    return actionMapping.findForward("mensaje_fw");

	}
    }

    private ActionForward cambiarContrasena(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession, HttpServletResponse servletResponse) {

	try {

	    if (servletRequest.getParameter("nueva_c") != null && servletRequest.getParameter("vieja_c") != null
		    && servletRequest.getParameter("confirmacion") != null) {

		Integer id_usu = Integer.valueOf(servletRequest.getParameter("id_usu"));
		String nueva_c = servletRequest.getParameter("nueva_c");
		String vieja_c = servletRequest.getParameter("vieja_c");
		String confirma = servletRequest.getParameter("confirmacion");

		if (!nueva_c.equals(confirma)) {
		    servletRequest.setAttribute("mensaje", "las contrase�as no coinciden");
		    return actionMapping.findForward("mensaje_fw");
		}

		UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
		if (usuarioLocal.cambiarContrasena(id_usu, nueva_c, vieja_c)) {
		    servletRequest.setAttribute("mensaje", "la contrase�a fue actualizada");
		} else {
		    servletRequest.setAttribute("mensaje",
			    "la contrase�a no pudo ser actualizada.La contrase�a antigua no corresponde a la registrada");
		}
		return actionMapping.findForward("mensaje_fw");

	    } else {
		String id_usu = servletRequest.getParameter("id_usu");
		servletRequest.setAttribute("id_usu", id_usu);
		return actionMapping.findForward("pag_cambiarcontrasena_fw");
	    }
	}

	catch (Exception e) {
	    servletRequest.setAttribute("mensaje", "Error en el cambio de contrase�a");
	    return actionMapping.findForward("mensaje_fw");

	}

    }

    /**
     * eliminarArea
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @param servletResponse
     *            HttpServletResponse
     * @return ActionForward
     */
    private ActionForward eliminarArea(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession, HttpServletResponse servletResponse) {

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    Integer idArea = Integer.valueOf(servletRequest.getParameter("idArea"));

	    if (usuarioLocal.eliminarArea(idArea)) {
		servletRequest.setAttribute("mensaje", "el Area fue eliminada Exitosamente");
		return this.aadminAreas(actionMapping, servletRequest, actionForm, httpSession);
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo eliminar el �rea de trabajo");
	    return actionMapping.findForward("mensaje_fw");

	}

	servletRequest.setAttribute("mensaje", "No se pudo eliminar el �rea de trabajo");
	return actionMapping.findForward("mensaje_fw");

    }

    /**
     * agregarArea
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward agregarArea(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession) {

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    String nomArea = servletRequest.getParameter("nomArea");

	    if (usuarioLocal.agregarArea(nomArea)) {
		servletRequest.setAttribute("mensaje", "el Area fue agregada Exitosamente");
		return this.aadminAreas(actionMapping, servletRequest, actionForm, httpSession);
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo agregar el �rea de trabajo");
	    return actionMapping.findForward("mensaje_fw");

	}

	servletRequest.setAttribute("mensaje", "No se pudo agregar el �rea de trabajo");
	return actionMapping.findForward("mensaje_fw");

    }

    /**
     * aadminAreas
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward aadminAreas(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession) {

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    servletRequest.setAttribute("areas", usuarioLocal.getAreas());
	    return actionMapping.findForward("adminAreas_fw");
	} catch (Exception e) {
	    e.printStackTrace();

	}

	return null;
    }

    /**
     * aeditarUsuario
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aeditarUsuario(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	List areas = null;

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    PerfilLocal perfilLocal = LocalizadorServicios.getInstance().getPerfilLocal();
	    if (servletRequest.getParameter("id_usu") != null) {
		Integer id_usu = new Integer(servletRequest.getParameter("id_usu"));

		servletRequest.setAttribute("areas", usuarioLocal.getAreas());
		servletRequest.setAttribute("usuario", usuarioLocal.getDatosUsu(id_usu));
		servletRequest.setAttribute("perfiles", perfilLocal.getPerfiles());

	    }

	    return actionMapping.findForward("editausu_fw");

	} catch (LocalizadorServiciosException ex) {
	    ex.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo cargar la p�gina para Editar Usuario");
	    return actionMapping.findForward("mensaje_fw");

	}

    }

    /**
     * getFotoUsu
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward getFotoUsu(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession, HttpServletResponse response) {

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    Integer idUsu = Integer.valueOf(servletRequest.getParameter("idUsu"));

	    byte[] fotoB = usuarioLocal.getFotoUsu(idUsu);

	    if (fotoB == null || fotoB.length == 0) {
		DataInputStream d = new DataInputStream(
			new BufferedInputStream(this.getClass().getClassLoader().getResourceAsStream("noFoto.jpg")));
		d.readFully(fotoB);

	    }

	    ByteArrayOutputStream output = new ByteArrayOutputStream();

	    output.write(fotoB, 0, fotoB.length);

	    response.setContentType("image/jpeg ");
	    response.setHeader("content-disposition", "inline; fileName=\"foto.jpg\"");
	    response.setContentLength(output.size());

	    // Escribir el archivo en el response
	    OutputStream out = response.getOutputStream();
	    output.writeTo(out);
	    out.flush();
	    out.close();

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}

	return null;
    }

    /**
     * cuadroCumpleanos
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward cuadroCumpleanos(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    HttpSession httpSession) {

	try {

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    List usuarios = usuarioLocal.getListaUsuarios();

	    servletRequest.setAttribute("usuarios", usuarios);
	    return actionMapping.findForward("cumpleanos_fw");
	} catch (Exception ex) {
	    servletRequest.setAttribute("mensaje", "No se pudo cargar la p�gina de Cumplea�os");
	    return actionMapping.findForward("mensaje_fw");
	}

    }

    /**
     *
     *
     *
     *
     *
     * verDatosUsuario usa usuarioLocal.tienePermiso(idPerfil, idFuncionalidad)
     * , con el idFuncionalidad=8 para indicar el permiso de
     * "Descargar informes de actividades", por lo q en la base de datos debe
     * corresponder
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     *
     * verDatosUsuario
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward verDatosUsuario(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    HttpSession httpSession) {

	try {
	    Integer id_usu = Integer.valueOf(servletRequest.getParameter("id_usu"));

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    UsuarioVO usuario = usuarioLocal.getDatosUsuEdit(id_usu);
	    httpSession = servletRequest.getSession();
	    DatosSesVO datoses = (DatosSesVO) httpSession.getAttribute("Ses_Usu");
	    Integer idPerfil = datoses.getIdPerfil();

	    // Consulta si el perfil del usuario tiene la permiso para Descargar
	    // Informes del Personal de UOCT
	    Integer idFuncionalidad = new Integer(8);
	    List informes = new LinkedList();
	    if (usuarioLocal.tienePermiso(idPerfil, idFuncionalidad)) {
		informes = usuarioLocal.getInformes(id_usu);

	    }
	    servletRequest.setAttribute("informes", informes);
	    servletRequest.setAttribute("usuario", usuario);
	    return actionMapping.findForward("verdatosusu_fw");
	} catch (Exception ex) {
	    servletRequest.setAttribute("mensaje", "No se pudo cargar la p�gina de Datos de Usuario");
	    return actionMapping.findForward("mensaje_fw");
	}

    }

    /**
     * descargarInforme
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward descargarInforme(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession, HttpServletResponse response) {

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    Integer idInf = Integer.valueOf(servletRequest.getParameter("idInf"));

	    InformeActividadesVO infVO = usuarioLocal.getInforme(idInf);

	    ByteArrayOutputStream output = new ByteArrayOutputStream();
	    output.write(infVO.getInformeB(), 0, infVO.getInformeB().length);

	    response.setContentType("application/download");
	    response.setHeader("content-disposition", "attachment; fileName=\"" + infVO.getNomInfor() + "\"");
	    response.setContentLength(output.size());

	    // Escribir el archivo en el response
	    OutputStream out = response.getOutputStream();
	    output.writeTo(out);
	    out.flush();
	    out.close();

	} catch (Exception e) {
	    servletRequest.setAttribute("mensaje", "El Informe no pudo ser descargado");
	    return actionMapping.findForward("mensaje_fw");
	}

	return null;
    }

    /**
     * borrarInforme
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward borrarInforme(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession) {

	try {
	    Integer idInf = Integer.valueOf(servletRequest.getParameter("idInf"));

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    if (usuarioLocal.borrarInforme(idInf)) {
		servletRequest.setAttribute("mensaje", "El Informe fue eliminado");
		return this.ainformesActPers(actionMapping, httpSession, servletRequest);

	    }

	} catch (Exception e) {
	    servletRequest.setAttribute("mensaje", "El Informe no pudo ser Eliminado");
	    return actionMapping.findForward("mensaje_fw");

	}
	servletRequest.setAttribute("mensaje", "El Informe no pudo ser Eliminado");
	return actionMapping.findForward("mensaje_fw");

    }

    /**
     * actualizarFoto
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward actualizarFoto(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession) {

	try {

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    UsuarioFormBean usufb = (UsuarioFormBean) actionForm;
	    FormFile lafoto = usufb.getFoto();
	    byte[] foto = lafoto.getFileData();

	    DatosSesVO datosSes = (DatosSesVO) httpSession.getAttribute("Ses_Usu");
	    Integer idUsu = datosSes.getId();

	    if (usuarioLocal.actualizarFoto(foto, idUsu)) {
		servletRequest.setAttribute("mensaje", "La fotograf�a fue actualizada exitosamente");
		return actionMapping.findForward("mensaje_fw");

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo actualizar la fotograf�a");
	    return actionMapping.findForward("mensaje_fw");

	}

	servletRequest.setAttribute("mensaje", "No se pudo actualizar la fotograf�a");
	return actionMapping.findForward("mensaje_fw");

    }

    /**
     * registrarInforme
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            ServletRequest
     * @param httpSession
     *            HttpSession
     */
    private ActionForward registrarInforme(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession) {
	try {
	    /*
	     * Esto es para poner el informe en byte [] en el
	     * InformeActividadesVO UsuarioLocal usuarioLocal =
	     * LocalizadorServicios.getInstance(). getUsuarioLocal();
	     * 
	     * DatosSesVO datosSes = (DatosSesVO) httpSession.getAttribute(
	     * "Ses_Usu");
	     * 
	     * Integer idUsu = datosSes.getId();
	     * 
	     * UsuarioFormBean cfb = (UsuarioFormBean) actionForm; FormFile
	     * informe = cfb.getInforme();
	     * 
	     * InformeActividadesVO infoVO = new InformeActividadesVO();
	     * //infoVO.setFormFile(informe); byte[] inf =
	     * informe.getFileData(); infoVO.setInformeB(inf);
	     * infoVO.setIdUsu(idUsu);
	     * infoVO.setNomInfor(informe.getFileName());
	     * infoVO.setFechaInfor(new Date());
	     */

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    DatosSesVO datosSes = (DatosSesVO) httpSession.getAttribute("Ses_Usu");

	    Integer idUsu = datosSes.getId();

	    UsuarioFormBean cfb = (UsuarioFormBean) actionForm;
	    FormFile informe = cfb.getInforme();

	    /* Transformar el formfile a file */
	    File f = new File(informe.getFileName());
	    DataOutputStream dostr = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f)));
	    dostr.write(informe.getFileData());
	    dostr.close();

	    InformeActividadesVO infoVO = new InformeActividadesVO();
	    infoVO.setFormFile(informe);
	    infoVO.setIdUsu(idUsu);
	    infoVO.setNomInfor(informe.getFileName());
	    infoVO.setFechaInfor(new Date());
	    byte[] inf = informe.getFileData();
	    infoVO.setInformeB(inf);
	    infoVO.setInformeFile(f);

	    if (usuarioLocal.registraInforme(infoVO)) {
		servletRequest.setAttribute("mensaje", "El informe fue Ingresado exitosamente");
		return this.ainformesActPers(actionMapping, httpSession, servletRequest);

	    } else {
		servletRequest.setAttribute("mensaje", "No se pudo Cargar la pagina de Informes de Actividades");
		return actionMapping.findForward("mensaje_fw");

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo Cargar la pagina de Informes de Actividades");
	    return actionMapping.findForward("mensaje_fw");

	}

    }

    /**
     * ainformesActPers
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward ainformesActPers(ActionMapping actionMapping, HttpSession httpSession,
	    HttpServletRequest servletRequest) {
	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    DatosSesVO datosSes = (DatosSesVO) httpSession.getAttribute("Ses_Usu");

	    Integer idUsu = datosSes.getId();
	    List informes = new LinkedList();
	    informes = usuarioLocal.getInformes(idUsu);

	    servletRequest.setAttribute("informes", informes);
	    return actionMapping.findForward("informeact_fw");

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo Cargar la pagina de Informes de Actividades");
	    return actionMapping.findForward("mensaje_fw");

	}

    }

    /**
     * descargarCurriculo del usuario registrado en la sesi�n
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward descargarCurriculo(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession, HttpServletResponse response) {

	try {

	    DatosSesVO datosSes = (DatosSesVO) httpSession.getAttribute("Ses_Usu");
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    byte[] b = usuarioLocal.getCurriculo(datosSes.getId());

	    ByteArrayOutputStream output = new ByteArrayOutputStream();
	    output.write(b, 0, b.length);

	    response.setContentType("application/download");
	    response.setHeader("content-disposition", "attachment; fileName=\"curriculo.doc\"");
	    response.setContentLength(output.size());

	    // Escribir el archivo en el response
	    OutputStream out = response.getOutputStream();
	    output.writeTo(out);
	    out.flush();
	    out.close();

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo Descargar el curriculum");
	    return actionMapping.findForward("mensaje_fw");

	}
	return null;
    }

    /**
     * descargarCurriculo del usuario indicado como parametro <idUsu> en el
     * request.
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param actionForm
     *            ActionForm
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward descargarCurriculoUsuario(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession, HttpServletResponse response) {

	try {

	    Integer idUsu = Integer.valueOf(servletRequest.getParameter("idUsu"));
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    byte[] b = usuarioLocal.getCurriculo(idUsu);

	    ByteArrayOutputStream output = new ByteArrayOutputStream();
	    output.write(b, 0, b.length);

	    response.setContentType("application/download");
	    response.setHeader("content-disposition", "attachment; fileName=\"curriculo.doc\"");
	    response.setContentLength(output.size());

	    // Escribir el archivo en el response
	    OutputStream out = response.getOutputStream();
	    output.writeTo(out);
	    out.flush();
	    out.close();

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo Descargar el curriculum");
	    return actionMapping.findForward("mensaje_fw");

	}
	return null;
    }

    /**
     * actualizarCurriculo
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward actualizarCurriculo(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    ActionForm actionForm, HttpSession httpSession) {

	try {
	    UsuarioFormBean cfb = (UsuarioFormBean) actionForm;
	    FormFile curr = cfb.getCurric();
	    CurriculoVO curriculo = new CurriculoVO();
	    curriculo.setCurr(curr);

	    DatosSesVO datosSes = (DatosSesVO) httpSession.getAttribute("Ses_Usu");
	    curriculo.setIdUsu(datosSes.getId());
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    if (usuarioLocal.actualizaCurriculo(curriculo)) {
		servletRequest.setAttribute("mensaje", "El curriculum Fue actualizado");
		return actionMapping.findForward("mensaje_fw");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo actualizar el curriculum");
	    return actionMapping.findForward("mensaje_fw");
	}

	return null;
    }

    /**
     * aactualizarCurriculo
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @param httpSession
     *            HttpSession
     * @return ActionForward
     */
    private ActionForward aactualizarCurriculo(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    HttpSession httpSession) {
	return actionMapping.findForward("actualizarCurriculo_fw");
    }

    /**
     * actualizarDatosPersonales
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward actualizarDatosPersonales(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	try {
	    String nom_usu = servletRequest.getParameter("nom_usu");
	    String nom2_usu = servletRequest.getParameter("nom2_usu");
	    String apell_usu = servletRequest.getParameter("apell_usu");
	    String apell2_usu = servletRequest.getParameter("apell2_usu");

	    Integer telefono = null;
	    if (!servletRequest.getParameter("telefono").equals("")) {
		telefono = Integer.valueOf(servletRequest.getParameter("telefono"));
	    }
	    Integer celular = null;
	    if (!servletRequest.getParameter("celular").equals("")) {
		celular = Integer.valueOf(servletRequest.getParameter("celular"));
	    }

	    String dir_usu = servletRequest.getParameter("dir_usu");
	    String email = servletRequest.getParameter("email");
	    String cumpleanos = servletRequest.getParameter("cumpleanos");
	    String anx = servletRequest.getParameter("anx");
	    UsuarioVO datosdelusu = new UsuarioVO();
	    DatosSesVO datosSes;
	    try {
		HttpSession httpsession = servletRequest.getSession();
		datosSes = (DatosSesVO) httpsession.getAttribute("Ses_Usu");
	    } catch (Exception e) {
		servletRequest.setAttribute("mensaje", "La sesión ha caducado.");
		return actionMapping.findForward("mensaje_fw");

	    }

	    datosdelusu.setIdUsu(datosSes.getId());
	    datosdelusu.setNombreUsu(nom_usu);
	    datosdelusu.setNombreUsu2(nom2_usu);
	    datosdelusu.setApellUsu(apell_usu);
	    datosdelusu.setApellUsu2(apell2_usu);
	    datosdelusu.setTelefono(telefono);
	    datosdelusu.setCelular(celular);
	    datosdelusu.setDir(dir_usu);
	    datosdelusu.setEmail(email);
	    datosdelusu.setCumpleanosStr(cumpleanos);
	    datosdelusu.setAnexo(anx);

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    usuarioLocal.actDatosUsu(datosdelusu);

	    servletRequest.setAttribute("mensaje", "Los datos fueron actualizados");

	    UsuarioVO usuario = usuarioLocal.getDatosUsuEdit(datosSes.getId());

	    servletRequest.setAttribute("usuario", usuario);
	    return actionMapping.findForward("editdatpers_fw");

	} catch (Exception ex) {
	    ex.printStackTrace();
	    servletRequest.setAttribute("mensaje",
		    "No se pudieron actualizar los datos: Puede que su sesi�n haya caducado. Reinicie la sesi�n en la Intranet");
	    return actionMapping.findForward("mensaje_fw");
	}

    }

    /**
     * aeditarDatosPersonales
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aeditarDatosPersonales(ActionMapping actionMapping, HttpServletRequest servletRequest,
	    HttpSession httpSession) {

	try {
	    Integer id_usu_e = null;
	    DatosSesVO ses;

	    ses = (DatosSesVO) httpSession.getAttribute("Ses_Usu");
	    id_usu_e = ses.getId();

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    UsuarioVO usuario = usuarioLocal.getDatosUsuEdit(id_usu_e);
	    servletRequest.setAttribute("usuario", usuario);
	    return actionMapping.findForward("editdatpers_fw");

	} catch (LocalizadorServiciosException ex) {
	    ex.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se podo cargar la p�gina");
	    return actionMapping.findForward("mensaje_fw");

	}

    }

    /**
     *
     * actualizarUsuario
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward actualizarUsuario(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	try {
	    UsuarioVO usu = new UsuarioVO();
	    usu.setNombreUsu(servletRequest.getParameter("nombre_usu"));
	    usu.setNombreUsu2(servletRequest.getParameter("nombre2_usu"));
	    usu.setApellUsu(servletRequest.getParameter("apellido_usu"));
	    usu.setApellUsu2(servletRequest.getParameter("apellido2_usu"));
	    usu.setUsername(servletRequest.getParameter("username"));
	    usu.setIdArea(new Integer(servletRequest.getParameter("id_area")));
	    usu.setIdUsu(new Integer(servletRequest.getParameter("idUsu")));
	    usu.setIdPerfil(new Integer(servletRequest.getParameter("idPerfil")));

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    usuarioLocal.actDatosUsuSimple(usu);

	    servletRequest.setAttribute("mensaje", "Los Datos fueron actualizados ");
	    return actionMapping.findForward("mensaje_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudieron actualizar los datos del Usuario");
	    return actionMapping.findForward("mensaje_fw");
	}
    }

    /**
     * aadminUsus
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aadminUsus(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	try {
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    servletRequest.setAttribute("usuarios", usuarioLocal.getListaUsuarios());
	    return actionMapping.findForward("adminUsuarios_fw");

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "no se pudo cargar la p�gina");
	    return actionMapping.findForward("mensaje_fw");
	}

    }

    /**
     * cambiarEstadoUsu
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward cambiarEstadoUsu(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	try {
	    Integer id_usu = Integer.valueOf(servletRequest.getParameter("idUsu"));
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    if (usuarioLocal.cambiarEstadoUsu(id_usu)) {
		servletRequest.setAttribute("mensaje", "El estado del Usuario fue cambiado");
		return actionMapping.findForward("mensaje_fw");
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "no se pudo cambiar el estado del Usuario");
	    return actionMapping.findForward("mensaje_fw");

	}
	servletRequest.setAttribute("mensaje", "no se pudo cambiar el estado del Usuario");
	return actionMapping.findForward("mensaje_fw");

    }

    /**
     * borrarAnexo
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward borrarAnexo(ActionMapping actionMapping, HttpServletRequest servletRequest) {
	try {

	    Integer idAnx = Integer.valueOf(servletRequest.getParameter("idAnx"));
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    if (usuarioLocal.borrarAnexo(idAnx)) {
		return this.aadminAnexos(actionMapping, servletRequest);

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "El anexo NO pudo ser Eliminado");
	    return actionMapping.findForward("mensaje_fw");
	}
	return null;

    }

    /**
     * ingresarAnexo
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward registraAnexo(ActionMapping actionMapping, HttpServletRequest servletRequest) {
	try {
	    String nomAnx = servletRequest.getParameter("nomAnx");
	    String anx = servletRequest.getParameter("anx");
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    if (usuarioLocal.registraAnexo(nomAnx, anx)) {
		return this.aadminAnexos(actionMapping, servletRequest);

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "El anexo NO pudo ser registrado");
	    return actionMapping.findForward("mensaje_fw");
	}
	return null;
    }

    /**
     * actualizarAnexo
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward actualizarAnexo(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	try {
	    String anx = servletRequest.getParameter("anx");
	    Integer idAnx = Integer.valueOf(servletRequest.getParameter("idAnx"));

	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    if (usuarioLocal.actualizaAnexo(idAnx, anx)) {
		servletRequest.setAttribute("mensaje", "El anexo fue actualizado");
		return actionMapping.findForward("mensaje_fw");

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "no se pudo actualizar el anexo");
	    return actionMapping.findForward("mensaje_fw");
	}
	servletRequest.setAttribute("mensaje", "no se pudo actualizar el anexo");
	return actionMapping.findForward("mensaje_fw");
    }

    /**
     * aeditarAnexo
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aeditarAnexo(ActionMapping actionMapping, HttpServletRequest servletRequest) {
	try {
	    Integer anx = Integer.valueOf(servletRequest.getParameter("idAnx"));
	    UsuarioLocal usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    AnexoVO a = usuarioLocal.getAnexo(anx);
	    servletRequest.setAttribute("anx", a);
	    return actionMapping.findForward("editarAnexo_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo editar el Anexo");
	    return actionMapping.findForward("mensaje_fw");

	}

    }

    /**
     * aadminAnexos
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aadminAnexos(ActionMapping actionMapping, HttpServletRequest servletRequest) {
	UsuarioLocal usuarioLocal;
	try {
	    usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    List anx = usuarioLocal.getAnexosIndep();
	    servletRequest.setAttribute("anx", anx);
	    return actionMapping.findForward("adminAnexos_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "no se pudo cargar p�gina de administraci�n de anexos");
	    return actionMapping.findForward("mensaje_fw");
	}
    }

    /**
     * acuadroAnexos
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward acuadroAnexos(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	UsuarioLocal usuarioLocal;
	try {
	    usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    List anexos = usuarioLocal.getAnexosIndep();
	    List anexos_usu = usuarioLocal.getAnexosUsu();

	    servletRequest.setAttribute("anexos", anexos);
	    servletRequest.setAttribute("anexos_usu", anexos_usu);
	    return actionMapping.findForward("cuadroAnexos_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "no se pudo cargar el cuadro de anexos");
	    return actionMapping.findForward("mensaje_fw");
	}

    }

    /**
     * ingresaUsuario
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward ingresaUsuario(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	String nombre_usu = servletRequest.getParameter("nombre_usu");
	String nombre2_usu = servletRequest.getParameter("nombre2_usu");
	String apellido_usu = servletRequest.getParameter("apellido_usu");
	String apellido2_usu = servletRequest.getParameter("apellido2_usu");
	String username = servletRequest.getParameter("username");
	String password = servletRequest.getParameter("password");
	Integer id_area = new Integer(servletRequest.getParameter("id_area"));
	Integer id_perfil = Integer.valueOf(servletRequest.getParameter("id_perfil"));

	UsuarioLocal usuarioLocal;

	try {
	    usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();

	    if (usuarioLocal.ingresarUsuario(nombre_usu, nombre2_usu, apellido_usu, apellido2_usu, username, password,
		    id_area, id_perfil)) {
		List listausu = null;
		listausu = usuarioLocal.getUsuariosActivos();
		servletRequest.setAttribute("listausu", listausu);
		servletRequest.setAttribute("mensaje", "El usuario fue registrado exitosamente");
		return actionMapping.findForward("mensaje_fw");

	    } else {
		servletRequest.setAttribute("mensaje", "no se pudo ingresar el nuevo usuario");
		return actionMapping.findForward("mensaje_fw");
	    }
	} catch (LocalizadorServiciosException ex) {
	    System.out.println("no se pudo llamar a EJB");
	}
	servletRequest.setAttribute("mensaje", "no se pudo ingresar el nuevo usuario");
	return actionMapping.findForward("mensaje_fw");
    }

    /**
     * aagregarUsuario
     *
     * @param actionMapping
     *            ActionMapping
     * @param servletRequest
     *            HttpServletRequest
     * @return ActionForward
     */
    private ActionForward aagregarUsuario(ActionMapping actionMapping, HttpServletRequest servletRequest) {

	UsuarioLocal usuarioLocal;
	PerfilLocal perfilLocal;
	try {
	    usuarioLocal = LocalizadorServicios.getInstance().getUsuarioLocal();
	    perfilLocal = LocalizadorServicios.getInstance().getPerfilLocal();

	    servletRequest.setAttribute("areas", usuarioLocal.getAreas());
	    servletRequest.setAttribute("perfiles", perfilLocal.getPerfiles());
	    return actionMapping.findForward("aagregarusu_fw");

	} catch (LocalizadorServiciosException ex) {
	    ex.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo cargar el formulario de registro de clientes");
	    return actionMapping.findForward("mensaje_fw");
	} catch (Exception e) {
	    e.printStackTrace();
	    servletRequest.setAttribute("mensaje", "No se pudo cargar el formulario de registro de clientes");
	    return actionMapping.findForward("mensaje_fw");
	}

    }
}
