  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    const sumPrice = document.getElementById("profit");
    sumPrice.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML);
})
