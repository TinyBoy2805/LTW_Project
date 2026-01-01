document.addEventListener('DOMContentLoaded', () => {
    const forms = document.querySelectorAll('.reset-form');

    forms.forEach(form => {
        form.addEventListener('submit', function (ev) {
            const hasError = document.querySelector(".text-danger");
            if(hasError){ ev.preventDefault(); }
        });
    });

    const step1 = document.getElementById("verify-step-1"); // OTP
    const step2 = document.getElementById("verify-step-2"); // Change email
    const step3 = document.getElementById("verify-step-3"); // Success

    const btnOpenChangeEmail = document.getElementById("open-change-email");
    const btnBack = document.getElementById("back-to-otp");

    //  change email
    if (btnOpenChangeEmail) {
        btnOpenChangeEmail.onclick = () => {
            step1.classList.add("reset-form--hidden");
            step1.classList.remove("reset-form--active");
            step2.classList.remove("reset-form--hidden");
            step2.classList.add("reset-form--active");
        };
    }

    // return to otp form
    if (btnBack) {
        btnBack.onclick = () => {
            step2.classList.add("reset-form--hidden");
            step2.classList.remove("reset-form--active");
            step1.classList.remove("reset-form--hidden");
            step1.classList.add("reset-form--active");
        };
    }

    // otp correct -> step 3
    if (document.body.dataset.verifiedsuccess === "true") {
        step1.classList.add("reset-form--hidden");
        step1.classList.remove("reset-form--active");
        step3.classList.remove("reset-form--hidden");
        step3.classList.add("reset-form--active");
    }

    // server change email -> return to step 1
    if (document.body.dataset.emailchange === "true") {
        step2.classList.add("reset-form--hidden");
        step2.classList.remove("reset-form--active");
        step1.classList.remove("reset-form--hidden");
        step1.classList.add("reset-form--active");
    }
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