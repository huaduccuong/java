/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Course;
import java.util.Vector;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class Course_DAO {

    private Vector<Course> courses;

    public Course_DAO(Vector<Course> vector) {
        this.courses = vector;
    }

    public Course checkCourseDuplicate(String code) {
        for (Course course : courses) {
            if (course.getCode().equals(code)) {
                return course;
            }
        }
        return null;
    }

    public boolean addCourse(Course course) {
        int firstValue = courses.size();
        courses.add(course);
        int secondValue = courses.size();
        if (firstValue < secondValue) {
            return true;
        }
        return false;
    }

    public boolean checkInputValues(String code, int mark) {
        return (Pattern.matches("^[A-Z0-9]+$", code) && mark == 1)
                || (Pattern.matches("^[A-Za-z]+(\\ [A-Za-z]+)*$", code) && mark == 2)
                || (Pattern.matches("^[0-9]+$", code) && mark == 3);
    }

    public String checkFormatString(String string) {
        String newString = "";
        newString += String.valueOf((string.charAt(0))).toUpperCase();
        for (int i = 0; i < string.length(); i++) {
            if (string.charAt(i) == ' ') {
                newString += " ";
                newString += String.valueOf(string.charAt(i + 1)).toUpperCase();
                i++;
                continue;
            }
            newString += String.valueOf(string.charAt(i)).toLowerCase();
        }
        return newString;
    }
}
