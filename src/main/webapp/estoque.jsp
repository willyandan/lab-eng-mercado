<!--
  @TODO: TIRAR ONCLICK etc....
-->
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false"
                data-target="navbar-items">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbar-items" class="navbar-menu">
            <div class="navbar-start">
                <a class="navbar-item" href="/projeto/index.jsp">
                    Home
                </a>

                <a class="navbar-item" href="/projeto/estoque.jsp">
                    Estoque
                </a>
            </div>
        </div>
    </nav>

    <header class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Estoque
                </h1>
            </div>
        </div>
    </header>
    <section class="options container-fluid">
        <div class="box has-text-right">
            <button class="button is-info" onclick="createProduct()">
                <span class="icon">
                    <i class="fas fa-plus"></i>
                </span>
                <span>Adicionar Produto</span>
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
                    <th>Unidade</th>
                    <th>Preço Uni.</th>
                    <th>Qtd. Disponível</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody id='products-body'>
            </tbody>
            <tfooter>
                <td colspan="6"></td>
                <td><strong>TOTAL:</strong> R$ <span id="total-geral"></span></td>
            </tfooter>
        </table>
    </main>

    <footer class="footer">
        <div class="content has-text-centered">
            <p>
                <strong>Supermercados O(log n)</strong> by Willyan Antunes.
            </p>
        </div>
    </footer>

    <div class="modal" id="modalEditProduct">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Editar produto</p>
                <button class="delete" aria-label="close" onclick="closeModal('modalEditProduct')"></button>
            </header>
            <form id="formEditProduct">
                <input type="hidden" id="edit-id">
                <section class="modal-card-body">
                    <div class="field">
                        <label class="label">Nome</label>
                        <div class="control">
                            <input class="input" type="text" id="edit-name" placeholder="Nome">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Marca</label>
                        <div class="control">
                            <input class="input" type="text" id="edit-marca" placeholder="Marca">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Unidade</label>
                        <div class="control">
                            <div class="select">
                                <select id="edit-unidade">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Preço unitário</label>
                        <div class="control">
                            <input class="input" id="edit-preco" type="number" step="0.01" min="0" placeholder="Preço">
                        </div>
                    </div>

                    <div class="field">
                        <label class="label">Quantidade</label>
                        <div class="control">
                            <input class="input" id="edit-qtd" type="number" step="0.001" min="0"
                                placeholder="Quantidade Disponível">
                        </div>
                    </div>
                </section>
                <footer class="modal-card-foot has-text-right">
                    <button class="button is-success" type="submit">Salvar</button>
                    <button class="button" type="button" onclick="closeModal('modalEditProduct')">Cancelar</button>
                </footer>
            </form>
        </div>
    </div>

    <script src="/projeto/src/js/Api/Api.js"></script>
    <script src="/projeto/src/js/ProductList/ProductList.js"></script>
    <script src="/projeto/src/js/estoque.js"></script>
</body>

</html>
