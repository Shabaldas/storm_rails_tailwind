import { Controller } from "stimulus"

export default class extends Controller {
static targets =["svgElem"]

  setColor(e) {
    // const color = e.target.value;
    const color = e.target.dataset.color;
    // console.log(e.target);
    // console.log(color);
    const svgList=document.querySelectorAll('.svgElem svg path')
    svgList.forEach(svg => svg.setAttribute('fill', `${color}`));
  }
}
