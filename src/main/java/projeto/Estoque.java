package projeto;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/estoque")
public class Estoque extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException
    {
        try {
            req.getRequestDispatcher("/estoque.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em estoque");
            e.printStackTrace();
        }
    }
}
