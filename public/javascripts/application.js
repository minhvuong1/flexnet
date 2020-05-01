var up = document.querySelectorAll('.arrowup');
var down = document.querySelectorAll('.arrowdown');
var bookmark = document.querySelectorAll('.bookmark')


up.forEach(elem => elem.addEventListener("click", function(event) {
    for (i = 0; i < up.length; i++) {
        event.target.classList.add('arrow');
        down[i].classList.remove('arrow')
    }
}))

down.forEach(elem => elem.addEventListener("click", function(event) {
    for (i = 0; i < up.length; i++) {
        event.target.classList.add('arrow');
        up[i].classList.remove('arrow')
    }
}))    

bookmark.forEach(elem => elem.addEventListener("click", function(event) {
    if (event.target.classList.contains('far')) {
        event.target.classList.add('fas');
        event.target.classList.remove('far');
    } else {
        event.target.classList.add('far');
        event.target.classList.remove('fas');
    }
}))