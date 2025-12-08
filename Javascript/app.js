const cells = document.querySelectorAll('.cell');
const annonce = document.querySelector('.annonce');
const restart = document.getElementById('restart');

let turn = "X";
let isGameOver = false;

// Combinaisons gagnantes
const winCombinations = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
];

// Affiche un message
function showAnnonce(message) {
    annonce.textContent = message;
    annonce.classList.add("visible");
}

// Vérifie victoire / égalité
function checkWin() {
    for (let comb of winCombinations) {
        let [a,b,c] = comb;

        if (
            cells[a].textContent !== "" &&
            cells[a].textContent === cells[b].textContent &&
            cells[a].textContent === cells[c].textContent
        ) {
            isGameOver = true;
            cells[a].classList.add("win");
            cells[b].classList.add("win");
            cells[c].classList.add("win");
            showAnnonce(`🎉 Joueur ${cells[a].textContent} a gagné !`);
            return;
        }
    }

    // Match nul
    if (![...cells].some(cell => cell.textContent === "")) {
        isGameOver = true;
        showAnnonce("🤝 Match nul !");
    }
}

// Clique sur une case
cells.forEach((cell) => {
    cell.addEventListener('click', () => {
        if (cell.textContent !== "" || isGameOver) return;

        cell.textContent = turn;

        checkWin();

        turn = turn === "X" ? "O" : "X";
    });
});

// Bouton Rejouer
restart.addEventListener('click', () => {
    cells.forEach(cell => {
        cell.textContent = "";
        cell.classList.remove("win");
    });

    annonce.textContent = "";
    annonce.classList.remove("visible");

    turn = "X";
    isGameOver = false;
});
