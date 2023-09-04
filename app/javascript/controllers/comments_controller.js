import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["commentsDiv", "editCard"]
  connect() {
    console.log("hi")
  }

  toggleComments() {
    this.commentsDivTarget.classList.remove("d-none");
    this.editCardTarget.classList.add("d-none");
  }

  toggleEdit() {
    this.editCardTarget.classList.remove("d-none");
    this.commentsDivTarget.classList.add("d-none");
  }
}
