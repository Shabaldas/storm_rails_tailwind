
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
	static targets=['range', 'value', 'rangeFrom', 'rangeTo', 'valueFrom', 'valueTo'];
	connect() {
    if (this.hasValueTarget)     { this.valueTarget.innerHTML = this.rangeTarget.value }
    if (this.hasValueToTarget)   { this.valueToTarget.innerHTML = this.rangeToTarget.value }
    if (this.hasValueFromTarget) { this.valueFromTarget.innerHTML = this.rangeFromTarget.value }
  }
  
  updateValue(evt) {
    this.valueTarget.innerHTML = evt.currentTarget.value;
  }
  
  updateFromValue() {
    let fromValue = this.rangeFromTarget.value
    let toValue = this.rangeToTarget.value
    
    if (fromValue >= toValue) {
      this.rangeToTarget.value = fromValue
      this.valueToTarget.innerHTML = fromValue
    }
    
    this.valueFromTarget.innerHTML = fromValue
    this.valueFromTarget.style.position='relative';
    this.valueFromTarget.style.left=fromValue/14+ 'px'
  }
  
  updateToValue() {
    let fromValue = this.rangeFromTarget.value
    let toValue = this.rangeToTarget.value
    
    if (toValue <= fromValue) {
      this.rangeFromTarget.value = toValue
      this.valueFromTarget.innerHTML = toValue
    }
    this.valueToTarget.innerHTML = toValue
    this.valueToTarget.style.position='relative';
    this.valueToTarget.style.left=toValue/14 + 'px'
  }

  
}