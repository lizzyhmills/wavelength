import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite-filter"
export default class extends Controller {
  static targets = ["form", "saved"]

  connect() {
    console.log("hello from faves")
  }

  click() {
    console.log("hello")
    this.formTarget.classList.toggle("d-none")
    this.savedTarget.classList.toggle("d-none")
  }
}
