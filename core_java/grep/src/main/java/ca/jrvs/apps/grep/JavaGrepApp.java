package ca.jrvs.apps.grep;

import ca.jrvs.apps.grep.JavaGrep;
import ca.jrvs.apps.grep.JavaGrepImp;
import java.io.File;
import java.io.IOException;
import java.util.List;

import com.sun.corba.se.impl.orb.ORBConfiguratorImpl;
import com.sun.corba.se.spi.orb.ORBConfigurator;
import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;


public class JavaGrepApp {
    private static ORBConfigurator BasicConfigurator;
    final Logger logger = LoggerFactory.getLogger(JavaGrep.class);

    public static void main(String[] args) {
        if (args.length != 3) {
            throw new IllegalArgumentException("Missing arguments.\n - USAGE: regex rootPath outFile");
        }

        BasicConfigurator.configure();


        JavaGrepImp javaGrepImp = new JavaGrepImp();
        javaGrepImp.setRegex(args[0]);
        javaGrepImp.setRootPath(args[1]);
        javaGrepImp.setOutFile(args[2]);

        try{
            javaGrepImp.process();
        } catch (Exception ex) {
            javaGrepImp.logger.error("Error: Unable to Process",ex);
        }

    }
}

