// Toggle Navbar Menu on Mobile
document.addEventListener('DOMContentLoaded', () => {
    const navbarMenu = document.querySelector('.navbar-menu');
    const navbarToggle = document.querySelector('.navbar-toggle');

    navbarToggle.addEventListener('click', () => {
        navbarMenu.classList.toggle('active');
        navbarToggle.classList.toggle('active');
    });
});
