const scrollTopBtn = document.querySelector('.scroll-to-top-btn')

window.addEventListener("scroll", () => 
{
    if (window.scrollY > 200) 
    {
        scrollTopBtn.classList.add("active");
    } else 
    {
        scrollTopBtn.classList.remove("active");
    }
});

scrollTopBtn.addEventListener("click", () => 
{
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
});