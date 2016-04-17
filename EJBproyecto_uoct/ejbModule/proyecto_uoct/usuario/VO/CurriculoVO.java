package proyecto_uoct.usuario.VO;

import java.io.File;

import org.apache.struts.upload.FormFile;

public class CurriculoVO {
    public CurriculoVO() {
    }

    private FormFile curr = null;
    private String nomCurr = null;
    private Integer id_usu = null;
    private File curriculumFile = null;

    public void setCurr(FormFile c) {
        this.curr = c;
    }

    public void setNomCurr(String nom) {
        this.nomCurr = nom;
    }


    public void setIdUsu(Integer id) {
        this.id_usu = id;
    }

    public void setCurriculumFile(File curr) {
        this.curriculumFile=curr;
    }
    

    public FormFile getCurr() {
        return this.curr;
    }

    public String getNomCurr() {
        return this.nomCurr;
    }


    public Integer getIdUsu() {
        return this.id_usu;
    }
    public File getCurriculumFile() {
        return this.curriculumFile;
    }

}
