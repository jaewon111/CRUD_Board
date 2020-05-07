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

  <form action="/board/register" method="post" name="register_form" id ="register_form">
  
      <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-0">자유 게시판</h5>
                            </div>
                            <table class="table">
                                  <thead align="center" >
                                    <tr>
                                      <th scope="col" width="40%">
                                       <input type="text" name="title" placeholder="제목을 입력해주세요." style="width:50%;height:30px;" id="title">
                                      </th>
                                    </tr>
                                  </thead>
                                  
                                  <tbody>
                                  
                                    <tr>
                                     <th> 
                                      <div class="container">
	                                      <textarea class="form-control col-sm-50" rows="10" style="resize: none;" name="content" id="content"></textarea>
                                       </div>
                                     </th>
                                    </tr>
                                    
                                    <tr>
                                     <th>
                                       <input type="text" name="writer" placeholder="닉네임을 입력해주세요." id="writer">
                                       <input type="password" name="password" placeholder="비밀번호를 입력해주세요." id="password">
                                     </th>
                                    </tr>
                                    
                                  </tbody>
                            </table>
                           </div> 
                        </div>
                      </div><!-- end row -->
                      
                      <button type="button" class="btn btn-info" id="btn_register">글쓰기</button>
                      <button type="button" class="btn btn-info" id="btn_list">목록</button>
                      
                </form><!-- end form -->
                
                
                
                
                <!--  script -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script type="text/javascript">
                $(document).ready(function(){
                	   
                	var result =  '<c:out value="${result}"/>';
                               	
                	$('#btn_list').on("click",function(){
             		   self.location="/board/list";
                	
                	});//end btn_list
                
                	
                  
                    
                    $("#btn_register").on("click",function(e){
                    	var title = $("#title").val();
                        var content = $("#content").val();
                        var writer = $("#writer").val();  
                        var password = $("#password").val();
                        
                        if( title == ""){
                        	alert("제목을 입력해주세요.");
                        	return;
                        }
                        
                      if(content == ""){
                      	  alert("내용을 입력해주세요.");
                      	return;
                        }
                        
                        if(writer == ""){
                      	  alert("작성자를 입력해주세요.");
                      	return;
                        }
                        
                        if(password == ""){
                        	  alert("비밀번호를 입력해주세요.");
                        	return;
                          }
                       
                      $("#register_form").submit();
                        
                    })// end btn_register
                	
                }); //end document
                
            
                
                
                </script>
                
                
</body>
</html>