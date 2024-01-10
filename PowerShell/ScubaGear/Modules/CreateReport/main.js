function colorRows() {
    let rows = document.querySelectorAll('tr');
    for (let i = 0; i < rows.length; i++) {
        if (rows[i].children[1].innerHTML == "Fail") {
            rows[i].style.background = "#deb8b8";
        }
        else if (rows[i].children[1].innerHTML == "Warning") {
            rows[i].style.background = "#fff7d6";
        }
        else if (rows[i].children[1].innerHTML == "Pass") {
            rows[i].style.background = "#d5ebd5";
        }
        else if (rows[i].children[2].innerHTML.includes("Not-Implemented")) {
            rows[i].style.background = "#ebebf2";
        }
        else if (rows[i].children[2].innerHTML.includes("3rd Party")) {
            rows[i].style.background = "#ebebf2";
        }
        else if (rows[i].children[1].innerHTML.includes("Error")) {
            rows[i].style.background = "#deb8b8";
            rows[i].querySelectorAll('td')[1].style.borderColor = "black";
            rows[i].querySelectorAll('td')[1].style.color = "#d10000";
        }
    }
}

window.addEventListener('DOMContentLoaded', (event) => {
    colorRows();
});