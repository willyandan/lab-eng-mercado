package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.*;
import model.Produto;

public class ProdutoDAO {

    @SuppressWarnings("unchecked")
    public List<Produto> getProduto() throws Exception{
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistencia_simples");
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT p FROM produto p");
        List<Produto> produtos = (List<Produto>) q.getResultList();
        em.close();
        emf.close();
        return produtos;
    }

    public Produto getProductById(int id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistencia_simples");
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("SELECT p FROM produto p where p.id ="+id);
        Produto produto = (Produto) q.getSingleResult();
        em.close();
        emf.close();
        return produto;

    }

    public Long addProduto(Produto prod){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistencia_simples");
        EntityManager em = emf.createEntityManager();

        Long id = 0l;
        boolean hasId = prod.getId() > 0;
        em.getTransaction().begin();
        if(!hasId){
            em.persist(prod);
            em.flush();
        }else{
            em.merge(prod);
            id = prod.getId();
        }
        em.getTransaction().commit();

        if(!hasId){
            id = prod.getId();
        }

        em.close();
        emf.close();

        return id;
    }

    public void deleteProduto(long id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistencia_simples");
        EntityManager em = emf.createEntityManager();
        Produto prod = em.find(Produto.class, id);
        em.getTransaction().begin();
        em.remove(prod);
        em.getTransaction().commit();
    }
}
