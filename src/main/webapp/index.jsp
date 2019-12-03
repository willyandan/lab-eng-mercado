<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType = "text/html" pageEncoding = "UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Mercado O(log N)</title>
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

        <a class="navbar-item" href="/projeto/estoque">
          Estoque
        </a>
      </div>
    </div>
  </nav>

  <header class="hero is-primary">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          Supermercado O(log n)
        </h1>
        <h2 class="subtitle">
          Preços menores que O(log n)
        </h2>
      </div>
    </div>
  </header>

  <section class="options container-fluid">
    <div class="box has-text-right">
      <button class="button is-info" onclick="openSearchProductModal()">
        <span class="icon">
          <i class="fas fa-plus"></i>
        </span>
        <span>Adicionar item</span>
      </button>
      <button class="button is-success" id="finalizar-compra">
        <span class="icon">
          <i class="fas fa-cart-arrow-down"></i>
        </span>
        <span>Finalizar Compra</span>
      </button>
    </div>
  </section>

  <main>
    <table class="table is-hoverable is-fullwidth is-bordered">
      <thead>
        <tr>
          <th>Código</th>
          <th>Nome</th>
          <th>Marca</th>
          <th>Preço Uni.</th>
          <th>Qtd</th>
          <th>Total</th>
          <th>Ações</th>
        </tr>
      </thead>
      <tbody id="tbody">
      </tbody>
      <tfoot>
        <tr>
          <td colspan="5"></td>
          <td class="has-text-right">
            <strong>Preço total:</strong> R$ <span id="total-compra">0,00</span>
          </td>
          <td></td>
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

  <div class="modal" id="modalSearchProduct">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Buscar produto</p>
        <button class="delete" aria-label="close" onclick="closeModal('modalSearchProduct')"></button>
      </header>
      <section class="modal-card-body">
        <div class="field has-addons">
          <div class="control is-expanded">
            <input class="input" type="text" id="search-product-input" placeholder="Buscar produto">
          </div>
          <div class="control">
            <a class="button is-info" id="search-product">
              Buscar
            </a>
          </div>
        </div>
        <table class="table is-hoverable is-fullwidth is-bordered">
          <thead>
            <tr>
              <th>Código</th>
              <th>Nome</th>
              <th>Marca</th>
              <th>Un.</th>
              <th>Preço Un.</th>
              <th>Quantidade</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><span id="sp-cod"></span></td>
              <td><span id="sp-nome"></span> </td>
              <td><span id="sp-marca"></span></td>
              <td><span id="sp-unidade"></span></td>
              <td class="has-text-right">R$ <span id="sp-preco"></span></td>
              <td>
                <div class="control">
                  <input class="input" type="number" placeholder="Qtd." id="sp-qtd">
                </div>
              </td>
              <td class="has-text-right">
                R$ <span id="sp-total"></span>
              </td>
            </tr>
          </tbody>
        </table>
      </section>
      <footer class="modal-card-foot has-text-right">
        <button class="button is-success" id="btn-add-item">Salvar</button>
        <button class="button" onclick="closeModal('modalSearchProduct')">Cancelar</button>
      </footer>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="/projeto/src/js/Api/Api.js"></script>
  <script src="/projeto/src/js/ProductList/ProductList.js"></script>
  <script src="/projeto/src/js/home.js"></script>
</body>

</html>
