// Handle chip selection for category chips
document.addEventListener('DOMContentLoaded', function() {
  const chips = document.querySelectorAll('.chips .chip');
  
  chips.forEach(chip => {
    chip.addEventListener('click', function() {
      this.classList.toggle('active');
    });
  });
});
