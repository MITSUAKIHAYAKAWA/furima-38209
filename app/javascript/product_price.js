function product_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDam = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit")
    addTaxDam.innerHTML = Math.floor(inputValue * 0.1)
    salesProfit.innerHTML = inputValue - Math.floor(inputValue * 0.1)
  });
};

window.addEventListener("load", product_price)