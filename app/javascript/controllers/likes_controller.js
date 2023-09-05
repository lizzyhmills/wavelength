import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
export default class extends Controller {
  static targets = ["likeButton", "likeContainter", "filledLike", "likeCount", "unlikeButton", "reLike", "disableButton", "unlikeButton"]

  likeForm(event) {
    // console.log(this.likeButtonTarget)
    // console.log(this.filledLikeTarget)
    console.log(this.likeCountTarget.children[0].innerText)
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
          this.likeCountTarget.children[0].innerText = data.inserted_item
          console.log(data.inserted_item)
          // this.disableButtonTarget.disabled = true
          // this.unlikeButtonTarget.classList.remove("d-none")
          this.filledLikeTarget.classList.remove("fa-regular")
          this.filledLikeTarget.classList.add("fa-solid")
          this.filledLikeTarget.classList.add("text-danger")

          // console.log(this.likeContainerTarget)
          console.log(data)

          console.log("success!")
        }

      })
  }

  unlikeForm(event) {
    event.preventDefault();
    // console.log("unliking in progress");
    // console.log(this.unlikeButtonTarget)
    console.log(this.reLikeTarget.classList)
    this.unlikeButtonTarget.classList.add("text-primary")
    // console.log(this.likeButtonTarget)
    // console.log(this.filledLikeTarget)
    // console.log(this.likeCountTarget.children[0].innerText)
    // console.log(this.wholePageTarget)
    // console.log(this.likesFormTarget)
    // console.log(this.likesCountTarget.innerText)

    // console.log("TODO: send ajax request")
    fetch(this.unlikeButtonTarget.action, {
      method: "DELETE",
      headers: { "Accept": "application/json" },
      body: new FormData(this.unlikeButtonTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          console.log(data)
          this.likeCountTarget.children[0].innerText -= 1
          this.unlikeButtonTarget.classList.add("text-success")



          // console.log(this.likeContainerTarget)
          console.log(data)

          console.log("success!")
        }

      })

  }

  connect() {
    console.log("hello from likes controller")
  }
}
