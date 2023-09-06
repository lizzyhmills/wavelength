import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
export default class extends Controller {
  static targets = ["button", "likeCount"]
  connect() {
    console.log("hello from likes controller")
  }

  likeAction(event) {

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
          this.likeCountTarget.children[0].innerText = data.inserted_item
          this.buttonTarget.querySelector('i').classList.add('text-danger')
          this.buttonTarget.querySelector('i').classList.add('fa-solid')
          this.buttonTarget.querySelector('i').classList.remove('fa-regular')
          this.buttonTarget.href = data.delete_url
          this.buttonTarget.dataset.turboMethod = "DELETE"
          console.log("success!")
        } else {
          this.likeCountTarget.children[0].innerText -= 1
          this.buttonTarget.querySelector('i').classList.remove('text-danger')
          this.buttonTarget.querySelector('i').classList.remove('fa-solid')
          this.buttonTarget.querySelector('i').classList.add('fa-regular')
          this.buttonTarget.href = data.post_url
          this.buttonTarget.dataset.turboMethod = "POST"
          console.log("success!")
          console.log(data)
        }

      })
  }

}
