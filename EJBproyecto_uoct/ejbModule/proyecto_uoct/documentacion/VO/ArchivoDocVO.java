package proyecto_uoct.documentacion.VO;

import org.apache.struts.upload.FormFile;
import java.io.File;

public class ArchivoDocVO {
    private Integer idArchivo = null;
    private String nomArchivo = null;
    private byte[] archivo = null;
    private FormFile archivoFile = null;
    private File fArchivoFile = null;

    public void setIdArchivo(Integer idArch) {
        this.idArchivo = idArch;
    }

    public void setNomArchivo(String nom) {
        this.nomArchivo = nom;
    }

    public void setArchivo(byte[] archivo) {
        this.archivo = archivo;
    }

    public void setArchivoFile(FormFile archivo) {
        this.archivoFile = archivo;
    }
    public void setfArchivoFile(File archivo) {
        this.fArchivoFile = archivo;
    }

//------GETTERS

    public Integer getIdArchivo() {
        return this.idArchivo;
    }

    public String getNomArchivo() {
        return this.nomArchivo;
    }

    public byte[] getArchivo() {
        return this.archivo;
    }

    public FormFile getArchivoFile() {
        return this.archivoFile;
    }
    public File getfArchivoFile() {
        return this.fArchivoFile;
    }

}
