
package com.mycompany.onlinefurnitureshop.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class Helper {
    //  we are creating " static method " then we can use in another class without creating object of this class 
    // we are usinmg this class method "index.jsp" page
    public static String get10Words(String desc)
    {
        String[] strs=desc.split(" ");
        if(strs.length>10)
        {
            String res="";
            for(int i=0;i<10;i++)
            {
                res=res+strs[i]+" ";
            
            }
            return (res+"...");
        
        }else
        {
            return(desc+"...");
        
        }
            
    
    
    }
    
    
    // this method going to in " Admin.jsp" page or file for "Count" "User and Product " size and we can also create in "Dao" file
    public static Map<String,Long> getCounts(SessionFactory factory)
    {
        Session session=factory.openSession();
        String q1= "Select count(*) from User";
        String q2= "Select count(*) from Product";
        
        
        Query query1=  session.createQuery(q1);
        Query query2=  session.createQuery(q2);
        Long userCount= (Long)query1.list().get(0);
        Long productCount= (Long)query2.list().get(0);
        Map<String,Long> map=new HashMap<>();
        map.put("userCount",userCount);
        map.put("productCount",productCount);
        
        session.close();
        return map;
        
        
        
    
        
        
    
    
    }
    
}
