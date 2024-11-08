/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        console.log(entry);
        if (entry.isIntersecting) {
            entry.target.classList.add('show');
        }else{
            entry.target.classList.remove('show');
        }
    });
});
const hiddenElements = document.querySelectorAll(".hidden");
hiddenElements.forEach((el) => observer.observe(el));


window.addEventListener("scroll", function () {
    var header = document.querySelector(".header-container");
    
    if (window.scrollY > 50) { // If scrolled more than 50px
        header.classList.add("scrolled"); // Add the "scrolled" class
    } else {
        header.classList.remove("scrolled"); // Remove the "scrolled" class when at the top
    }
});

