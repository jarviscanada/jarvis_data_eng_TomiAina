package ca.jrvs.apps.grep;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.log4j.BasicConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class JavaGrepImp implements JavaGrep {
    final Logger logger = LoggerFactory.getLogger(JavaGrepImp.class);

    private String rootPath;
    private String regex;
    private String outFile;


    public static void main(String[] args)  {
        if (args.length != 3) {
            throw new IllegalArgumentException("Usage: regex rootPath outFile");
        }

        //Use default logger config
        BasicConfigurator.configure();

        JavaGrepImp javaGrepImp = new JavaGrepImp();
        javaGrepImp.setRegex(args[0]);
        javaGrepImp.setRootPath(args[1]);
        javaGrepImp.setOutFile(args[2]);

        try {
            javaGrepImp.process();
        } catch (Exception ex) {
            javaGrepImp.logger.error("Error: Unable to process", ex);
        }

    }

    @Override
    public void process() throws IOException, IllegalAccessException {
        List<String> matchedLines = new ArrayList<>();
        for (File file : listFiles(getRootPath())) {
            for (String line : readLines(file)) {
                if (containsPattern(line)) {
                    matchedLines.add(line);
                }
            }
        }
        writeToFile(matchedLines);
    }


    @Override
    public List<File> listFiles(String rootDir) {
        List<File> files = new ArrayList<>();

        File f = new File(rootDir);
        return files;
    }

    @Override
    public List<String> readLines(File inputFile) throws FileNotFoundException, IllegalAccessException, IOException {
        if (!inputFile.isFile()) {
            try {
                throw new IllegalAccessException(inputFile + "is not a file!");
            } catch (IllegalAccessException ea) {
                logger.info("Error: Unable to process", ea);
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
        BufferedReader reader;

        try {
            reader = new BufferedReader(new FileReader(inputFile));

            String line = reader.readLine();
            while (line != null) {
                lines.add(line);
                line = reader.readLine();
            }
            reader.close();

        } catch (FileNotFoundException ee) {
            logger.info("FileNotFoundException",ee);
        } catch (IOException e) {
            logger.info("IOException",e);
        }

        return lines;
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
        return line.matches(regex);
        return line.toLowerCase().matches(getRegex());    }

    @Override
    public void writeToFile(List<String> lines) throws IOException {
        FileWriter writer = new FileWriter(getOutFile());
        BufferedWriter BW = new BufferedWriter(writer);

        BW = new BufferedWriter(new FileWriter(getOutFile()));
        BW.write(String.valueOf(lines));
        BW.newLine();
        BW.close();
    }

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

    @Override
    public String getOutFile() {
        return outFile;
    }

    @Override
    public void setOutFile(String outFile) {
        this.outFile = outFile;
    }

}
    public String getOutfile() {
        return outfile;
    }

    public void setOutfile(String outfile) {
        this.outfile = outfile;
    }
}
