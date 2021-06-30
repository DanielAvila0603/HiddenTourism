/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.conexionDB;

import java.io.FileReader;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author SEBASTIAN
 */
public class ConfigDB {
    public static String readConfig(final String path, String key){
        String value = null;
        try {
            JSONParser parser = new JSONParser();
            Object object =  parser.parse(new FileReader(path));
            
            JSONObject config = (JSONObject) object;
            value = (String) config.get(key);
        } catch (Exception e) {
            System.out.println(value);
        }
        return value;
    }
}
