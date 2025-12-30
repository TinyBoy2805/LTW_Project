document.addEventListener('DOMContentLoaded', () => {
    const forms = document.querySelectorAll('.reset-form');

    forms.forEach(form => {
        form.addEventListener('submit', function(ev) {
            const step = this.querySelector('.submit-button')?.getAttribute('data-next-step');

            //if verify is completed -> Verified layout
            if (step === "2" && !document.querySelector(".text-danger")) {
                return;
            }

            ev.preventDefault(); //have error -> keep this page
        });
    });

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
});