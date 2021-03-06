import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["entries", "pagination"]

  initialize() {
    let options = {
      rootMargin: "200px",
    }

    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries), options)
  }

  connect() {
    if (this.hasPaginationTarget) {
      this.intersectionObserver.observe(this.paginationTarget)
    }
  }

  disconnect() {
    if (this.hasPaginationTarget) {
      this.intersectionObserver.unobserve(this.paginationTarget)
    }
  }

  processIntersectionEntries(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        this.loadMore()
      }
    })
  }

  loadMore() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")
    if (next_page == null) { return }
    let url = next_page.href

    Rails.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML("beforeend", data.entries)
        this.paginationTarget.innerHTML = `<div class='hidden'>${data.pagination}</div>`
      }
    })
  }
}
