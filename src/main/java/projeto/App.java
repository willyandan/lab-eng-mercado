package projeto;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import model.ProdutoDAO;
import java.util.*;
import javax.servlet.annotation.WebServlet;
// import java.io.PrintWriter;

@WebServlet(urlPatterns = "")
public class App extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

	@Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            ProdutoDAO p = new ProdutoDAO();
            List<Produto> produtos = p.getProduto();
            req.setAttribute("produtos", produtos);
            req.getRequestDispatcher("/index.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em app");
            e.printStackTrace();
        }
    }
}
