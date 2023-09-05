import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="commentsajax"
export default class extends Controller {
  static targets = ["container", "form"]
  connect() {


  }
  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          this.containerTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.reset();
      })
  }
}
