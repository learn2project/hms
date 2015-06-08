 
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

public class InBillPdfDone extends Action
{
    int id;
    public void set(int i)
    {
        id=i;
    }
    public Paragraph Add(String s)
    {
                    return new Paragraph(s);

    }
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
        

            Document document = new Document(PageSize.A4, 50, 50, 50, 50);
            
        try{
            response.setContentType("application/pdf");
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            document.add(this.Add("Illume Labs & Hospital : PATIENT BILL FOR ADMIT PATIENT"));
            document.add(this.Add(" "));
            String pname,psex,age,pphone,paddress,ppsex,padmitdate,pdischargedate;
             Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
 int totalpath=0;
 Connection con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
 PreparedStatement ps2=con2.prepareStatement("select * from admitpatient where id=?");
 ps2.setInt(1,id);
 ResultSet rs2=ps2.executeQuery();
 rs2.next();
 pname=rs2.getString("name");
 psex=rs2.getString("sex");
 if(psex.equalsIgnoreCase("male"))
 	ppsex="Male";
 else
 	ppsex="Female";
 age=rs2.getString("age");
 pphone=rs2.getString("phone");
 paddress=rs2.getString("address");
 padmitdate=(rs2.getDate("admitdate")).toString();
 PreparedStatement pss=con2.prepareStatement("select * from admitdischarge where id=?");
 pss.setInt(1,id);
 ResultSet rss=pss.executeQuery();
 if(rss.next())
 {
 pdischargedate=(rs2.getDate("date")).toString();
 }
 else
 {
 pdischargedate="Not Discharged";
 }
 
            document.add(this.Add(" "));
            document.add(this.Add("Patient Details : "));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Name : "+pname));
            document.add(new Paragraph("Sex : "+psex));
            document.add(new Paragraph("Age : "+age));
            document.add(new Paragraph("Phone Number : "+pphone));
            document.add(new Paragraph("Address : "+paddress));
            document.add(new Paragraph("Discharge Date : "+pdischargedate));
            document.add(new Paragraph(" "));
           
            document.add(new Paragraph("Test Details : "));
            document.add(new Paragraph(" "));
            
PreparedStatement ps=con.prepareStatement("select * from admitpath where id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();  
document.add(new Paragraph("Name                     Date                     Amount"));
while(rs.next())
	{
	int tid=rs.getInt("testid");
	String date=(rs.getDate("date")).toString();
	Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps1=con1.prepareStatement("select * from test where id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
	String name1=rs1.getString("name");
	int amt=rs1.getInt("amount");
	totalpath+=amt;
        document.add(new Paragraph(name1+"          "+date+"          "+amt));
        }
        document.add(new Paragraph("Total amount of pathological tests : "+totalpath));
                document.add(new Paragraph(" "));
        document.add(new Paragraph(" "));

        //for bed entries
        document.add(new Paragraph("Bed Details : "));
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Bed                   From                     To                    Rate"));
        int totalbed=0;
        PreparedStatement ps3=con.prepareStatement("select * from bedentry where id=?");
 	ps3.setInt(1,id);
 	ResultSet rs3=ps3.executeQuery();
	while(rs3.next())
        {
	String bname=rs3.getString("type");
	String admitdate=(rs3.getDate("start")).toString();
	String dischargedate=(rs3.getDate("end")).toString();
	int rate=rs3.getInt("rate");
	int amount=0;
        PreparedStatement ps4=con.prepareStatement("select DATEDIFF((select str_to_date(?,'%Y-%m-%d')),(select str_to_date(?,'%Y-%m-%d')))as dif");
        ps4.setString(1,dischargedate);
        ps4.setString(2,admitdate);
        ResultSet rs4=ps4.executeQuery();
        rs4.next();
        int diff=rs4.getInt("dif")+1;
        amount=(diff*rate);
        totalbed+=amount;
        document.add(new Paragraph(bname+"          "+admitdate+"          "+dischargedate+"            "+rate));
        }
        document.add(new Paragraph("Total amount of bed charges : "+totalbed));
        //end of bed entries
                document.add(new Paragraph(" "));
        document.add(new Paragraph(" "));

        
        //for doctors
         document.add(new Paragraph("Doctor Details : "));
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Name                     Date                      Fee"));
         int totalfee=0;
        Connection con5=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps5=con5.prepareStatement("select * from admitdoctor ad,doctor d where ad.did=d.id and ad.pid=?");
 	ps5.setInt(1,id);
 	ResultSet rs5=ps5.executeQuery();
        while(rs5.next())
                       {
	String dname=rs5.getString("d.name");
	String visitdate=(rs5.getDate("ad.date")).toString();
	int fee=rs5.getInt("ad.fee");
	totalfee+=fee;
        document.add(new Paragraph(dname+"          "+visitdate+"            "+fee));
        }
        document.add(new Paragraph("Total amount of doctor visiting fees : "+totalbed));
        //end of doctors
                document.add(new Paragraph(" "));
        document.add(new Paragraph(" "));

        
        //medicine store
        document.add(new Paragraph("Medicine Store Details : "));
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Bill No                     Amount"));
        float totalbill=0;
        Connection con6=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps6=con6.prepareStatement("select * from adminstore where id=?");
 	ps6.setInt(1,id);
 	ResultSet rs6=ps6.executeQuery();
        while(rs6.next())
                       {
	String billno=rs6.getString("billno");
	float billamt=rs6.getFloat("amount");
        totalbill+=billamt;
        document.add(new Paragraph(billno+"          "+billamt));
        }
        document.add(new Paragraph("Total Amount of Medicine Store Bills : "+totalbill));
       //end medicine store
                document.add(new Paragraph(" "));
        document.add(new Paragraph(" "));

        //payment
        document.add(new Paragraph("Payment Details : "));
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Date                       Amount"));
         float totalpaid=0;
        Connection con7=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps7=con7.prepareStatement("select * from admitpay where id=?");
 	ps7.setInt(1,id);
 	ResultSet rs7=ps7.executeQuery();
        while(rs7.next())
                       {
	String paiddate=(rs7.getDate("date")).toString();
	float paidamt=rs7.getFloat("amount");
        totalpaid+=paidamt;
         document.add(new Paragraph(paiddate+"          "+paidamt));
        }
        document.add(new Paragraph("Total Amount paid : "+totalpaid));
        //end payment
                document.add(new Paragraph(" "));
        document.add(new Paragraph(" "));

        
        double outstanding=(totalpath+totalbed+totalfee+totalbill)-totalpaid;
        double i=Math.ceil(outstanding);
                document.add(new Paragraph("Total Outstanding Amount : "+i+"  (rounded off)"));
            }
        catch(Exception e){
            e.printStackTrace();
                            }
        document.close();
        return null;
 
    }
}
