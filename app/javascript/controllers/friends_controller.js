import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["suggestions", "friends", "requests", "nudge"]
  connect() {
    console.log('hello from friends controller')
    console.log(this.suggestionsTarget)
  }

  showSuggestions() {
    this.suggestionsTarget.classList.remove('d-none')
    this.friendsTarget.classList.add('d-none')
    this.requestsTarget.classList.add('d-none')
  }

  showFriends() {
    this.friendsTarget.classList.remove('d-none')
    this.suggestionsTarget.classList.add('d-none')
    this.requestsTarget.classList.add('d-none')
  }

  showRequests() {
    this.requestsTarget.classList.remove('d-none')
    this.friendsTarget.classList.add('d-none')
    this.suggestionsTarget.classList.add('d-none')
  }

  nudge(event) {
    event.preventDefault()
    this.nudgeTarget.innerText = "nudged!"
    this.nudgeTarget.classList.remove('small-button-pink')
    this.nudgeTarget.classList.add('small-button-green')
  }

}
