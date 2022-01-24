import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets=[ "sidebarContainer", "icon" ]

  toggle() {
    console.log('toogle');
    if (this.sidebarContainerTarget.dataset.expanded === "1") {
      this.collapse()
    } else {
      this.expand()
    }
  }

  collapse() {
    this.sidebarContainerTarget.classList.remove("-translate-x-full")
    this.sidebarContainerTarget.dataset.expanded = "0"
  }

  expand() {
    this.sidebarContainerTarget.classList.add("-translate-x-full")
    this.sidebarContainerTarget.dataset.expanded = "1"
  } 
}
