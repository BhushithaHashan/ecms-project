package com.cms.util;

import jakarta.servlet.ServletContext;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;

public class DBUtil {
    public static Connection getConnection(ServletContext context) throws Exception {
        BasicDataSource ds = (BasicDataSource) context.getAttribute("DBCPDataSource");
        if(ds != null) return ds.getConnection();
        else throw new Exception("DataSource not initialized!");
    }
}
