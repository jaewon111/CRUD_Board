<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/extra-libs/multicheck/multicheck.css">
    <link href="/resources/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/resources/ dist/css/style.min.css" rel="stylesheet">
    
    
<!-- SB Admin CSS - Include with every page -->
    <link href="/resources/css/sb-admin.css" rel="stylesheet">
    
 <title>CRUD게시판</title>   
</head>
<body>
   <form id="delete_form" action="/board/delete" method="post">
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
                                     
                                      <th scope="col" width="60%">
                                      <c:out value="${board.title}" />
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
                                      <c:out value="${board.content}" />
                                      </th>
                                    </tr>
                                  </tbody>                           
                            </table>
                           </div> 
                        </div>
                      </div><!-- end row -->   
                   
                   <!-- 댓글 처리  -->
                      <div class="panel-heading"><i class="fa fa-comments fa-fw"></i>댓글
                      </div>
                        <div class="panel-body">
                              <ul class="chat">
                               <li class="left clearfix" data-rno='3' data-password='1'>
                                <div>
                                 <div class="header">
                                   <strong class="primary-font"></strong>
                                   <small class="pull-right text-muted"></small>
                                 </div>
                                 <p></p>
                                </div>
                               </li>
                              </ul>
                        </div>
                        
                        
                      <!--댓글 페이징   -->
                     <div class="panel-footer">
                     </div>
                      <!-- 댓글 페이징 끝 -->
                        
                        
                        <!-- 댓글 등록 처리-->
                        <textarea class="form-control" style= "width:1000px;resize: none;" id="reply_text" name="reply_text"></textarea>
                        <input type="text" name="replyer" placeholder="닉네임을 입력해주세요." id="replyer" class="form-control" style= "width:200px;">
                        <input type="password" name="replyer_password" placeholder="비밀번호를 입력해주세요." id="replyer_password" class="form-control" style= "width:200px;">
                        <button type="button" id ="Btn_addReply" class="btn btn-primary btn-xs pull-right" >등록</button>
                      

                      <!--게시글 버튼 처리 -->
                       <div style=margin:25px;padding:-10px;>
                      <button type="button" class="btn btn-info" id="btn_list"
                      onclick="location.href='/board/list?pageNum=<c:out value="${paging.pageNum}"/>&amount=<c:out value="${paging.amount}"/>'" >목록</button>                    
                      <button type="button" class="btn btn-info" id="btn_update">수정</button>
                      <button type="button" class="btn btn-info" id="btn_delete" name="btn_delete">삭제</button>
                      </div>         
                      
                       
                          <!--댓글관리 모달창-->
	                 <div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	               	 <div class="modal-dialog" role="document">
			         <div class="modal-content">
				    <div class="modal-header">
					 <h5 class="modal-title" id="exampleModalLabel">댓글관리창</h5>
					 <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				     <span aria-hidden="true">X</span>
					</button>
				    </div>
				<div class="modal-body">
				    <textarea class="form-control col-sm-50" rows="10" style="resize: none;" name="reply" id="reply"></textarea>
				</div>
				<div class="modal-footer">
					<a class="btn" id="modal_update_btn">수정</a>
					<a class="btn" id="modal_delete_btn">삭제</a>
					<button class="btn" type="button" data-dismiss="modal">취소</button>
			    </div>
			</div>
		</div>
	</div>          
                         
   </form>
   
                               
         
   
                      <!-- script -->
                      
                 
                      <script type="text/javascript" src="/resources/js/reply.js?ver=1"></script>
                        <script type="text/javascript">
                      
                      $(document).ready(function(){
                         var result =  '<c:out value="${result}"/>';            
                         var replyUL = $(".chat"); //<ul class="chat">
                         var bnoValue = '<c:out value="${board.bno}"/>';
                         
                         
                         showList(1); //페이지1부터 보여주는 기능 
                         
                         function showList(page){
                         
                           replyService.getList({bno:bnoValue,page : page || 1 }, function(replyCnt, list){
                           var str="";
                           
                           //페이지번호가 -1로 전달되면 마지막 페이지를 찾아서 다시 호출 
                           if(page == -1){
                        	   pageNum = Math.ceil(replyCnt/10.0);
                        	   showList(pageNum);
                        	   return;
                           }
                           
                           if(list == null || list.length == 0){
                           return;
                           }

                           for(var i=0, len = list.length || 0; i < len; i++){  
                           str +="<li class='left clearfix' id='reply_rno' data-rno='" + list[i].rno + "' data-password='"+ list[i].password +"'>";
                           str +="<div><div class='header'><strong class='primary-font' name='replyer'><span class='badge badge-success'>"+list[i].replyer+"</span></strog>";
                           str +="<small class='pull-right text-muted' name='replyDate'>" + replyService.displayTime(list[i].replyDate)+"</small></div>";
                           str +="<p>" + list[i].reply+"</p></div></li>";
                          
                           }
    
                            replyUL.html(str);
                            showReplyPage(replyCnt);
                           }); // end function
                             
                          
                   
                         } // end show list
                         
                       $("#btn_delete").on("click", function(){
                            var num = prompt("해당 게시글의 비밀번호를 입력해주세요."); 
                            var real_password = '<c:out value="${board.password}"/>';
                            
                            //입력한 비밀번호와 해당 게시글 비밀번호 비교 
                            if(num == "" || num!=real_password){
                               alert("비밀번호가 틀렸습니다.");
                               return;
                            }
                            else if(num == real_password){
                               alert("게시글이 삭제되었습니다.")
                               $("#delete_form").submit();
                               self.location="/board/list?pageNum=<c:out value="${paging.pageNum}"/>&amount=<c:out value="${paging.amount}"/>";
                               
                          }              
                            
                         })//end btn_delete 
                         
                         
                         $("#btn_update").on("click",function(){
                            var num = prompt("해당 게시글의 비밀번호를 입력해주세요."); 
                            var real_password = '<c:out value="${board.password}"/>';
                            
                            //입력한 비밀번호와 해당 게시글 비밀번호 비교 
                            if(num == "" || num!=real_password){
                               alert("비밀번호가 틀렸습니다.");
                               return;
                            }
                            else if(num == real_password){
                               alert("수정페이지로 들어갑니다.")
                                  self.location="/board/update?pageNum=<c:out value="${paging.pageNum}"/>&amount=<c:out value="${paging.amount}"/>&bno=<c:out value="${board.bno}"/>";
                                 }     
                            
                            
                         });//end btn_update
                         
     
                             
                          //댓글 등록 AJAX
                          $("#Btn_addReply").on("click",function(e){
                              var reply_text = $("#reply_text").val();
                              var replyer = $("#replyer").val();
                              var replyer_password = $("#replyer_password").val();
                            
                             if( reply_text == "" || replyer == "" || replyer_password == ""){
                                alert("댓글 혹은 아이디 비밀번호를 입력해주세요.");
                             }
                             else{
                            var reply = {
                                reply : reply_text,
                                replyer : replyer,
                                password : replyer_password,
                                bno : bnoValue
                             };
                             replyService.add(reply, function(result){
                               alert("댓글 등록 성공"); 
                            //   showList(1); //댓글리스트 갱신
                               showList(-1); //새로운 댓글 추가시, 페이지 댓글 숫자를 다시 파악한다.
                             });
                             }
                          });//end Btn_addReply
                                                         
                         
                         
                          var modal = $(".modal");
                          var modalReply = modal.find("textarea[name='reply']");
                          
                          var modalUpdate = $("#modal_update_btn");
                          var modalDelete = $("#modal_delete_btn");
               
                        //댓글 수정 삭제                    	
                          $('.chat').on("dblclick","li",function(e){
                              
                          	      var num = prompt("해당 댓글의 비밀번호를 입력해주세요.");  
                                  var password = $(this).data("password");//댓글 비번
                                  var rno = $(this).data("rno"); //댓글 번호
                                   
                                  //댓글 패스워드 유효성검사
                                 if(num == password){
                                	  //댓글 조회
                                	  replyService.get(rno, function(reply){
                                		 
                              	        modalReply.val(reply.reply);
                                	    modal.data("rno",reply.rno);//수정 삭제를 위해 rno값 생성
                                	    modalUpdate.show();
                                	    modalDelete.show(); 
                                		  $(".modal").modal("show");
                                	 });//end replyService.get  
                                	  
                                	 
                                	 //댓글 수정
                                	  modalUpdate.on("click", function(e){
                                		  var reply = {
                                				     rno : modal.data("rno"),
                                				     reply : modalReply.val()
                                		            };
                                		  replyService.update(reply, function(result){
                                			  alert("댓글이 수정되었습니다.");
                                			  modal.modal("hide");
                                			  showList(pageNum);
                                			  
                                		  });
                                	  });//end modalUpdate
                                	  
                                	  //댓글 삭제
                                	  modalDelete.on("click", function(e){
                                		  var rno = modal.data("rno"); 
                                		  
                                		  replyService.remove(rno, function(result){
                                			  alert("댓글이 삭제되었습니다.");
                                		      modal.modal("hide");
                                		      showList(pageNum);
                                		  });
                                		  
                                	  }); //end modalDelete
                                  return;
                                 } 
                                 else{
                              	   alert("해당 댓글의 비밀번호가 일치하지 않습니다.")
                                    return;
                                 }
                                
                             });//end .chat 
                             
                             
                             
                             //댓글 페이징 처리 
                            var pageNum  = 1;
                            var replyPageFooter  = $(".panel-footer");
                            
                            function showReplyPage(replyCnt){
                            	var endNum = Math.ceil(pageNum / 10.0) * 10; //끝페이지
                            	var startNum = endNum - 9; //첫페이지
                            	var prev = startNum != 1; //이전 
                            	var next = false; //다음 
                            	
                            	if(endNum * 10 >= replyCnt){
                            		endNum = Math.ceil(replyCnt/10.0);
                            	}
                            	if(endNum * 10 < replyCnt){
                            		next = true;
                            	}
                            	
                            	var str = "<ul class='pagination pull-right'>";
                            	
                            	if(prev){
                            		str += "<li class='page-item'><a class='page-link' href='"+
                            		    (startNum -1) + "'>이전</a></li>"
                            	}
                            	
                            	for(var i = startNum; i <= endNum; i++){
                            		var active = pageNum == i ? "active":"";
                            		
                            		str +="<li class='page-item' "+ active + "'><a class='page-link' href='"+i+"'>"+ i +"</a></li>";
                            	}
                            	
                            	if(next){
                            		str+="<li class='page-item'<a class='page-link' href='"+(endNum +1)+"'>다음</a></li>";
                            	}
                            	str += "</ul></div>";
                            	console.log(str);
                            	replyPageFooter.html(str);// .panel -footer에 이어준다.
                            }//end showReplyPage
                            
                            
                            replyPageFooter.on("click", "li a", function(e){
                            	
                            	e.preventDefault(); //기본 동작을 막는다.
                            	
                            	var targetPageNum = $(this).attr("href");
                            	
                            	pageNum = targetPageNum;
                            	showList(pageNum);
                            	
                            });// end replyPageFooter
                             
                                            
                        }); //end document
              
             
                      </script>
                      
                      
                    


</body>
</html>