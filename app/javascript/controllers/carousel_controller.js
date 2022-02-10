import { Application } from "@hotwired/stimulus"
import Carousel from "stimulus-carousel"

const application = Application.start()
application.register("carousel", Carousel)
export default class extends Carousel {
  connect() {
    super.connect()
    this.swiper
    this.defaultOptions
  }
  get defaultOptions() {
    return {
      clickable: true,
    }
  }
}
