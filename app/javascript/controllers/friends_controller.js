import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["suggestions", "friends", "requests", "nudge", "suggestionButton", "friendsButton", "requestsButton"]
  connect() {
    console.log('hello from friends controller')


  }

  showSuggestions() {
    this.suggestionsTarget.classList.remove('d-none')
    this.friendsTarget.classList.add('d-none')
    this.requestsTarget.classList.add('d-none')
    this.suggestionButtonTarget.classList.remove('medium-button-white')
    this.suggestionButtonTarget.classList.add('medium-button-green')
    this.friendsButtonTarget.classList.add('medium-button-white')
    this.friendsButtonTarget.classList.remove('medium-button-green')
    this.requestsButtonTarget.classList.add('medium-button-white')
    this.requestsButtonTarget.classList.remove('medium-button-green')

  }

  showFriends() {
    this.friendsTarget.classList.remove('d-none')
    this.suggestionsTarget.classList.add('d-none')
    this.requestsTarget.classList.add('d-none')
    this.friendsButtonTarget.classList.remove('medium-button-white')
    this.friendsButtonTarget.classList.add('medium-button-green')
    this.suggestionButtonTarget.classList.remove('medium-button-green')
    this.suggestionButtonTarget.classList.add('medium-button-white')
    this.requestsButtonTarget.classList.remove('medium-button-green')
    this.requestsButtonTarget.classList.add('medium-button-white')

  }

  showRequests() {
    this.requestsTarget.classList.remove('d-none')
    this.friendsTarget.classList.add('d-none')
    this.suggestionsTarget.classList.add('d-none')
    this.requestsButtonTarget.classList.remove('medium-button-white')
    this.requestsButtonTarget.classList.add('medium-button-green')
    this.suggestionButtonTarget.classList.remove('medium-button-green')
    this.suggestionButtonTarget.classList.add('medium-button-white')
    this.friendsButtonTarget.classList.remove('medium-button-green')
    this.friendsButtonTarget.classList.add('medium-button-white')
  }

  nudge(event) {
    event.preventDefault()
    this.nudgeTarget.innerText = "nudged!"
    this.nudgeTarget.classList.remove('small-button-pink')
    this.nudgeTarget.classList.add('small-button-green')
  }

}
