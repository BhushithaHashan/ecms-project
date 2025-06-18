package com.cms.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

@WebListener
public class DBCPInitListener implements ServletContextListener {
    private BasicDataSource dataSource;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        dataSource = new BasicDataSource();
        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
        dataSource.setUrl("jdbc:mariadb://localhost:3306/cms");
        dataSource.setUsername("root"); 
        dataSource.setPassword("Ijse1234"); 
        dataSource.setInitialSize(5);
        dataSource.setMaxTotal(20);

        sce.getServletContext().setAttribute("DBCPDataSource", dataSource);
        System.out.println("DBCP Connection Pool initialized!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try { dataSource.close(); } catch(Exception e){ e.printStackTrace(); }
        System.out.println("DBCP Connection Pool closed!");
    }
}
