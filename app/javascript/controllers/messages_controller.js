import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["container", "textArea"]
  static values = { room: String }

  connect() {
    this.createActionCableChannel()
    this.textAreaTarget.focus()
  }

  createActionCableChannel() {
    return consumer.subscriptions.create({channel: "MessageChannel", room_name: this.roomValue }, {
      connected() {
        console.log("Connected to the chat channel!")
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        console.log("Received data from the chat channel!", data)
        const container = document.querySelector('#messagesContainer')

        if (container) {
          container.insertAdjacentHTML( 'beforeend', data.html );
        }
      }
    });

  }
}
