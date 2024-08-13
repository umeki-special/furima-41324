window.addEventListener('load', function(){
  const price = () => {
    const priceInput = document.getElementById('price-content');
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    console.log(priceInput);

    if (priceInput) {
      priceInput.addEventListener('input', () => {
        const price = parseInt(priceInput.value, 10);

        if (isNaN(price) || price < 300) {
          addTaxPrice.textContent = '';
          profit.textContent = '';
        } else {
          const tax = Math.floor(price * 0.1);
          const profitAmount = price - tax;

          addTaxPrice.textContent = tax;
          profit.textContent = profitAmount;
        }
      });
    }
  };
  price();
})

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
