<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="model.Produto"%>
<%@page import ="java.util.List"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Projeto: Willyan _ Lab de engenharia</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
  <link rel="stylesheet" href="src/style/style.css">
  <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</head>

<body>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="https://bulma.io">
        <strong>Mercado O(Log N)</strong>
      </a>

      <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbar-items">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div id="navbar-items" class="navbar-menu">
      <div class="navbar-start">
        <a class="navbar-item" href="/projeto/">
          Home
        </a>

        <a class="navbar-item" href="estoque">
          Estoque
        </a>
      </div>
    </div>
  </nav>

  <header class="hero is-primary">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          Compra finalizada
        </h1>
      </div>
    </div>
  </header>

  <main class="finalizar-compra">
    <table class="table is-hoverable is-fullwidth is-bordered">
      <thead>
        <tr>
          <th>Código</th>
          <th>Nome</th>
          <th>Preço Uni.</th>
          <th>Qtd</th>
          <th>Total</th>

        </tr>
      </thead>
      <tbody>
        <tr>
            <%
                List<Produto> produtos = (List)request.getAttribute("prods");
                double total = (double) request.getAttribute("total");
                for(Produto p: produtos){
                    out.print("<tr>");
                    out.print("<td>" + p.getId() + "</td>");
                    out.print("<td>" + p.getNome() + "</td>");
                    out.print("<td>" + p.getPreco() + "</td>");
                    out.print("<td>" + p.getQuantidade() + "</td>");
                    out.print("<td>" + p.getPreco() * p.getQuantidade() + "</td>");
                    out.print("</tr>");
                }
            %>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="4"></td>
          <td class="has-text-right">
            <strong>Preço total:</strong> <span> R$ <% out.print(total); %></span>
          </td>
        </tr>
      </tfoot>
    </table>
  </main>

  <footer class="footer">
    <div class="content has-text-centered">
      <p>
        <strong>Supermercados O(log n)</strong> by Willyan Antunes.
      </p>
    </div>
  </footer>
</body>

</html>
