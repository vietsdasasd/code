

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.html2pdf.HtmlConverter;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Mr Viet
 */



public class HtmlToPdfConverter {

    public static void main(String[] args) {
       try {
            // Thay đổi đoạn mã HTML của bạn
            String htmlContent = "<html><body><h1>Hello, World!</h1></body></html>";

            // Thay đổi đường dẫn đến file PDF đầu ra
            File pdfFile = new File("path/to/your/output/file.pdf");

            // Chuyển đổi HTML sang PDF
            try (FileOutputStream pdfDest = new FileOutputStream(pdfFile)) {
                HtmlConverter.convertToPdf(htmlContent, pdfDest);
            }

            System.out.println("Chuyển đổi thành công.");
        } catch (IOException e) {
            e.printStackTrace();
        }
            }
}