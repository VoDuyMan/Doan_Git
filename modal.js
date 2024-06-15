const buyBtn = document.querySelector('.buy')
const modal = document.querySelector('.js-modal')
const modalafter = document.querySelector('.js-modal-container')
const modalclose = document.querySelector('.js-modal-colse')
const btnAdd = document.querySelector('.btn-add')
function showBuy() {
    modal.classList.add('open')
}
function closeBuy() {
    modal.classList.remove('open')
}
modal.addEventListener('click', closeBuy)
btnAdd.addEventListener('click', showBuy)

modalclose.addEventListener('click', closeBuy)
modalafter.addEventListener('click', function(event){
    event.stopPropagation()
})