var up = document.querySelector('.arrowup');
var down = document.querySelector('.arrowdown');
var bookmark = document.querySelector('.bookmark')


up.addEventListener("click", function() {
    up.classList.add('arrow');
    down.classList.remove('arrow')
})

down.addEventListener("click", function() {
    down.classList.add('arrow');
    up.classList.remove('arrow');
})    

bookmark.addEventListener("click", function(event) {
    if (event.target.classList.contains('far')) {
        event.target.classList.add('fas');
        event.target.classList.remove('far');
    } else {
        event.target.classList.add('far');
        event.target.classList.remove('fas');
    }
})