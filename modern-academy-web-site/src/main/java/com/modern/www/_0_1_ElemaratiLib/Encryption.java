/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._0_1_ElemaratiLib;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mahmoud
 */
public class Encryption {

    public static void main(String[] args) {
        int x = 1;
        switch(x){
            case 1:
                String ench = new Encryption().enchrypt("123");
                System.out.println(ench);
                break;
            case 2:
                String dech = new Encryption().decrypt("412-765");
                System.out.println(dech);
                break;
        }
    }
    public String enchrypt(String real_password) {
        String enc_pass = "";
        byte b[] = real_password.getBytes();
        for (int i = 0; i < b.length / 2; i++) {
            long code = ((b[i] * 2 + 5) * 4);
            enc_pass += code + "-";
        }
        for (int i = b.length / 2; i < b.length; i++) {
            long code = ((b[i] * 3 + 6) * 5);
            enc_pass += (i < b.length - 1) ? code + "-" : code;
        }
        return enc_pass;
    }

    public String decrypt(String ench_password) {
        String Real_Pass = "";
        String ench_p_str[] = ench_password.split("-");
        for (int i = 0; i < ench_p_str.length / 2; i++) {
            Real_Pass += (char) ((byte) (((Long.parseLong(ench_p_str[i]) / 4) - 5) / 2));
        }
        for (int i = ench_p_str.length / 2; i < ench_p_str.length; i++) {
            Real_Pass += (char) ((byte) (((Long.parseLong(ench_p_str[i]) / 5) - 6) / 3));
        }
        return Real_Pass;
    }

    //////////////////////////////////////////////
    public String enchrypt_LIC(String real_password, String extraKey) {
        String enc_pass = "";
        List<String> ench_Pass_arr = new ArrayList<>();
        byte b[] = real_password.getBytes();
        for (int i = 0; i < b.length / 2; i++) {
            long code = ((b[i] * 2 + 5) * 4);
            //enc_pass += code + "-";
            ench_Pass_arr.add("" + code);
        }
        for (int i = b.length / 2; i < b.length; i++) {
            long code = ((b[i] * 3 + 6) * 5);
            //enc_pass += (i < b.length - 1) ? code + "-" : code;
            ench_Pass_arr.add("" + code);
        }
        List<String> temp_ench_Pass_arr = new ArrayList<>();
        // set ExtraKey
        int Mid = ((ench_Pass_arr.size() - 1) / 2) + 1;
        if (extraKey != null || !extraKey.equals("")) {
            for (int i = 0; i < ench_Pass_arr.size(); i++) {
                if (i == Mid) {
                    temp_ench_Pass_arr.add(extraKey);
                    temp_ench_Pass_arr.add(ench_Pass_arr.get(i));
                } else {
                    temp_ench_Pass_arr.add(ench_Pass_arr.get(i));
                }
            }
        }
        // لخبط
        ench_Pass_arr.clear();
        //Set Even Position First
        for (int i = 0; i < temp_ench_Pass_arr.size(); i += 2) {
            ench_Pass_arr.add(temp_ench_Pass_arr.get(i));
        }
        //Set Odd Position First
        for (int i = 1; i < temp_ench_Pass_arr.size(); i += 2) {
            ench_Pass_arr.add(temp_ench_Pass_arr.get(i));
        }
        // build String
        for (int i = 0; i < ench_Pass_arr.size(); i++) {
            enc_pass += (i < ench_Pass_arr.size() - 1) ? ench_Pass_arr.get(i) + "-" : ench_Pass_arr.get(i);
        }

        return enc_pass;
    }

    public List<String> decrypt_LIC(String ench_password) {
        String Real_Pass = "";
        String ench_p_str[] = ench_password.split("-");
        List<String> temp_ench_Pass_arr = new ArrayList<>();
        if (ench_p_str.length % 2 == 0) {
            String temp1[] = new String[ench_p_str.length / 2];
            int t = 0;
            for (int i = 0; i < (ench_p_str.length / 2); i++) {
                temp1[t] = ench_p_str[i];
                t++;
            }
            String temp2[] = new String[ench_p_str.length / 2];
            t = 0;
            for (int i = (ench_p_str.length / 2); i < ench_p_str.length; i++) {
                temp2[t] = ench_p_str[i];
                t++;
            }
            for (int i = 0; i < temp1.length; i++) {
                temp_ench_Pass_arr.add(temp1[i]);
                temp_ench_Pass_arr.add(temp2[i]);
            }
        } else {
            String temp1[] = new String[((ench_p_str.length - 1) / 2) + 1];
            int t = 0;
            for (int i = 0; i < (((ench_p_str.length - 1) / 2) + 1); i++) {
                temp1[t] = ench_p_str[i];
                t++;
            }
            String temp2[] = new String[((ench_p_str.length - 1) / 2)];
            t = 0;
            for (int i = (((ench_p_str.length - 1) / 2) + 1); i < ench_p_str.length; i++) {
                temp2[t] = ench_p_str[i];
                t++;
            }
            for (int i = 0; i < temp1.length; i++) {
                temp_ench_Pass_arr.add(temp1[i]);
                if (i < temp1.length - 1) {
                    temp_ench_Pass_arr.add(temp2[i]);
                }
            }
        }
        //"420-420-532-750-705-750-404-404-380-855-780"
        int Mid = (temp_ench_Pass_arr.size() - 1) / 2;
        String ExtraCode = temp_ench_Pass_arr.get(Mid);
        temp_ench_Pass_arr.remove(Mid);
        ench_password = "";

        for (int i = 0; i < temp_ench_Pass_arr.size(); i++) {
            ench_password += (i < temp_ench_Pass_arr.size() - 1) ? temp_ench_Pass_arr.get(i) + "-" : temp_ench_Pass_arr.get(i);
        }
        ench_p_str = ench_password.split("-");

        for (int i = 0; i < ench_p_str.length / 2; i++) {
            Real_Pass += (char) ((byte) (((Long.parseLong(ench_p_str[i]) / 4) - 5) / 2));
        }
        for (int i = ench_p_str.length / 2; i < ench_p_str.length; i++) {
            Real_Pass += (char) ((byte) (((Long.parseLong(ench_p_str[i]) / 5) - 6) / 3));
        }
        List<String> Result = new ArrayList<>();

        Result.add(ExtraCode);
        Result.add(Real_Pass);

        return Result;
    }
}
