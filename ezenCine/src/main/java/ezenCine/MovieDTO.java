package ezenCine;

public class MovieDTO {
    private String id;
    private String title;
    private String title_eng;
    private String poster_url;
    private String slide_url;
    private String summary;
    private int runtime;
    private int open_year;
    private String open_date;
    private String close_date;
    private int audience;
    private String nation;
    private String genre;
    private String casting;
    private String director;
    private int like;
    private int limit_age;
    private int reviews_num;
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getTitle_eng() {
        return title_eng;
    }
    public void setTitle_eng(String title_eng) {
        this.title_eng = title_eng;
    }
    public String getPoster_url() {
        return poster_url;
    }
    public void setPoster_url(String poster_url) {
        this.poster_url = poster_url;
    }
    public String getSlide_url() {
        return slide_url;
    }
    public void setSlide_url(String slide_url) {
        this.slide_url = slide_url;
    }
    public String getSummary() {
        return summary;
    }
    public void setSummary(String summary) {
        this.summary = summary;
    }
    public int getRuntime() {
        return runtime;
    }
    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }
    public int getOpen_year() {
        return open_year;
    }
    public void setOpen_year(int open_year) {
        this.open_year = open_year;
    }
    public String getOpen_date() {
        return open_date;
    }
    public void setOpen_date(String open_date) {
        this.open_date = open_date;
    }
    public String getClose_date() {
        return close_date;
    }
    public void setClose_date(String close_date) {
        this.close_date = close_date;
    }
    public int getAudience() {
        return audience;
    }
    public void setAudience(int audience) {
        this.audience = audience;
    }
    public String getNation() {
        return nation;
    }
    public void setNation(String nation) {
        this.nation = nation;
    }
    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }
    public String getCasting() {
        return casting;
    }
    public void setCasting(String casting) {
        this.casting = casting;
    }
    public String getDirector() {
        return director;
    }
    public void setDirector(String director) {
        this.director = director;
    }
    public int getLike() {
        return like;
    }
    public void setLike(int like) {
        this.like = like;
    }
    public int getLimit_age() {
        return limit_age;
    }
    public void setLimit_age(int limit_age) {
        this.limit_age = limit_age;
    }
    public int getReviews_num() {
        return reviews_num;
    }
    public void setReviews_num(int reviews_num) {
        this.reviews_num = reviews_num;
    }
}