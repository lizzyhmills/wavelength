import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow"
export default class extends Controller {
  static targets = ["followers", "following", "pending", "followersButton", "followingButton", "pendingButton"]
  connect() {
    console.log('hello from follow controller')
  }

  showFollowers() {
    console.log('clicked')
    this.followersTarget.classList.remove('d-none')
    this.followingTarget.classList.add('d-none')
    this.pendingTarget.classList.add('d-none')
    this.followersButtonTarget.classList.add('small-button-green')
    this.followersButtonTarget.classList.remove('small-button-white')
    this.followingButtonTarget.classList.remove('small-button-green')
    this.followingButtonTarget.classList.add('small-button-white')
    this.pendingButtonTarget.classList.remove('small-button-green')
    this.pendingButtonTarget.classList.add('small-button-white')
  }

  showFollowing() {
    console.log('clicked')
    this.followingTarget.classList.remove('d-none')
    this.followersTarget.classList.add('d-none')
    this.pendingTarget.classList.add('d-none')
    this.followersButtonTarget.classList.remove('small-button-green')
    this.followersButtonTarget.classList.add('small-button-white')
    this.followingButtonTarget.classList.add('small-button-green')
    this.followingButtonTarget.classList.remove('small-button-white')
    this.pendingButtonTarget.classList.remove('small-button-green')
    this.pendingButtonTarget.classList.add('small-button-white')
  }

  showPending() {
    console.log('clicked')
    this.pendingTarget.classList.remove('d-none')
    this.followersTarget.classList.add('d-none')
    this.followingTarget.classList.add('d-none')
    this.pendingButtonTarget.classList.add('small-button-green')
    this.pendingButtonTarget.classList.remove('small-button-white')
    this.followersButtonTarget.classList.remove('small-button-green')
    this.followersButtonTarget.classList.add('small-button-white')
    this.followingButtonTarget.classList.remove('small-button-green')
    this.followingButtonTarget.classList.add('small-button-white')
  }
}
