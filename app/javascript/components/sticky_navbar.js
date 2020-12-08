const stickyNavbarRoll = () => {
// When the user scrolls the page, execute myFunction
  window.onscroll = function() {stickNavbar()};

  // Get the navbar
  var navbar = document.getElementById("nvbr");

  // Get the offset position of the navbar
  var sticky = navbar.offsetTop;

  // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
  function stickNavbar() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }
}

export { stickyNavbarRoll };
