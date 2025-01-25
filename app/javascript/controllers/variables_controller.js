import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "template"]

  addVariable(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML("beforeend", content)
  }

  removeVariable(event) {
    event.preventDefault()
    const item = event.target.closest(".nested-fields")
    if (item) {
      item.remove()
    }
  }
}

