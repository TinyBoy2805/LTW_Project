<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CKEditor</title>
<script type = "text/javascript" src="<%= request.getContextPath() %>/libraries/ckeditor/ckeditor.js"></script>
<script type = "text/javascript" src="<%= request.getContextPath() %>/libraries/ckfinder/ckfinder.js"></script>
</head>
<body>
    <form action="" method="post">
        <textarea name="editor" id="editor" rows="10" cols="80">
            Nội dung soạn thảo...
        </textarea>
        </br>
        <input type="submit" value="Submit">
    </form>
    <script>
        var editor = CKEDITOR.replace( 'editor' );
        CKFinder.setupCKEditor( editor, '<%= request.getContextPath() %>/libraries/ckfinder/' );
    </script>
</body>
</html>