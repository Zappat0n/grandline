import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["container", "textArea"]
  static values = { room: String }

  connect() {
    console.log("Connected to messages controller")
    this.containerTarget.scrollTop = this.containerTarget.scrollHeight
    this.textAreaTarget.focus()
  }
}
