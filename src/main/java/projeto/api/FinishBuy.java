package projeto.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import model.ProdutoDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;

@WebServlet(urlPatterns = "/api/finsish-buy")
@MultipartConfig
public class FinishBuy extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            String[] ids = req.getParameterValues("ids");
            String[] qtds = req.getParameterValues("qtds");
            ProdutoDAO productDao = new ProdutoDAO();
            List<Produto> prods = new ArrayList<Produto>();
            for(int i=0; i < ids.length; ++i){
                int id = Integer.parseInt(ids[i]);
                Produto prod = productDao.getProductById(id);
                double qtd = Double.parseDouble(qtds[i]);
                if(qtd > prod.getQuantidade()){
                    String err = "{\"status\":500, \"error\": {\"product\":"+prod.getId()+"}}";
                    res.setContentType("application/json");
                    res.setCharacterEncoding("UTF-8");
                    res.getWriter().write(err);
                    return;
                }
                prods.add(prod);
            }
            for(int i=0; i< prods.size(); ++i){
                Produto prod = prods.get(i);
                double qtd = Double.parseDouble(qtds[i]);
                prod.setQuantidade(prod.getQuantidade() - qtd);
                productDao.addProduto(prod);
            }
            String response = "{\"status\": 200}";
            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            res.getWriter().write(response);
            return;
        } catch (Exception e) {
            System.out.println("Erro em estoque");
            e.printStackTrace();
        }
    }
}
