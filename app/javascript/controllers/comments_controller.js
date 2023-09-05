import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["commentsDiv", "editCard"]

  toggleComments(e) {
    this.commentsDivTarget.classList.toggle("d-none")
    this.editCardTarget.classList.add("d-none")
    e.currentTarget.classList.toggle("fa-solid");
    e.currentTarget.classList.toggle("fa-regular");
  }

  toggleEdit(e) {
    this.editCardTarget.classList.toggle("d-none")
    this.commentsDivTarget.classList.add("d-none")
    e.currentTarget.classList.toggle("white");
  }

  connect() {
    console.log("hi")
  }


}
