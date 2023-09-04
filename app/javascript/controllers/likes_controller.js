import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
export default class extends Controller {
  static targets = ["likeButton", "likesForm", "likesCount" , "redHeart", "wholePage"]

  likeForm(event) {
    // console.log(this.likeButtonTarget.action)
    // console.log(this.wholePageTarget)
    // console.log(this.likesFormTarget)
    // console.log(this.likesCountTarget.innerText)
    event.preventDefault()
    // console.log("TODO: send ajax request")

    fetch(this.likeButtonTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.likeButtonTarget),
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {

          this.wholePageTarget.outerHTML = data.inserted_item
          console.log("success!")
        }
      })
  }

  connect() {
    console.log("hello from likes controller")
  }
}
