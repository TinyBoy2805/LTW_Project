document.addEventListener('DOMContentLoaded', () => {
    const stepForms = document.querySelectorAll('.reset-form');

    const navigateSteps = (currentFormId, nextStep) => {
        const currentForm = document.getElementById(currentFormId);
        const nextForm = document.getElementById(`reset-step-${nextStep}`);
        
        if (currentForm && nextForm) {
            currentForm.classList.remove('reset-form--active');
            currentForm.classList.add('reset-form--hidden');

            nextForm.classList.add('reset-form--active');
            nextForm.classList.remove('reset-form--hidden');
        }
    };

    stepForms.forEach(form => {
        form.addEventListener('submit', function(ev) {
            ev.preventDefault();

            const nextStep = this.querySelector('.submit-button')?.getAttribute('data-next-step'); // Gốc: .submit-btn
            
            if (nextStep) {
                navigateSteps(this.id, nextStep);
            } else if (this.id === 'reset-step-3') {
                window.location.href = './index.jsp';
            }
        });
    });

    const otpInputs = document.querySelectorAll('.otp-input-group__input');
    otpInputs.forEach((input, index) => {
        input.addEventListener('input', () => {
            if (input.value.length === input.maxLength && index < otpInputs.length - 1) {
                otpInputs[index + 1].focus();
            }
        });
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace' && input.value.length === 0 && index > 0) {
                otpInputs[index - 1].focus();
            }
        });
    });
});