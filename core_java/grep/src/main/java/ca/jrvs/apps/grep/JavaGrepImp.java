package ca.jrvs.apps.grep;


import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;

import java.io.*;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.io.FileReader;
import java.io.BufferedReader;

public class JavaGrepImp implements JavaGrep {
    final Logger logger = LoggerFactory.getLogger(JavaGrep.class);

    public Logger logger;
    private String rootPath;
    private String regex;
    private String outfile;

    public List<File> listFilesLambda(String rootPath) throws IOException {
        return Files.walk(Paths.get(rootPath)).filter(Files::isRegularFile).map(Path::toFile)
                .collect(Collectors.toList());
    }

    @Override
    public void process() throws IOException {

    }

    @Override
    public List<File> listFiles(String rootDir) {
        return null;
    }

    @Override
    public List<String> readLines(File inputFile) {
        if (!inputFile.isFile()) {
            try {
                throw new IllegalAccessException(inputFile + "This is not a file");
            } catch (FileNotFoundException e){
                Object javaGrepImp;
                javaGrepImp.logger.error("Error: Unable to Process",e);
            }
        }

        ArrayList<String> lines = new ArrayList<>();
        BufferedReader br = null;
        String line;
        try {
            br = new BufferedReader(new FileReader(inputFile));

            while ((line = br.readLine() != null));
            System.out.println(line);
        } catch (FileNotFoundException e){
            Object javaGrepImp;
            javaGrepImp.logger.error("Error: Unable to Process",e);
        }

    }

    @Override
    public boolean containsPattern(String line) {
        return line.toLowerCase().matches(getRegex());
    }

    @Override
    public void writeToFile(List<String> lines) throws IOException {

    }





    @Override
    public String getOutFile() {
        return null;
    }

    @Override
    public void setOutFile(String outFile) {

    }


    @Override
    public String getRootPath() {
        return rootPath;
    }


    @Override
    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }


    @Override
    public String getRegex() {
        return regex;
    }

    @Override
    public void setRegex(String regex) {
        this.regex = regex;
    }

    public String getOutfile() {
        return outfile;
    }

    public void setOutfile(String outfile) {
        this.outfile = outfile;
    }
}