<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">

 <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
 <script src="/resources/js/bootstrap.min.js"></script>

 <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/extra-libs/multicheck/multicheck.css">
    <link href="/resources/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
   <!--  <link href="/resources/ dist/css/style.min.css" rel="stylesheet">  -->
    

    <link href="/resources/css/sb-admin.css" rel="stylesheet"> 

    <title>CRUD게시판</title>
</head>
<body>
<button id="testBtn" class="btn">모달 테스트</button>
  <!-- 회원가입 확인 Modal-->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">모달테스트</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">내용 입력 !!</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>


<script>
$('#testBtn').click(function(e){
	e.preventDefault();
	$('#testModal').modal("show");
});
</script>


</body>
</html>

