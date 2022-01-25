import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
   static targets = ['sliderOne', 'sliderTwo', 'displayValOne', 'displayValTwo', 'sliderTrack'];

   connect() {
      this.sliderOne()
      this.sliderTwo()
   }

   sliderOne() {
      if (parseInt(this.sliderTwoTarget.value) - parseInt(this.sliderOneTarget.value) <= 0) {
         this.sliderOneTarget.value = parseInt(this.sliderTwoTarget.value);
      }
      this.displayValOneTarget.textContent = this.sliderOneTarget.value;
      this.displayValOneTarget.style.left = this.sliderOneTarget.value / this.sliderOneTarget.max + 'px';
      this.fillColor();
   }

   sliderTwo() {
      if (parseInt(this.sliderTwoTarget.value) - parseInt(this.sliderOneTarget.value) <= 0) {
         this.sliderTwoTarget.value = parseInt(this.sliderOneTarget.value);
      }
      this.displayValTwoTarget.textContent = this.sliderTwoTarget.value;
      this.displayValTwoTarget.style.right = (this.sliderOneTarget.max - this.sliderTwoTarget.value) / this.sliderOneTarget.max + 'px';
      this.fillColor();
   }

   fillColor() {
      this.percent1 = (this.sliderOneTarget.value / this.sliderOneTarget.max) * 100;
      this.percent2 = (this.sliderTwoTarget.value / this.sliderOneTarget.max) * 100;
      this.sliderTrackTarget.style.background = `linear-gradient(to right, #ded7e7 ${this.percent1}% , #f3bb13 ${this.percent1}% , #f3bb13 ${this.percent2}%, #ded7e7 ${this.percent2}%)`;
   }
}
