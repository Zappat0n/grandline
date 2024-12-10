import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["container", "textArea"]

  connect() {
    this.createActionCableChannel()
    this.textAreaTarget.focus()
  }

  createActionCableChannel() {
    return consumer.subscriptions.create("MessageChannel", {
      connected() {
        console.log("Connected to the chat channel!")
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        const container = document.querySelector('#messagesContainer')

        if (container) {
          container.insertAdjacentHTML( 'beforeend', data.html );
        }
      }
    });

  }
}
