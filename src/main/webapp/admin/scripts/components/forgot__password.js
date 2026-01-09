//otp input
const otpInputs = document.querySelectorAll('.otp-input-group__input');
otpInputs.forEach((input, i) => {
    input.addEventListener('input', () => {
        if (input.value && i < otpInputs.length - 1) otpInputs[i + 1].focus();
    });
    input.addEventListener('keydown', (e) => {
        if (e.key === 'Backspace' && !input.value && i > 0) otpInputs[i - 1].focus();
    });
});