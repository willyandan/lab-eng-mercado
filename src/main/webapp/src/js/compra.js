function openModal(id){
  const element = document.getElementById(id)
  element.classList.add('is-active')
}

function closeModal(id){
  const element = document.getElementById(id)
  element.classList.remove('is-active')
}

function addItemToCart(){

  closeModal('modalSearchProduct')
}

function updateProduct(){
  closeModal('modalEditProduct')
}