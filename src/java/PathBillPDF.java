 
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.*;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class PathBillPDF extends Action {
    
    int id;
    String pname,psex,age,pphone,paddress,pdoctor;

    public void set(int id, String n,String s,String a,String p,String add,String d)
    {
        this.id =id;
        pname=n;
        psex=s;
        age=a;
        pphone=p;
        paddress=add;
        pdoctor=d;
    }
     
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        

            Document document = new Document(PageSize.A4, 50, 50, 50, 50);
            
        try{
            response.setContentType("application/pdf");
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            document.add(new Paragraph("Illume Labs & Hospital : PATIENT BILL FOR PATHOLOGY TESTS"));
            document.add(new Paragraph(" "));
            //document.add(new Paragraph("Itemised Bill : "));
            //Chapter chapter1 = new Chapter(p1,1);
            //chapter1.setNumberDepth(0);
            //Section section1 = chapter1.addSection("Patient Details : ",1); 
            //FontFactory.getFont(FontFactory.HELVETICA,18, Font.BOLDITALIC, new CMYKColor(0, 255, 255,17)));
            //Image image2 = Image.getInstance("images/logopdf.png");
            //image2.scaleAbsolute(480f, 120f);
           // section1.add(image2);
            //document.add(chapter1);
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Patient Details : "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Name : "+pname));
            document.add(new Paragraph("Sex : "+psex));
            document.add(new Paragraph("Age : "+age));
            document.add(new Paragraph("Phone Number : "+pphone));
            document.add(new Paragraph("Address : "+paddress));
            document.add(new Paragraph("Reference Doctor : "+pdoctor));
            document.add(new Paragraph(" "));
            /*Chapter chapter2 = new Chapter("Detailed Information", 1);
            chapter2.setNumberDepth(0);
            Section section2 = chapter2.addSection("");
            PdfPTable t = new PdfPTable(4);
            t.setSpacingBefore(25);
            t.setSpacingAfter(25);
            PdfPCell c1 = new PdfPCell(new Phrase("Test Name"));  
            t.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("Date"));
            t.addCell(c2);
            PdfPCell c3 = new PdfPCell(new Phrase("Rate"));
            t.addCell(c3);
            PdfPCell c4 = new PdfPCell(new Phrase("Report Status"));
            t.addCell(c4);
                */
            document.add(new Paragraph("Test Details : "));
            document.add(new Paragraph(" "));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            PreparedStatement ps=con.prepareStatement("select * from pathologytestdetails where patientid=?");
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            int total=0;
            while(rs.next())
            {
                int tid=rs.getInt("testid");
                String date=(rs.getDate("date")).toString();
                String st=rs.getString("report");
                Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
                PreparedStatement ps1=con1.prepareStatement("select * from test where id=?");
                ps1.setInt(1,tid);
                ResultSet rs1=ps1.executeQuery();
                rs1.next();
                String name1=rs1.getString("name");
                int amt=rs1.getInt("amount");
                total+=amt;
                document.add(new Paragraph(name1+"  "+date+"   Rs."+amt+"  Report : "+st));
                /*t.addCell(name1);
                t.addCell(date);
                t.addCell(amt+"");
                t.addCell(st);
               */
                document.add(new Paragraph(" "));
            }
            //section2.add(t);
            //document.add(chapter2);
            document.add(new Paragraph("Total Amount Payable : "+total));

            
            }
        catch(Exception e){
            e.printStackTrace();
                            }
        document.close();
        return null;
 
    }
}
