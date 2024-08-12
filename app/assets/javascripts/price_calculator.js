document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

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
});