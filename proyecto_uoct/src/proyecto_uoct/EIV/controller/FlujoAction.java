package proyecto_uoct.EIV.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import proyecto_uoct.EIV.model.*;
import proyecto_uoct.common.*;
import proyecto_uoct.EIV.VO.FlujoVO;
import proyecto_uoct.EIV.VO.BusFlujosVO;

public class FlujoAction extends Action {
    private SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    public ActionForward execute(ActionMapping actionMapping,
                                 ActionForm actionForm,
                                 HttpServletRequest servletRequest,
                                 HttpServletResponse servletResponse) {
        String hacia = servletRequest.getParameter("hacia");
//------------
        if (hacia.equals("cargarRegFlujo")) {
            return cargarRegFlujo(actionMapping, servletRequest);
        }
        if (hacia.equals("ingresarFlujo")) {
            return ingresarFlujo(actionMapping, servletRequest);
        }

        if (hacia.equals("eliminarFlujo")) {
            return eliminarFlujo(actionMapping, servletRequest);
        }
        if (hacia.equals("buscarFlujos")) {
            return buscarFlujos(actionMapping, servletRequest);
        }

        return actionMapping.findForward("buscarFlujo_fw");
    }

    /**
     * buscarFlujos
     *
     * @param actionMapping ActionMapping
     * @param servletRequest HttpServletRequest
     * @return ActionForward
     */
    private ActionForward buscarFlujos(ActionMapping actionMapping,
                                       HttpServletRequest servletRequest) {

        try {
            if (servletRequest.getParameter("Submit")!=null) {
                EIVLocal eivloc = LocalizadorServicios.getInstance().
                                  getEIVLocal();
                BusFlujosVO bus = new BusFlujosVO();
                if (!servletRequest.getParameter("ideiv").equals("")) {
                    bus.setIdEIV(new Integer(servletRequest.getParameter(
                            "ideiv")));
                }
                if (!servletRequest.getParameter("fecha").equals("")) {
                    bus.setFecha(servletRequest.getParameter("fecha"));
                }
                if (!servletRequest.getParameter("calle").equals("")) {
                    bus.setCalles(servletRequest.getParameter("calle"));
                }
                List listaFlujos = eivloc.buscarFlujos(bus);
                servletRequest.setAttribute("listaFlujos", listaFlujos);
            }

            return actionMapping.findForward("buscarFlujo_fw");

        } catch (Exception e) {
            e.printStackTrace();
            servletRequest.setAttribute("mensaje",
                                        "No se pudo cargar la página de búsqueda de flujos");
            return actionMapping.findForward("mensaje_fw");
        }
    }

    /**
     * eliminarFlujo
     *
     * @param actionMapping ActionMapping
     * @param servletRequest HttpServletRequest
     * @return ActionForward
     */
    private ActionForward eliminarFlujo(ActionMapping actionMapping,
                                        HttpServletRequest servletRequest) {
        try {
            Integer idFlu = Integer.valueOf(servletRequest.getParameter(
                    "idFlujo"));

            EIVLocal eivLocal = LocalizadorServicios.getInstance().
                                getEIVLocal();
            if (eivLocal.eliminarFlujo(idFlu)) {
                servletRequest.setAttribute("mensaje",
                                            "El Flujo fue eliminado exitosamente");
                servletRequest.setAttribute("id_eiv",
                                            servletRequest.
                                            getParameter("id_eiv"));
                servletRequest.setAttribute("nomEIV",
                                            servletRequest.
                                            getParameter("nomEIV"));
            } else {
                servletRequest.setAttribute("mensaje",
                                            "El flujo no pudo ser eliminado");
            }

        } catch (Exception e) {
            e.printStackTrace();
            servletRequest.setAttribute("mensaje",
                                        "El flujo no pudo ser eliminado");
            return actionMapping.findForward("mensaje_fw");
        }
        return cargarRegFlujo(actionMapping, servletRequest);
    }

    /**
     * ingresarFlujo
     *
     * @param actionMapping ActionMapping
     * @param servletRequest HttpServletRequest
     * @return ActionForward
     */
    private ActionForward ingresarFlujo(ActionMapping actionMapping,
                                        HttpServletRequest servletRequest) {

        try {
            Integer id_eiv = Integer.valueOf(servletRequest.getParameter(
                    "id_eiv"));

            FlujoVO flujo = new FlujoVO();
            Date fechaflujo = new Date();
            String nomEIV = (String) servletRequest.getParameter("nomEIV");

            fechaflujo = sdf.parse((String) servletRequest.
                                   getParameter("fechaflujo"));
            Integer tipodia = Integer.valueOf(servletRequest.getParameter(
                    "tipodia"));
            String calle1 = servletRequest.getParameter("calle1");
            String calle2 = servletRequest.getParameter("calle2");
            String horasMed = servletRequest.getParameter("horasMed");

            flujo.setIdEIV(id_eiv);
            flujo.setFecha(fechaflujo);
            flujo.setCalle1(calle1);
            flujo.setCalle2(calle2);
            flujo.setIdTipoDia(tipodia);
            flujo.setHorasMed(horasMed);

            EIVLocal eivLocal = null;

            eivLocal = LocalizadorServicios.getInstance().
                       getEIVLocal();

            eivLocal.getFlujosxEIV(id_eiv);
            eivLocal.insertFlujo(flujo);
            servletRequest.setAttribute("flujos",
                                        eivLocal.getFlujosxEIV(id_eiv));
            servletRequest.setAttribute("flujo_ant", flujo);
            servletRequest.setAttribute("id_eiv", id_eiv);
            servletRequest.setAttribute("nomEIV", nomEIV);
            servletRequest.setAttribute("mensaje",
                                        "El flujo fue ingresado exitosamente");
            return actionMapping.findForward("registrarFlujo_fw");
        } catch (Exception ex) {
            ex.printStackTrace();
            servletRequest.setAttribute("mensaje",
                                        "No se pudo ingresar el flujo");
            return actionMapping.findForward("mensaje_fw");
        }
    }

    /**
     * cargarRegFlujo
     *
     * @param actionMapping ActionMapping
     * @param servletRequest HttpServletRequest
     * @return ActionForward
     */
    private ActionForward cargarRegFlujo(ActionMapping actionMapping,
                                         HttpServletRequest servletRequest) {

        try {
            Integer id_eiv = Integer.valueOf(servletRequest.getParameter(
                    "id_eiv"));
            String nomEIV = (String) servletRequest.getParameter("nomEIV");
            EIVLocal eivLocal = null;

            eivLocal = LocalizadorServicios.getInstance().
                       getEIVLocal();

            servletRequest.setAttribute("flujos",
                                        eivLocal.getFlujosxEIV(id_eiv));
            servletRequest.setAttribute("id_eiv", id_eiv);
            servletRequest.setAttribute("nomEIV", nomEIV);
            return actionMapping.findForward("registrarFlujo_fw");
        } catch (LocalizadorServiciosException ex) {
            ex.printStackTrace();
        }
        return actionMapping.findForward("mensaje_fw");
    }
}
