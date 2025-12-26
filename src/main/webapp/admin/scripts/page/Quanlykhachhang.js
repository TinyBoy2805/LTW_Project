// Toggle switch functionality for account lock
document.querySelectorAll('.toggle-switch').forEach(toggleSwitch => {
  const toggleInput = toggleSwitch.querySelector('.toggle-input');
  const toggleSlider = toggleSwitch.querySelector('.toggle-slider');
  
  toggleSlider.addEventListener('click', () => {
    toggleInput.checked = !toggleInput.checked;
  });
});
