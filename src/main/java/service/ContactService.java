package service;

import dao.ContactDAO;

public class ContactService
{
    private ContactDAO contactDAO;
    public ContactService()
    {
        this.contactDAO = new ContactDAO();
    }

    public boolean sendMessage(int userId, String name, String email, String phone, String subject, String message)
    {
        return this.contactDAO.sendMessage(userId, name, email, phone, subject, message);
    }



}
