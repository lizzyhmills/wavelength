import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite-filter"
export default class extends Controller {
  static targets = ["fav"]

  connect() {
    console.log("hello from favourites controller")
    console.log(this.favTarget)
  }

  favAction(event) {

    event.preventDefault()

    // console.log("TODO: send ajax request"
    fetch(this.favTarget.href, {
      method: this.favTarget.dataset.turboMethod,
      headers: { "Accept": "application/json" },
      // body: new FormData(this.likefavTarget),
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.delete_url) {
          this.favTarget.querySelector('i').classList.add('fa-solid')
          this.favTarget.querySelector('i').classList.remove('fa-regular')
          this.favTarget.href = data.delete_url
          this.favTarget.dataset.turboMethod = "DELETE"
          console.log("success!")
        } else {
          this.favTarget.querySelector('i').classList.remove('fa-solid')
          this.favTarget.querySelector('i').classList.add('fa-regular')
          this.favTarget.href = data.post_url
          this.favTarget.dataset.turboMethod = "POST"
          console.log("success!")
          console.log(data)
        }

      })
  }


}
