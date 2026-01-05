package model.entitys;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "pelicula")
public class Pelicula implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "titulo", nullable = false, length = 255)
    private String titulo;

    @Column(name = "poster", length = 255)
    private String poster;

    @Column(name = "sinopsis", columnDefinition = "TEXT")
    private String sinopsis;

    @Column(name = "director", length = 255)
    private String director;

    @Column(name = "trailer", length = 255)
    private String trailer;

    @Column(name = "duracion")
    private int duracion;

    @Temporal(TemporalType.DATE)
    @Column(name = "fecha_estreno")
    private Date fechaEstreno;

    public Pelicula() {
    }

    public Pelicula(String titulo, String poster, String sinopsis, String director, String trailer,
            int duracion, Date fechaEstreno) {
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

	@Override
	public String toString() {
		return "Pelicula [id=" + id + ", titulo=" + titulo + ", poster=" + poster + ", sinopsis=" + sinopsis
				+ ", director=" + director + ", trailer=" + trailer + ", duracion=" + duracion + ", fechaEstreno="
				+ fechaEstreno + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (other == null || getClass() != other.getClass()) {
			return false;
		}
		Pelicula pelicula = (Pelicula) other;
		return Objects.equals(id, pelicula.id);
	}
}