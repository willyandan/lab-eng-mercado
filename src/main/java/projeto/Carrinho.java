package projeto;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import model.ProdutoDAO;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/carrinho")
public class Carrinho extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException
    {
        try {
            String[] ids = req.getParameterValues("ids");
            String[] qtds = req.getParameterValues("qtds");
            ProdutoDAO productDao = new ProdutoDAO();

            List<Produto> prods = new ArrayList<Produto>();
            Double total = 0.0;
            for(int i=0; i < ids.length; ++i){
                int id = Integer.parseInt(ids[i]);
                double qtd = Double.parseDouble(qtds[i]);
                Produto prod = productDao.getProductById(id);
                prod.setQuantidade(qtd);
                prods.add(prod);
                total += prod.getQuantidade() * prod.getPreco();
            }
            req.setAttribute("prods", prods);
            req.setAttribute("total", total);
            req.getRequestDispatcher("/finalizar-compra.jsp").forward(req, res);
        } catch (Exception e) {
            System.out.println("Erro em estoque");
            e.printStackTrace();
        }
    }
}
