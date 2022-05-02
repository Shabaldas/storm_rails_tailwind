import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["price"]

   changePrice(e) {
    const currentPrice = +e.target.value;
    this.priceTarget.textContent = `₴ ${currentPrice}`;
  }
}
