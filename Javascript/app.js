const connectButton = document.querySelector("#connect-button");
console.log(connectButton)
const main = document.querySelector("main")
let count = 0;

function addtext() {
    count++;
    let newText = document.createElement("p")
    newText.classList.add("js-zone");
    if (count % 2 == 0) {
        newText.style.color = "red"
    }

    if (count <= 10) {
        newText.innerHTML = `tentatives ${count}`
    } else {
        newText.innerHTML = `cest pas fini`
        connectButton.removeEventListener("click", addtext)

    }
    main.appendChild(newText)
}

connectButton.addEventListener('click', addtext)