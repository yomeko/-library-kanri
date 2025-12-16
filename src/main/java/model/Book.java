package model;

/**
 * 書籍情報を保持するJavaBeans
 */
public class Book {
    private String name;
    private int number;

    public Book(String name, int number) {
        this.name = name;
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public int getNumber() {
        return number;
    }
}
