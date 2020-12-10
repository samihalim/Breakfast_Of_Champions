var animateButton = function(e) {
  e.preventDefault(); // prevents redirect
  e.target.classList.remove('animate'); // reset animation

  e.target.classList.add('animate'); // start animation
  setTimeout(function(){
    e.target.classList.remove('animate'); // reset animation after 0.7s
    window.location.href = e.target.href; // redirect
  },700);
};

var animateButtons = function() {
  var bubblyButtons = document.getElementsByClassName("bubbly-button");

  for (var i = 0; i < bubblyButtons.length; i++) {
    bubblyButtons[i].addEventListener('click', animateButton, false);
  }
}

export { animateButtons }
