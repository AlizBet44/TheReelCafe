package model.entitys;

import java.io.Serializable;
import java.util.Date;

public class Pelicula implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;
    private String titulo;
    private String poster;
    private String sinopsis;
    private String director;
    private String trailer;
    private int duracion;
    private Date fechaEstreno;

    public Pelicula() {
    }

    public Pelicula(Integer id, String titulo, String poster, String sinopsis, String director, String trailer,
            int duracion, Date fechaEstreno) {
        this.id = id;
        this.titulo = titulo;
        this.poster = poster;
        this.sinopsis = sinopsis;
        this.director = director;
        this.trailer = trailer;
        this.duracion = duracion;
        this.fechaEstreno = fechaEstreno;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public Date getFechaEstreno() {
        return fechaEstreno;
    }

    public void setFechaEstreno(Date fechaEstreno) {
        this.fechaEstreno = fechaEstreno;
    }
}
