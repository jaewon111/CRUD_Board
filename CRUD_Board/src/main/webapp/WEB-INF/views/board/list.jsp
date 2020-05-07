<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
<title>CRUD게시판</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/extra-libs/multicheck/multicheck.css">
    <link href="/resources/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/resources/ dist/css/style.min.css" rel="stylesheet">
    
    <!-- SB Admin CSS - Include with every page -->
    <link href="/resources/css/sb-admin.css" rel="stylesheet">
    
    <!-- style -->
    <style type="text/css">

    </style>
    
</head>
<body>
   
           <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title m-b-0">자유 게시판</h2><br>
                                <h5 class="card- boardcount m-b-0">총 게시글: <c:out value="${pageMaker.total}"/></h5>
                                
                                
                                <!-- 검색기능 -->
                                    <div class='row'>
                                      <div class="col=lg=12">
                                      <form id='searchForm' action="/board/list" method='get'>
                                       <select name='type'>
                                        <option value="" <c:out value="${pageMaker.paging.type == null ? 'selected' :''}"/>>--</option>
                                        <option value="T" <c:out value="${pageMaker.paging.type eq 'T' ? 'selected' : '' }"/>>제목</option>
                                        <option value="C" <c:out value="${pageMaker.paging.type eq 'C' ? 'selected' : ''}"/>>내용</option>
                                        <option value="W" <c:out value="${pageMaker.paging.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
                                        <option value="TC" <c:out value="${pageMaker.paging.type eq 'TC' ? 'selected' : ''}"/>>제목or내용</option>
                                        <option value="TW" <c:out value="${pageMaker.paging.type eq 'TW' ? 'selected' : ''}"/>>제목or작성자</option>
                                        <option value="TWC" <c:out value="${pageMaker.paging.type eq 'TWC' ? 'selected' : ''}"/>>제목 or내용 or작성자</option>                            
                                       </select>
                                       <input type='text' name='keyword' value='<c:out value="${pageMaker.paging.keyword}"/>'/>
                                       <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.paging.pageNum }"/>'>
                                       <input type='hidden' name='amount' value='<c:out value="${pageMaker.paging.amount }"/>'>
                                       <button class='btn btn-default'>Search</button>                                  
                                      </form>
                                      </div>
                                     </div>
                                    </div><!-- div class='row' end  --> 
                            
                            
                            <table class="table">
                                  <thead align="center" >
                                    <tr>
                                      <th scope="col" width="5%" align="center">번호</th>
                                      <th scope="col" width="40%">제목</th>
                                      <th scope="col" width="15%">이름</th>
                                      <th scope="col" width="15%">작성일</th>
                                      <th scope="col" width="10%">조회수</th>
                                    </tr>
                                  </thead>
                                  
                                  <c:forEach items="${list}" var="board">
                                  <tbody>
                                    <tr>
                                      <th scope="row" align="center"><c:out value="${board.bno}" /></th>
                                      <td><a class='title_pageNum_amount' href="<c:out value='${board.bno}'/>">
                                      <c:out value="${board.title}"/>
                                      <b>[<c:out value="${board.replyCnt}"/>]</b></a></td> 
                                      <td align="center"><c:out value="${board.writer}"/></td>
                                      <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                      <td align="center"><c:out value="${board.ref}"/></td>
                                    </tr>
                                  </tbody>
                                  </c:forEach>
                            </table>
                
                     <!-- 페이징   -->
                         
                      <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
                         <ul class="pagination" >
                         
                          <c:if test="${pageMaker.prev}">
                         <li class="paginate_button page-item previous disabled" id="zero_config_previous">
                         <a href="${pageMaker.startPage-1}" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">이전</a></li>
                         </c:if>
                        
                          
                          <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                           <li class="paginate_button page-item ${pageMaker.paging.pageNum == num ? "active":"" }">
                           <a href="${num}" aria-controls="zero_config" data-dt-idx="6" tabindex="0" class="page-link">${num}</a></li>
                          </c:forEach>
                         
                         <c:if test="${pageMaker.next}">
                         <li class="paginate_button page-item next" id="zero_config_next">
                         <a href="${pageMaker.endPage+1}" aria-controls="zero_config" data-dt-idx="7" tabindex="0" class="page-link">다음</a></li>
                         </c:if>
                         
                         </ul>
                         </div> <!-- end zero_config_paginate -->
                      <!-- 페이징 끝 -->
                      
                                
                        <!-- url추가  -->
                     <form id='actionForm' action="/board/list" method="get">
                     <input type='hidden' name='pageNum' value="${pageMaker.paging.pageNum}">
                     <input type='hidden' name='amount' value="${pageMaker.paging.amount}">
                     <input type='hidden' name='type' value="${pageMaker.paging.type}">
                     <input type='hidden' name='keyword' value="${pageMaker.paging.keyword}">
                     </form>
             
                         
                             
                           </div> 
                        </div>
                      </div><!-- end row -->
                      <button type="button" class="btn btn-info" id="btn_register">글쓰기</button><br>
                      

                      
                      <!-- script -->
                    
                      <script type="text/javascript"> 
                      $(document).ready(function(){
                    	 
                    	  
                    	  
                    	  $("#btn_register").on("click",function(){
                    		   self.location="/board/register";
                    	  }); //end btn_list
                    	  
                                    	  
                    	  var actionForm = $("#actionForm"); //actionForm 객체
                    	  
                    	  $(".paginate_button a").on("click",function(e){
                    		 e.preventDefault();
                    		 actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                    		 actionForm.submit();       		  
                    	  });//end paginate_button a 
                    	  
                    	  
                    	  
                    	  $('.title_pageNum_amount').on("click",function(e){
                    		  e.preventDefault(); 
                    		  actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") +"'>");
                    		  actionForm.attr("action","/board/read");
                    		  actionForm.submit();
                    		  
                    	  });//end title_pageNum_amount
                            
                    	 
                    	  //검색 버튼 이벤트 
                		  var searchForm = $("#searchForm");
                		  
                		  $("#searchForm button").on("click", function(e){
                			  
                			  if(!searchForm.find("option:selected").val()){
                				  alert("검색종류를 선택하세요"); return false;
                			  }
                			  
                			  if(!searchForm.find("input[name='keyword']").val()){
                				  alert("키워드를 입력하세요"); return false;
                			  }
                			   
                			  searchForm.find("input[name='pageNum']").val("1");
                			  e.preventDefault();
                			  searchForm.submit();
                			  
                		  });
                    	  
                   
                    	  
                    	  
                      }); //end document
                      
                      
                      
                      </script>
                      
</body>
</html>