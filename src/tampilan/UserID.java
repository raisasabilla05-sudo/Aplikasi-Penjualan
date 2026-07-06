/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tampilan;

/**
 *
 * @author raisaaa
 */
public class UserID {
    private static String id;

    public static void setUserLogin(String kode){
        id = kode;
    }

    public static String getUserLogin(){
        return id;
    }
}
