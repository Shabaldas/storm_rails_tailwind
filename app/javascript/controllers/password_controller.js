import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['unhide']

  password(e) {
    if (this.unhideTarget.type === "password") {
      e.target.classList.remove('fa-eye-slash');
      e.target.classList.add('fa-eye');
      this.unhideTarget.type = "text";
    } else {
      e.target.classList.remove('fa-eye');
      e.target.classList.add('fa-eye-slash');
      this.unhideTarget.type = "password";
    }
  }
}
