/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._0_3_Elemarati_pages_control;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author cdc
 */
public class _002_manage_URL {

    private HttpServletRequest request;

    public _002_manage_URL(HttpServletRequest request) {
        this.request = request;
    }

    public String getAccessServlet() {
        String URL = request.getRequestURI();
        String URL2 = request.getContextPath();
        String current_page_accessServlet = (URL.substring(URL2.length() + 1, URL.length())).split(".jsp")[0] + "_AccessServlet";
        return current_page_accessServlet;
    }

}
