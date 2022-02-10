import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    document.querySelector('.upperBg').style.fill = '#96e06cd0';
  }

  disconnect() {
    document.querySelector('.upperBg').style.fill = '#96e06cd0';
  }

  setColor(e) {
    if (e.target.classList.contains('color')) {
      var color = e.target.getAttribute('data-color');
      document.querySelector('.upperBg').style.fill = color;
    }
  }
}
