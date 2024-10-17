
package com.mycompany.onlinefurnitureshop.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;
    
    public static SessionFactory getFactory()
    {
    
        try
        {
            if(factory == null)
            {
                 // Hibernate configration file  add here ("hibernate.cfg.xml")
                factory= new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
                    
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }     
        
        
        return factory;
    }
    
}
