var slideIndex = 1;
var slides = document.getElementsByClassName("promo-slide");
showSlide(slideIndex);

function showSlide(n) {
    var i;
    if (n > slides.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = slides.length;
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex - 1].style.display = "flex";
}

function switchSlide(n) {
    showSlide(slideIndex += n);
}