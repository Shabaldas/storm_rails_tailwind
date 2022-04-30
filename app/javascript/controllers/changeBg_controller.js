import { Controller } from "stimulus"

export default class extends Controller {
static targets =["svgElem"]
  connect() {
    document.querySelector('.upperBg').style.fill = '#96e06cd0';
  }

  disconnect() {
    document.querySelector('.upperBg').style.fill = '#96e06cd0';
  }

  setColor(e) {
      var color = e.target.value;
      document.querySelector('#svgElem svg path').setAttribute('fill', `${color}`);
  }
}
