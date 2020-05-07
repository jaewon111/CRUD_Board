<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    
<title>CRUD게시판</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/extra-libs/multicheck/multicheck.css">
    <link href="/resources/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/resources/ dist/css/style.min.css" rel="stylesheet">
</head>
<body>


  <form action="/board/update" method="post" id="form_update">
    <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-0">자유 게시판</h5>
                            </div>
                            <table class="table">
                                  <thead align="center" >
                                    <tr>
                                      <th scope="col" width="5%">
                                      <input type='hidden' name='bno' value='<c:out value="${board.bno}"/>'>
                                      <c:out value="${board.bno}" />
                                     </th>
                                     
                                      <th scope="col" >
                                      <input type="text" name='title' value="${board.title}" style="width:600px">
                                     </th>
                                     
                                      <th scope="col" width="10%">
                                      <c:out value="${board.writer}" />
                                      </th> 
                                      
                                      <th scope="col" width="10%"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></th>                                  
                                    </tr>
                                  </thead>
                                  
                         
                                  <tbody>
                                    <tr>
                                      <th scope="row" colspan="4"> 
                                       <textarea class="form-control col-sm-50" rows="10" style="resize: none;" name="content" id="content">
                                       <c:out value="${board.content}" />
                                       </textarea>
                                      </th>
                                    </tr>
                                  </tbody>      
                                                       
                            </table>
                           </div> 
                        </div>
                      </div><!-- end row -->
                      
                       <button type="button" class="btn btn-info" id="btn_list"
                      onclick="location.href='/board/list?pageNum=<c:out value="${paging.pageNum}"/>&amount=<c:out value="${paging.amount}"/>'" >목록</button> 
                      
                      <button type="submit" class="btn btn-info" id="btn_modify"
                      onclick="location.href='/board/update?bno=<c:out value="${board.bno}"/>'">수정</button>
                      
                      
           </form>           
                      
                      <!-- script -->
                      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                      <script type="text/javascript"> 
                      $(document).ready(function(){
                    	  
                    	  var result =  '<c:out value="${result}"/>';
                    	
                    	  var form1=$("#form").val();
        	  
                    	    	   
           
                    	                   	  
              	  
                      }); //end document
                      
                      
                      
                      </script>
                      
                      
                    


</body>
</html>