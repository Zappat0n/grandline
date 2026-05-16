import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = [ "container" ]
  static values = {
    type: String,
    data: Object,
  }

  connect() {
    new Chart(this.containerTarget, {
      type: this.typeValue,
      data: this.dataValue,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
}
