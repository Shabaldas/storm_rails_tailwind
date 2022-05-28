import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["slider", "progressBar", "fillingOption"];

  connect() {
    this.initiateValues();
  };

  disconnect() {
    this.initiateValues();
  };

  initiateValues() {
    this.fillingOptionTarget.value = 50;
    this.sliderTarget.value = 50;
    this.progressBarTarget.width = 30 + '%';
  };

  changeSliderValue(e) {
    const sliderValue = e.target.value;
    this.fillingOptionTarget.value = sliderValue;
    this.progressBarTarget.style.width = sliderValue - 5 + '%';
  };

  changeSelectValue(e) {
    const selectValue = e.target.value;
    this.sliderTarget.value = selectValue;
    this.progressBarTarget.style.width = selectValue - 5 + '%';
  };
};
