package exception;

public enum LoginError {
    INVALID_USERNAME("User không tồn tại", false),
    WRONG_PASSWORD("Sai mật khẩu", false),
    NOT_VERIFIED("Tài khoản chưa được kích hoạt", false),
    NONE(null, true);

    private final String MESSAGE;
    private final boolean SUCCESSFUL;

    LoginError(String MESSAGE, boolean SUCCESSFUL) {
        this.MESSAGE = MESSAGE;
        this.SUCCESSFUL = SUCCESSFUL;
    }

    public String getMESSAGE() {
        return MESSAGE;
    }

    public boolean isSUCCESSFUL() {
        return SUCCESSFUL;
    }
}

