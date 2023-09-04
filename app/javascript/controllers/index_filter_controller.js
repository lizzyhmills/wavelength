import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-filter"
export default class extends Controller {
  static targets = ["form", "posts"]

  connect() {
    console.log("hello from connect")
    console.log(this.formElement)
  }

  click() {
    console.log("hello")
    this.formTarget.classList.toggle("d-none")
    this.postsTarget.classList.toggle("d-none")
  }
}
