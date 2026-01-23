package exception;

public enum RegisterError {
    PASSWORD_MISMATCH("Mật khẩu không khớp"),
    EMAIL_EXIST("Email đã tồn tại"),
    INVALID_EMAIL_FORMAT("Định dạng email không phù hợp"),
    WEAK_PASSWORD("Mật khẩu phải từ 8 ký tự và chứa chữ, số, ký tự đặc biệt"),
    PHONE_ISVALID("Số điện thoại không hợp lệ"),
    NONE(null);

    private final String MESSAGE;

    RegisterError(String MESSAGE) {
        this.MESSAGE = MESSAGE;
    }

    public String getMESSAGE() { return this.MESSAGE; }
}
