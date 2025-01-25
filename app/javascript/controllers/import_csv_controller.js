import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="import-csv"
export default class extends Controller {
  connect() {
    console.log("Import CSV controller connected")
  }

  fileChosen(event) {

    const fileName = event.target.files[0].name
    this.inputTarget.value = fileName

  }
}
