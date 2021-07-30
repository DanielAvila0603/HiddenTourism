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
