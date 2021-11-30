const baby = document.getElementById("baby")
const toddler = document.getElementById("toddler")
const pres = document.getElementById("pres")
const initFocus = () => {
  if (window.location.search === "?preschooler_scope=preschool") {
    pres.classList.add("focus-btn")
    console.log(pres.classList)
  }
}

export{initFocus};

URLSearchParams
