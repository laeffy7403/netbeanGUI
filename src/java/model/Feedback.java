package model;

public class Feedback {
    private String username;
    private String email;
    private String description;
    private int rating;

    public Feedback() {}

    public Feedback(String username, String email, String description, int rating) {
        this.username = username;
        this.email = email;
        this.description = description;
        this.rating = rating;
    }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
}
