<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String fileInfo = "";
	String fileName = request.getHeader("file-name");
	String fileName_suffix = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	String[] suffixArr = {"jpg", "png", "bmp", "gif"};
	
	int cnt = 0;
	for(int i = 0; i < suffixArr.length; i++){
		if(fileName_suffix.equals(suffixArr[i])){
			cnt++;
		}
	}
	
	if(cnt == 0){
		out.println("NOTALLOW_" + fileName);
	} else {
		String defaultPath = request.getSession().getServletContext().getRealPath("/");
		String filePath = defaultPath + "img" + File.separator + "smarteditor2" + File.separator;
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		String autoFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
		String rFileName = filePath + autoFileName;
		InputStream is = request.getInputStream();
		OutputStream os = new FileOutputStream(rFileName);
		int num;
		byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		while((num = is.read(b, 0, b.length)) != -1){
			os.write(b, 0, num);
		}
		if(is != null){
			is.close();
		}
		os.flush();
		os.close();
		
		fileInfo += "&bNewLine=true";
		fileInfo += "&sFileName=" + fileName;
		fileInfo += "&sFileURL=/img/smarteditor2/" + autoFileName;
		out.println(fileInfo);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>