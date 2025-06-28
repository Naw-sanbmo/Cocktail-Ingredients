import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["popup"]

  connect() {
    console.log("connected");

  }

  toggle() {

    this.popupTarget.classList.toggle("d-none");
  }
}
