package model;

import java.io.Serializable;

public class Address implements Serializable {
    private long id;
    private long userId;
    private String houseNumber;
    private String road;
    private String district;
    private String city;

    public Address() {}

    public Address(long id, long userId, String houseNumber, String road, String district, String city) {
        this.id = id;
        this.userId = userId;
        this.houseNumber = houseNumber;
        this.road = road;
        this.district = district;
        this.city = city;
    }

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }

    public String getHouseNumber() { return houseNumber; }
    public void setHouseNumber(String houseNumber) { this.houseNumber = houseNumber; }

    public String getRoad() { return road; }
    public void setRoad(String road) { this.road = road; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
}
