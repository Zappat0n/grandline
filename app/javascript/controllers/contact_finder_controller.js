import { Controller } from "@hotwired/stimulus"
// import Fetcher from "./helpers/fetcher"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log("ContactFinderController connected")
  }
}
