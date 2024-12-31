import "@hotwired/turbo-rails"
import "controllers"
import "controllers/helpers/fetcher";
import "bootstrap"
import { Turbo } from "@hotwired/turbo-rails"

Turbo.StreamActions.reset_value = function () {
  const target = document.querySelector(this.getAttribute("target"))
  target.value = ""
}

Turbo.StreamActions.focus = function () {
  const target = document.querySelector(this.getAttribute("target"))
  target.focus()
}
