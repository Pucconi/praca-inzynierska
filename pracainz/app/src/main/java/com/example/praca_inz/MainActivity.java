package com.example.praca_inz;

import androidx.appcompat.app.AppCompatActivity;

import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class MainActivity extends AppCompatActivity {

    ArrayList<String> sandwiches = new ArrayList<String>();

    private static final String url = "jdbc:mysql://192.168.17.105:3306/testowa";
    private static final String user = "aplikacja_back";
    private static final String pass = "J234re5GT4s2agAv";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        testDB();
    }

    public void testDB(){
        TextView tv = (TextView) this.findViewById(R.id.tx1);
        try{
            StrictMode.ThreadPolicy policy =
                    new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,user,pass);

            String result = "Database conection success\n";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT nazwa FROM danie_podstawowe;");
            ResultSetMetaData rsmd = rs.getMetaData();

            while(rs.next()){
                result += rs.getString(1) + " \n";
                sandwiches.add(rs.getString(1));
            }
            tv.setText(result);
        }catch (Exception e){
            e.printStackTrace();
            tv.setText(e.toString());
        }
    }
}



/*while(result.next()){
        sandwiches.add(result.getString("nazwa"));
        records += result.getString(1) + " " + result.getString(2) + "\n";
        }
            /*for (int i=0; i<sandwiches.size();i++){
                tv1.append(sandwiches.get(i));
                tv1.append("\n");
            }*/
