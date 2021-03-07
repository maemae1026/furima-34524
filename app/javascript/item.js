function check() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue/10)
    const rieki = document.getElementById("profit");
    rieki.innerHTML = inputValue - Math.floor(inputValue/10)
});}

window.addEventListener("load", check);