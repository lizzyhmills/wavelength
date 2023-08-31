import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-button"
export default class extends Controller {
  static targets = ["audio"]

  connect() {
    console.log("hello from play button")
  }

  play(event) {
    console.log("clicked play button");
    console.log(event.target);

    console.log(this.audioTarget)

    if (this.audioTarget.paused) {
      this.audioTarget.play();

      event.target.classList.remove("fa-play")
      event.target.classList.remove("fa-pause")

      event.target.classList.add("fa-pause")
      event.target.classList.remove("fa-play")
    } else {
      this.audioTarget.pause();

      event.target.classList.remove("fa-play")
      event.target.classList.remove("fa-pause")

      event.target.classList.remove("fa-pause")
      event.target.classList.add("fa-play")
    }

    if (this.audioTarget.ended) {
      this.audioTarget.play();
      event.target.classList.remove("fa-play")
      event.target.classList.remove("fa-pause")

      event.target.classList.add("fa-pause")
      event.target.classList.remove("fa-play")
    }
  };
}
