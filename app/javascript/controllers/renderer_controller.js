import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['display']

  render(evt) {
    console.log(evt)
    this.displayTarget.innerHTML = evt.detail[0].all[69].innerHTML
  }
}
