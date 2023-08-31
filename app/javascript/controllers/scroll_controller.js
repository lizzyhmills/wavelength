import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["card", "arrow"];

  connect() {
  }

  move(event) {
    console.log(event);
    console.log(this.cardTarget);
    console.log(this.arrowTarget);
    const direction = this.arrowTarget.dataset.direction || "right";
    const distance = parseInt(this.arrowTarget.dataset.distance, 10) || 200;

    const scrollDistance = direction === "right" ? -distance : distance;

    this.cardsTarget.scrollBy({
      right: scrollDistance,
      behavior: "smooth",
    });
  }

}
