let oscuro = false;
function toggle() {
    let bodyClr, bodyBgn, toggleBgn, toggleClr, toggleTextClr, invert;
    if (oscuro) {
        bodyClr = "grey";
        bodyBgn = "rgb(219, 219, 219)";
        toggleBgn = "white";
        toggleClr = "lightgray";
        toggleTextClr = "black";
        invert = "invert(1)"
    }
    else {
        bodyClr = "rgb(230, 230, 230)";
        bodyBgn = "rgb(39, 39, 39)";
        toggleBgn = "rgb(19, 19, 19)";
        toggleClr = "black";
        toggleTextClr = "rgb(170, 170, 170)";
        invert = "invert(0)"
    }

    let body = document.querySelector("body");
    body.style.color = bodyClr;
    body.style.backgroundColor = bodyBgn;
    let items = document.querySelectorAll(".item");
    for(item of items){ item.style.backgroundColor = toggleBgn; 
                        item.style.borderColor = toggleClr }
    h1 = body.querySelector("h1");
    h1.style.backgroundColor = toggleBgn;
    h1.style.color= toggleTextClr;
    h1.style.borderColor = toggleClr;
    document.querySelector("button").style.filter = invert;
    oscuro = !oscuro;
}
