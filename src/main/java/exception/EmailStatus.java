package exception;

public enum EmailStatus {
    SENT,           //Email accepted by SMTP -> likely valid
    NOT_EXIST,      //SMTP 550 -> mailbox not found -> likely fake
    REJECTED,       //Server refused but not confirmed fake
    ERROR           //Network/SMTP/system error
}
