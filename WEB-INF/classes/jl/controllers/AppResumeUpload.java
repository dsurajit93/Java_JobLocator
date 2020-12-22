package jl.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import jl.dao.ApplicantDao;

@WebServlet("/uploadResume")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
public class AppResumeUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "Resume";
	private String resumePath=null;
	String fileName;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		int id=(int)session.getAttribute("userId");
		
		String appPath = request.getServletContext().getRealPath("");
    	String savePath = appPath + File.separator + SAVE_DIR;
        System.out.println(savePath);
        
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
     
         for (Part part : request.getParts()) {
        	fileName = extractFileName(part);
            //System.out.println(fileName);
            fileName = new File(fileName).getName();
            //System.out.println(fileName);

            fileName=id+"."+fileName.substring(fileName.lastIndexOf(".")+1);
            resumePath=savePath + File.separator + fileName;
            System.out.println(resumePath);
            part.write(resumePath);
        }
         
         ApplicantDao apd=new ApplicantDao();
         boolean status=apd.updateResume(id, fileName);
         if(status) {
        	 request.setAttribute("msg", "Resume Updated Successfully");
         }
         else {
        	 request.setAttribute("msg", "Something Wromg !!! Please Try Again");
         }
         RequestDispatcher rd=request.getRequestDispatcher("Applicant/AppUploadResume.jsp");
    	 rd.forward(request, response);
         
	}
	
	private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
	}

}
