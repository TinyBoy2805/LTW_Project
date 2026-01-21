package model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ValidateObject
{
    private String usernameError;
    private String emailError;
    private String phoneError;
    private String passwordError;
    private String confirmPasswordError;

    public boolean hasError()
    {
        return usernameError != null || emailError != null ||
                phoneError != null || passwordError != null ||
                confirmPasswordError != null;
    }




}
