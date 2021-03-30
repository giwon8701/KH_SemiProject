<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>


<%--
    //사용자가 request한 (파일 업로드한) 정보를 토대로 upload 폴더안에  maxSize만큼의 파일을 업로드해준다
    
        String directory = application.getRealPath("/upload/");
    
        int maxSize = 1024*1024*100;
        String encoding = "UTF-8";
        
        MultipartRequest multipartRequest
         = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
        //실제로 사용자가 업로드 할때 file 이름을 넣어주고 
        String file_name = multipartRequest.getOriginalFileName("file");
        String file_realname = multipartRequest.getFilesystemName("file");
        
        new FileDao().upload(file_name,file_realname);
        out.write("파일명:"+file_name+"<br>");
        out.write("실제 파일명:"+file_realname+"<br>");
        
    --%>

<%
String realFolder = "img";
String filename = request.getParameter("filename");
System.out.println(filename);
int maxSize = 1024 * 1024 * 5;
String encType = "UTF-8";
String savefile = "img";
ServletContext scontext = getServletContext();
realFolder = scontext.getRealPath(savefile);

try {
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	Enumeration<?> files = multi.getFileNames();
	String file = (String) files.nextElement();
	filename = multi.getFilesystemName(file);
} catch (Exception e) {
	e.printStackTrace();
}

String fullpath = realFolder + "\\" + filename;
%>



<title>Insert title here</title>
</head>
<body>

<img src="<%=fullpath%>" width=512 height=384></img> 

</body>
</html>