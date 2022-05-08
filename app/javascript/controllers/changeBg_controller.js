import { Controller } from "stimulus"

export default class extends Controller {
static targets =["svgElem"]

  setColor(e) {
    const color = e.target.dataset.color;
    const svgList=document.querySelectorAll('.svgElem svg path')
    svgList.forEach(svg => svg.setAttribute('fill', `${color}`));
  }

  connect () {
    const productImagesWrapper = document.getElementById('product-images-wrapper');
    const svgList=document.querySelectorAll('.svgElem svg path')
    svgList.forEach(svg => svg.setAttribute('fill', `${productImagesWrapper.dataset.colorValue}`));
    productImagesWrapper.classList.remove('hidden')
  }
}
