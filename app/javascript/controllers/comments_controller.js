import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["commentsDiv", "editCard"]

  toggleComments() {
    this.commentsDivTarget.classList.toggle("d-none")
    this.editCardTarget.classList.add("d-none")
  }

  toggleEdit() {
    this.editCardTarget.classList.toggle("d-none")
    this.commentsDivTarget.classList.add("d-none")
  }

  connect() {
    console.log("hi")
  }

  toggle(e) {
    e.currentTarget.classList.toggle("fa-regular");
    e.currentTarget.classList.toggle("fa-solid");

    this.commentsDivTarget.classList.toggle("d-none");
  }
}
