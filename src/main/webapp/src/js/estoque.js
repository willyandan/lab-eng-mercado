const api = Api()
let productList = ProductList()

async function loadProducts(){
    let respondeProducts = await api.getProducts()
    productList.loadProducts({db:respondeProducts})
    makeTableOfProducts()
}

function loadUnidade(){
    let x = ["AMPOLA","BALDE","BANDEJ","BARRA","BISNAG","BLOCO","BOBINA","BOMBEAR","CÁPSULAS","CARRINHO","CENTO","CJ","CM","CM2","CX","CX2","CX3","CX5","CX10","CX15","CX20","CX25","CX50","CX100","DISP","DUZIA","EMBAL","FARDO","FOLHA","FRASCO","GALAO","GF","GRAMAS","JOGO","KG","KIT","LATA","LITRO","M","M2","M3","MILHEI","ML","MWH","PACOTE","PALETE","PARES","PC","AMIGO","K","RESMA","ROLO","SACO","SACOLA","TAMBOR","TANQUE","TON","TUBO","UNID","VASIL","VIDRO"]
    let select = document.getElementById('edit-unidade')
    x.forEach((opt)=>{
        let option = document.createElement('option')
        option.innerHTML = opt
        option.value = opt
        select.appendChild(option)
    })

}

function makeTableOfProducts(){
    tableDiv = document.getElementById('products-body')
    tableDiv.innerHTML = ''
    productList.getProducts().map((product,idx)=>{
        return productToRow({product,idx})
    }).forEach((row)=>{
        tableDiv.appendChild(row)
    })
    document.getElementById('total-geral').innerHTML = productList.calculateTotal().toFixed(2)
}

/**
 *
 * @param {{product: ReturnType<product>, idx: number}} param0
 */
function productToRow({product, idx}){
    const row = document.createElement('tr')

    const codigo = document.createElement('td')
    codigo.innerHTML = product.getId()

    const nome = document.createElement('td')
    nome.innerHTML = product.getNome()

    const marca = document.createElement('td')
    marca.innerHTML = product.getMarca()

    const unit = document.createElement('td')
    unit.innerHTML = product.getUnidade()

    const preco = document.createElement('td')
    preco.innerHTML = `R$ ${product.getPreco().toFixed(2)}`
    preco.classList.add('has-text-right')

    const quantidade = document.createElement('td')
    quantidade.innerHTML = product.getQuantidade().toFixed(3)
    quantidade.classList.add('has-text-right')

    const buttons = document.createElement('td')
    buttons.innerHTML = `<button class="button is-warning" data-idx=${idx} onclick='editProduct(this)'>
    <span class="icon is-small">
      <i class="far fa-edit"></i>
    </span>
    </button>
    <button class="button is-danger" data-id='${idx}' onclick='removeProduct(this)'>
    <span class="icon is-small">
      <i class="fas fa-times"></i>
    </span>
    </button>`
    row.appendChild(codigo)
    row.appendChild(nome)
    row.appendChild(marca)
    row.appendChild(unit)
    row.appendChild(preco)
    row.appendChild(quantidade)
    row.appendChild(buttons)
    return row
}


/**
 *
 * @param {Element} el
 */
function editProduct(el){
    /**
     * @type {number}
     */
    const idx = el.getAttribute('data-idx')

    const product = productList.getProducts()[idx]
    document.getElementById('edit-id').value = product.getId()
    document.getElementById('edit-name').value = product.getNome()
    document.getElementById('edit-marca').value = product.getMarca()
    document.getElementById('edit-preco').value = product.getPreco()
    document.getElementById('edit-unidade').value = product.getUnidade()
    document.getElementById('edit-qtd').value = product.getQuantidade()
    openModal('modalEditProduct')
}

function updateOrSaveProduct(e){
    e.preventDefault()
    const id = document.getElementById('edit-id').value
    if(id){
        updateProduct()
    }else{
        saveProduct()
    }
}

function updateProduct(){

    const id = document.getElementById('edit-id').value
    api.updateProduct({
        nome:document.getElementById('edit-name').value,
        marca:document.getElementById('edit-marca').value,
        preco:document.getElementById('edit-preco').value,
        unidade:document.getElementById('edit-unidade').value,
        id,
        quantidade: document.getElementById('edit-qtd').value
    }).then((val)=>{
        productList.updateProduct({id:id, product:val})
        makeTableOfProducts()
        closeModal('modalEditProduct')
    })
}

function saveProduct(){
    /**
     * @type {ProductInput}
     */
    const data = {
        nome:document.getElementById('edit-name').value,
        marca:document.getElementById('edit-marca').value,
        preco:document.getElementById('edit-preco').value,
        unidade:document.getElementById('edit-unidade').value,
        quantidade: document.getElementById('edit-qtd').value
    }

    api.createProduct(data).then((val)=>{
        let product  = Product(val)
        productList.addProduct({product})
        makeTableOfProducts()
        closeModal('modalEditProduct')
    }).catch((e)=>{
        console.log(e)
    })


}

/**
 *
 * @param {Element} el
 */
function removeProduct(el){
    /**
     * @type {number}
     */
    const idx = el.getAttribute('data-id')
    const product = productList.getProducts()[idx]
    api.removeProduct({id: product.getId() }).then(()=>{
        console.log('PASSOU')
        productList.removeProduct({product})
        makeTableOfProducts()
    }).catch(()=>{
        console.log('erro ao remover produto')
    })
}

function createProduct(){
    document.getElementById('edit-id').value = null
    document.getElementById('edit-name').value = null
    document.getElementById('edit-marca').value = null
    document.getElementById('edit-preco').value = null
    document.getElementById('edit-unidade').value = null
    document.getElementById('edit-qtd').value = null
    openModal('modalEditProduct')
}

function openModal(id){
    const element = document.getElementById(id)
    element.classList.add('is-active')
}

function closeModal(id){
    const element = document.getElementById(id)
    element.classList.remove('is-active')
}

loadProducts()
loadUnidade()
document.getElementById('formEditProduct').addEventListener('submit',updateOrSaveProduct)
