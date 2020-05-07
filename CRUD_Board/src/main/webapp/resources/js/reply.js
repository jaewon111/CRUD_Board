//ajax함수 및 모듈화

console.log("reply.js 실행");

var replyService = (function(){
	
	//reply.js 등록 
	//추가
	function add(reply, callback, error){
		$.ajax({
			  type : 'post',
			  url  : '/reply/new',
			  data : JSON.stringify(reply),
			  contentType : "application/json; charset=utf-8",
			  success : function(result, status, xhr){
				    if(callback){
				    	callback(result);
				    }
			  },
			 error : function(xhr, status, er){
				   if(error){
					   error(er);
				   }
			 }//end error
		});//end.ajax
	}//end add
	
	//댓글 리스트 조회
	function getList(param, callback, error){
		
		var bno = param.bno; //param 객체를 통해 bno파라미터 저장
		var page = param.page || 1; // param.page 또는 1 저장
		
		$.getJSON("/reply/pages/" + bno + "/" + page + ".json", function(data){
			
			if(callback){
				//callback(data); 댓글 목록만 가져온다.
				callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져온다.
			}//end if
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}//end if
		});//end getJSON	
	}//end getList
	
	
	//댓글 삭제 ajax 
	function remove(rno, callback, error){
		
		$.ajax({
			type : 'delete',
			url : '/reply/' + rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},error : function(xhr, status, er){
				 if(error){
					 error(er);
					 }
			}
		});//end ajax
		
	}//end a_delete
	
	//댓글 수정 ajax
	function update(reply, callback, error){
		console.log("RNO:" + reply.rno);
		
		$.ajax({
			type : 'put',
			url : '/reply/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});//end ajax
	}//end update
	
    //댓글 조회 
	 function get(rno, callback, error){
		 $.get("/reply/"+rno+".json", function(reuslt){
			if(callback){
				callback(reuslt);
			}
		 }).fail(function(xhr, status, err){
			  if(error){
				 error();
			  } 
		 });
		 
		 
	 }
	
	//댓글 등록 날짜
	function displayTime(timeValue){
		 var today = new Date();
		 var gap = today.getTime() - timeValue;
		 
		 var dateObj = new Date(timeValue);
		 var str = "";
		 
		 if(gap < (1000 * 60 * 60 * 24)){
			 var hh = dateObj.getHours();
			 var mi = dateObj.getMinutes();
			 var ss = dateObj.getSeconds();
			 
			 return [(hh > 9 ? '' : '0') + hh, ":", (mi > 9 ? '': '0') + mi,
				     ':', (ss > 9 ? '' : '0') + ss].join('');
		 }else{
			 var yy = dateObj.getFullYear();
			 var mm = dateObj.getMonth() + 1; //getMonth() is zero - based
			 var dd = dateObj.getDate();
			
			 return [yy, '/', (mm > 9 ? '' : '0') + mm, '/',(dd > 9 ? '' : '0') + dd].join('');
		 }
		
	}//end displayTime
	
	return {
		add:add,
	    getList:getList,    	
	    remove:remove,
	    update:update,
	    get:get,
	    displayTime : displayTime
	};
})();