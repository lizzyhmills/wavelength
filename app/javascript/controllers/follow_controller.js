import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow"
export default class extends Controller {
  static targets = ["followers", "following", "followersButton", "followingButton"]
  connect() {
    console.log('hello from follow controller')
  }

  showFollowers() {
    console.log('clicked')
    this.followersTarget.classList.remove('d-none')
    this.followingTarget.classList.add('d-none')
    this.followersButtonTarget.classList.add('small-button-green')
    this.followersButtonTarget.classList.remove('small-button-pink')
    this.followingButtonTarget.classList.remove('small-button-green')
    this.followingButtonTarget.classList.add('small-button-pink')
  }

  showFollowing() {
    console.log('clicked')
    this.followingTarget.classList.remove('d-none')
    this.followersTarget.classList.add('d-none')
    this.followersButtonTarget.classList.remove('small-button-green')
    this.followersButtonTarget.classList.add('small-button-pink')
    this.followingButtonTarget.classList.add('small-button-green')
    this.followingButtonTarget.classList.remove('small-button-pink')
  }
}
