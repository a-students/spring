package com.bean;

/**
 * @author chen
 * @date 2019/5/16--22:12
 */
public class color {
    private String color;

    public color() {
        super();
    }

    public color(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "color{" +
                "color='" + color + '\'' +
                '}';
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
