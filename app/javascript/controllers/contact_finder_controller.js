import { Controller } from "@hotwired/stimulus"
import { Fetcher } from "controllers/helpers/fetcher"

export default class extends Controller {
  static targets = ["input", "results"]
  static values = { url: String }

  connect() {
    this.fetcher = new Fetcher()
  }

  find() {
    console.log("Connected to contact finder controller")
    const url = `${this.urlValue}?username=${this.inputTarget.value}`

    this.fetcher
      .request(url, { username: this.inputTarget.value })
      .then(response => {
        this.inputTarget.value = ""
        this.resultsTarget.innerHTML = response["html"]
      })
  }
}
