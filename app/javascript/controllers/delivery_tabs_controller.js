
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['tabsContent', "deliveryContent"];

  resetChanges() {
    this.tabsContentTargets.forEach(target => target.classList.add('hidden'));
    this.deliveryContentTargets.forEach(target => target.classList.add('hidden'));
  }

  connect() {
    this.resetChanges();
  }

  disconnect() {
    this.resetChanges();
  }

  showDeliveryContent(e) {
    const tabsContainer = document.querySelector('#tabs');
    const selectedDeliveryType = tabsContainer.querySelectorAll('input:checked')[0].id;
    this.deliveryContentTargets.forEach(target => target.classList.add('hidden'));

    this.deliveryContentTargets.forEach(target => {
      const isSameTarget = target.dataset.content === selectedDeliveryType;
      if (isSameTarget) {
        target.classList.remove('hidden')
      } else {
        target.classList.add('hidden')
      }
    });
  }

  showTabContent(e) {
    if (e.target.value === 'self_pickup') {
      this.tabsContentTargets[0].classList.remove('hidden');
      this.tabsContentTargets[1].classList.add('hidden');
    } else {
      this.tabsContentTargets[0].classList.add('hidden');
      this.tabsContentTargets[1].classList.remove('hidden');
    }
  }
}
