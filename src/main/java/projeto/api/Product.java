package projeto.api;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import model.ProdutoDAO;

import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;

import com.google.gson.Gson;

@WebServlet(urlPatterns = "/api/product")
@MultipartConfig
public class Product extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException
    {
        try {
            ProdutoDAO p = new ProdutoDAO();
            List<Produto> produtos = p.getProduto();
            String productJson = new Gson().toJson(produtos);
            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            res.getWriter().write(productJson);
        } catch (Exception e) {
            System.out.println("Erro em Produto");
            e.printStackTrace();
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException{
        try {
            Produto produto = new Produto();
            ProdutoDAO pDAO = new ProdutoDAO();
            String nome = req.getParameter("nome");
            String marca = req.getParameter("marca");
            String unidade = req.getParameter("unidade");
            Double preco = Double.parseDouble(req.getParameter("preco"));
            Double quantidade = Double.parseDouble(req.getParameter("quantidade"));
            produto.setNome(nome);
            produto.setMarca(marca);
            produto.setUnidade(unidade);
            produto.setPreco(preco);
            produto.setQuantidade(quantidade);
            Long id = pDAO.addProduto(produto);
            System.out.println("ID: "+id);
            produto.setId(id);
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
