import { Controller } from "stimulus"

const baby = document.getElementById("baby")
const toddler = document.getElementById("toddler")
const pres = document.getElementById("pres")
const initFocus = () => {
  if (window.location.search === "?preschooler_scope=preschool") {
    pres.classList.add("focus-btn")
    console.log(pres.classList)
  }
}

export default class extends Controller {
  static targets = ["form", "list", "searchInput"]

  update() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
      initFocus()
  }
}
