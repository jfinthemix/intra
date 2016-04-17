package proyecto_uoct.infoyrep.controller;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import org.apache.struts.upload.FormFile;

public class fileup1ActionForm extends ActionForm {

    public ActionErrors validate(ActionMapping actionMapping,
                                 HttpServletRequest httpServletRequest) {

        return null;
    }

    public void reset(ActionMapping actionMapping,
                      HttpServletRequest servletRequest) {
    }

    private FormFile unArchivo;
    private String descripcion;

    public void setUnArchivo(FormFile unarchivo) {
        this.unArchivo = unarchivo;
    }
    public FormFile getUnArchivo() {
        return unArchivo;

      }
    public void setDescripcion(String descripcion){
        this.descripcion=descripcion;
    }



      public String getDescripcion(){
          return this.descripcion;
      }

}
