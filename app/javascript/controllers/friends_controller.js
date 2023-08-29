import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["suggestions", "friends", "requests"]
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

}
