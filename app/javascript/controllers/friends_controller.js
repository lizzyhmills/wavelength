import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["suggestions", "friends", "requests", "nudge", "suggestionButton", "friendsButton", "requestsButton"]

  connect() {
    console.log('hello from friends controller')
  }

  // refactored so don't have to repeat myself

  setActive(target, button) {
    this.suggestionsTarget.classList.add('d-none')
    this.friendsTarget.classList.add('d-none')
    this.requestsTarget.classList.add('d-none')
    this.suggestionButtonTarget.classList.add('medium-button-white')
    this.suggestionButtonTarget.classList.remove('medium-button-green')
    this.friendsButtonTarget.classList.add('medium-button-white')
    this.friendsButtonTarget.classList.remove('medium-button-green')
    this.requestsButtonTarget.classList.add('medium-button-white')
    this.requestsButtonTarget.classList.remove('medium-button-green')

    target.classList.remove('d-none')
    button.classList.remove('medium-button-white')
    button.classList.add('medium-button-green')
  }

  showSuggestions() {
    this.setActive(this.suggestionsTarget, this.suggestionButtonTarget);
  }

  showFriends() {
    this.setActive(this.friendsTarget, this.friendsButtonTarget);
  }

  showRequests() {
    this.setActive(this.requestsTarget, this.requestsButtonTarget);
  }

  nudge(event) {
    event.preventDefault();
    this.nudgeTarget.innerText = "nudged!";
    this.nudgeTarget.classList.remove('small-button-pink');
    this.nudgeTarget.classList.add('small-button-green');
  }

// old code to help understand the refactoring

//   showSuggestions() {
//     this.suggestionsTarget.classList.remove('d-none')
//     this.friendsTarget.classList.add('d-none')
//     this.requestsTarget.classList.add('d-none')
//     this.suggestionButtonTarget.classList.remove('medium-button-white')
//     this.suggestionButtonTarget.classList.add('medium-button-green')
//     this.friendsButtonTarget.classList.add('medium-button-white')
//     this.friendsButtonTarget.classList.remove('medium-button-green')
//     this.requestsButtonTarget.classList.add('medium-button-white')
//     this.requestsButtonTarget.classList.remove('medium-button-green')

//   }

//   showFriends() {
//     this.friendsTarget.classList.remove('d-none')
//     this.suggestionsTarget.classList.add('d-none')
//     this.requestsTarget.classList.add('d-none')
//     this.friendsButtonTarget.classList.remove('medium-button-white')
//     this.friendsButtonTarget.classList.add('medium-button-green')
//     this.suggestionButtonTarget.classList.remove('medium-button-green')
//     this.suggestionButtonTarget.classList.add('medium-button-white')
//     this.requestsButtonTarget.classList.remove('medium-button-green')
//     this.requestsButtonTarget.classList.add('medium-button-white')

//   }

//   showRequests() {
//     this.requestsTarget.classList.remove('d-none')
//     this.friendsTarget.classList.add('d-none')
//     this.suggestionsTarget.classList.add('d-none')
//     this.requestsButtonTarget.classList.remove('medium-button-white')
//     this.requestsButtonTarget.classList.add('medium-button-green')
//     this.suggestionButtonTarget.classList.remove('medium-button-green')
//     this.suggestionButtonTarget.classList.add('medium-button-white')
//     this.friendsButtonTarget.classList.remove('medium-button-green')
//     this.friendsButtonTarget.classList.add('medium-button-white')
//   }

//   nudge(event) {
//     event.preventDefault()
//     this.nudgeTarget.innerText = "nudged!"
//     this.nudgeTarget.classList.remove('small-button-pink')
//     this.nudgeTarget.classList.add('small-button-green')
//   }

// }



}
