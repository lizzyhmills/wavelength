import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["cards"]
  connect() {
  }

  move() {
    console.log("hello")
  }
}
