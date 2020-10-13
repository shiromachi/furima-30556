function price () {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener('keyup', () => {
    const num = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = num * 0.1;
    profit.innerHTML = num - (num * 0.1);
  });
}

window.addEventListener('load', price);