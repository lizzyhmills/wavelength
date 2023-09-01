import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-user-post"
export default class extends Controller {
  static targets = ["editCard"]

  connect() {
    console.log("edit comment")
  }

  edit() {
    console.log("action fired")
    this.editCardTarget.classList.toggle("d-none");
  }

}
