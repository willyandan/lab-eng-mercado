package projeto.api;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import model.ProdutoDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/api/update-product")
@MultipartConfig
public class UpdateProduct extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            String nome = req.getParameter("nome");
            String marca = req.getParameter("marca");
            String unidade = req.getParameter("unidade");
            Double preco = Double.parseDouble(req.getParameter("preco"));
            int id = Integer.parseInt(req.getParameter("id"));
            Double quantidade = Double.parseDouble(req.getParameter("quantidade"));

            ProdutoDAO pDAO = new ProdutoDAO();
            Produto produto = pDAO.getProductById(id);


            produto.setNome(nome);
            produto.setMarca(marca);
            produto.setUnidade(unidade);
            produto.setPreco(preco);
            produto.setQuantidade(quantidade);

            pDAO.addProduto(produto);

            String productJson = new Gson().toJson(produto);
            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            res.getWriter().write(productJson);

        } catch (Exception e) {
            System.out.println("Erro em estoque");
            e.printStackTrace();
        }
    }
}
