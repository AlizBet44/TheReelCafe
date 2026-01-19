package serviciosrest.pelicula;

import java.util.List;
import model.dao.PeliculaDAO;
import model.dao.DAOFactory;
import model.entitys.Pelicula;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.Collections;

@Path("/peliculas")
public class PeliculaResource {

    private PeliculaDAO peliculaDAO = DAOFactory.getDAOFactory().getPeliculaDAO();

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Pelicula> listar() {
        return peliculaDAO.obtenerTodas();
    }

    private String validar(Pelicula pelicula) {
        if (pelicula == null) {
            return "Entidad pelicula es null";
        }
        if (pelicula.getTitulo() == null || pelicula.getTitulo().trim().isEmpty()) {
            return "El campo 'titulo' es obligatorio";
        }
        if (pelicula.getDuracion() < 0) {
            return "El campo 'duracion' no puede ser negativo";
        }
        return null;
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response obtenerPorId(@PathParam("id") Integer id) {
        Pelicula p = peliculaDAO.obtenerPorId(id);
        if (p == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(p).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response crear(Pelicula pelicula) {
        String err = validar(pelicula);
        if (err != null) {
            return Response.status(Response.Status.BAD_REQUEST).type(MediaType.APPLICATION_JSON).entity("{\"error\": \"" + err + "\"}").build();
        }
        try {
            peliculaDAO.registrar(pelicula);
            return Response.status(Response.Status.CREATED).entity(pelicula).build();
        } catch (Exception e) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).type(MediaType.APPLICATION_JSON).entity("{\"error\": \"" + e.getMessage() + "\"}").build();
        }
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response actualizar(@PathParam("id") Integer id, Pelicula pelicula) {
        Pelicula existente = peliculaDAO.obtenerPorId(id);
        if (existente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        String err = validar(pelicula);
        if (err != null) {
            return Response.status(Response.Status.BAD_REQUEST).type(MediaType.APPLICATION_JSON).entity("{\"error\": \"" + err + "\"}").build();
        }
        pelicula.setId(id);
        try {
            peliculaDAO.actualizar(pelicula);
            return Response.ok(pelicula).build();
        } catch (Exception e) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).type(MediaType.APPLICATION_JSON).entity("{\"error\": \"" + e.getMessage() + "\"}").build();
        }
    }

    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response eliminar(@PathParam("id") Integer id) {
        peliculaDAO.eliminar(id);
        return Response.ok(Collections.singletonMap("message", "Eliminado")).build();
    }
}
