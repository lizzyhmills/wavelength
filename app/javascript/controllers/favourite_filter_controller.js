import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite-filter"
export default class extends Controller {
  static targets = ["form", "saved", "button"]

  connect() {
    console.log("hello from faves")
  }

  favAction(event) {

    event.preventDefault()

    // console.log("TODO: send ajax request"
    fetch(this.buttonTarget.href, {
      method: this.buttonTarget.dataset.turboMethod,
      headers: { "Accept": "application/json" },
      // body: new FormData(this.likeButtonTarget),
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          this.buttonTarget.querySelector('i').classList.add('fa-solid')
          this.buttonTarget.querySelector('i').classList.remove('fa-regular')
          this.buttonTarget.href = data.delete_url
          this.buttonTarget.dataset.turboMethod = "DELETE"
          console.log("success!")
        } else {
          this.buttonTarget.querySelector('i').classList.remove('fa-solid')
          this.buttonTarget.querySelector('i').classList.add('fa-regular')
          this.buttonTarget.href = data.post_url
          this.buttonTarget.dataset.turboMethod = "POST"
          console.log("success!")
          console.log(data)
        }

      })
  }

  click() {
    console.log("hello")
    this.formTarget.classList.toggle("d-none")
    this.savedTarget.classList.toggle("d-none")
  }
}
