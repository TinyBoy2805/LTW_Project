document.addEventListener('DOMContentLoaded', () => {
    // Selector cho Block: .reset-form
    const stepForms = document.querySelectorAll('.reset-form');

    // Hàm chuyển đổi giữa các bước form
    const navigateSteps = (currentFormId, nextStep) => {
        const currentForm = document.getElementById(currentFormId);
        const nextForm = document.getElementById(`reset-step-${nextStep}`);
        
        if (currentForm && nextForm) {
            // Loại bỏ class Modifier: .active và thêm .hidden
            currentForm.classList.remove('reset-form--active'); // Gốc: .active
            currentForm.classList.add('reset-form--hidden');    // Gốc: .hidden
            
            // Thêm class Modifier: .active và loại bỏ .hidden
            nextForm.classList.add('reset-form--active');      // Gốc: .active
            nextForm.classList.remove('reset-form--hidden');   // Gốc: .hidden
        }
    };

    stepForms.forEach(form => {
        form.addEventListener('submit', function(ev) {
            ev.preventDefault();

            // Selector cho Block: .submit-button
            const nextStep = this.querySelector('.submit-button')?.getAttribute('data-next-step'); // Gốc: .submit-btn
            
            if (nextStep) {
                navigateSteps(this.id, nextStep);
            } else if (this.id === 'reset-step-3') {
                // Bước cuối cùng: Chuyển hướng về trang đăng nhập
                window.location.href = './index.html';
            }
        });
    });

    // Xử lý input OTP: tự động chuyển focus
    // Selector cho Element: .otp-input-group__input
    const otpInputs = document.querySelectorAll('.otp-input-group__input'); // Gốc: .otp-input
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