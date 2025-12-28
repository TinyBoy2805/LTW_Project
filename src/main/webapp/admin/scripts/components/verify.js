document.addEventListener('DOMContentLoaded', () => {
    const forms = document.querySelectorAll('.reset-form');

    forms.forEach(form => {
        form.addEventListener('submit', function(ev) {
            ev.preventDefault();
            const step = this.querySelector('.submit-button')?.getAttribute('data-next-step');
            if (step === "2") {
                document.getElementById("verify-step-1").classList.add("reset-form--hidden");
                document.getElementById("verify-step-2").classList.remove("reset-form--hidden");
            }
        });
    });

    const otpInputs = document.querySelectorAll('.otp-input-group__input');
    otpInputs.forEach((input, i) => {
        input.addEventListener('input', () => {
            if (input.value && i < otpInputs.length - 1) otpInputs[i + 1].focus();
        });
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace' && !input.value && i > 0) otpInputs[i - 1].focus();
        });
    });
});