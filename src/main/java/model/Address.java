package model;

import java.io.Serializable;

public class Address implements Serializable {
    private int id;
    private int userId;
    private String houseNumber;
    private String road;
    private String district;
    private String city;
    private String hamlet;
    private String ward;

    public Address() {}

    public Address(int id, int userId, String houseNumber, String road, String district, String city, String hamlet, String ward) {
        this.id = id;
        this.userId = userId;
        this.houseNumber = houseNumber;
        this.road = road;
        this.district = district;
        this.city = city;
        this.hamlet = hamlet;
        this.ward = ward;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getHouseNumber() { return houseNumber; }
    public void setHouseNumber(String houseNumber) { this.houseNumber = houseNumber; }

    public String getRoad() { return road; }
    public void setRoad(String road) { this.road = road; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getHamlet() { return hamlet; }
    public void setHamlet(String hamlet) { this.hamlet = hamlet; }

    public String getWard() { return ward; }
    public void setWard(String ward) { this.ward = ward; }
}
