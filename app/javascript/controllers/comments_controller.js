import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["commentsDiv"]
  connect() {
    console.log("hi")
  }

  toggle() {
    this.commentsDivTarget.classList.toggle("d-none");
  }
}
