import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["display"]

  render(evt) {
    this.displayTarget.innerHTML = evt.detail[0].getElementsByClassName("content")[0].innerHTML
  }
}
