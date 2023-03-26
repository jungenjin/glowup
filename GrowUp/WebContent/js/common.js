/**
 * common files
 */
var context = "/Stationery";

function fn_back(){
	history.back();
}

function fn_isLogin(sessionValue, loginUrl, toUrl){
	if(sessionValue == null || sessionValue == ''){
		alert('로그인 후 사용 가능합니다.');
		location.href = loginUrl;
	}else{
		location.href = toUrl;
	}
}

function fn_validation(){
	var obj = $("input[required=required],select[required=required],textarea[required=required]");
	var objSize = obj.size();
	var selectedObj;
	var alertMsg;

	for(var i = 0; i < objSize; i++){
		if(obj.eq(i).val() == ""){
			/* by 김은주 230326, label 선택하도록 코드 수정*/
			/*alertMsg = obj.eq(i).parent().parent().find("label").eq(0).children().next().text();*/
			alertMsg = obj.parent().parent().find("label").eq(i).text().replace("*", "");
			//console.log("label",obj.parent().parent().find("label").eq(i).text().replace("*", ""));
			
			alertMsg += "을(를) 입력해주세요.";

			alert(alertMsg);

			selectedObj = obj.eq(i);
			$(selectedObj).animate({
				backgroundColor : "red",
			}, 200, function(){
				$(selectedObj).animate({
					backgroundColor : "white",
				}, 200);
			});

			selectedObj.focus();
			return false;
		}

	}
	return true;

}

$(document).keydown(function(e){
	if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA" && e.target.nodeName != "SELECT"){
		if(e.keyCode === 8){
			return false;
		}
		window.history.forward(0);
	}
});

function fn_init(){
	var obj = $("input[required=required],select[required=required],textarea[required=required]");
	var objSize = obj.size();

	var selectObj = $("select");
	var selectObjSize = selectObj.size();
	var divSize = 0;

	for(var i = 0; i < objSize; i++){
		/* by 김은주 230326, label 선택하도록 코드 수정*/
		/*obj.eq(i).parent().parent().find("label").eq(0).prepend("<font color='red'>*&nbsp;</font>");*/
		obj.eq(i).parent().parent().find("label").prepend("<font color='red'>*&nbsp;</font>");
		//console.log("label", obj.eq(i).parent().parent().find("label").prepend("<font color='red'>*&nbsp;</font>"));
		if(obj.eq(i).prop("tagName") != "TEXTAREA"){
			divSize = obj.eq(i).parent().parent().children("div").size();
			if(divSize > 1){
				i += divSize - 1;
				continue;
			}
		}
	}

	for(var i = 0; i < selectObjSize; i++){
		selectObj.eq(i).prepend("<option value=''>--선택--</option>");

		selectObj.eq(i).find("option").eq(1).prop("selected", false);
		selectObj.eq(i).find("option").eq(0).prop("selected", true);
	}

}

function fn_checkAll(){
	var checkbox = $("input[name='chkBox']");
	var checkedCnt = $("input[name='chkBox']:checked").length;

	if( checkedCnt == 0){
		$("#allChk").prop("checked", true);
		for(var i = 0; i < checkbox.length; i++){
			checkbox.eq(i).prop("checked", true);
		}
	}else if( checkedCnt != 0){
		$("#allChk").prop("checked", false);
		for(var i = 0; i < checkbox.length; i++){
			checkbox.eq(i).prop("checked", false);
		}
	}
}

function fn_showKeyCode(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;

	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || ( keyID >=33 && keyID <= 40 )
				|| keyID === 45 || keyID === 12 || keyID === 8)
	{
		return;
	}
	else
	{
		return false;
	}
	/* 48~57:일반 숫자키 코드, 96~105:숫자키패드 숫자키 코드 */
}


/* by 김은주 230326 datatables 관련 설정 추가 */ 
$(document).ready(function() {
	let dte = $('#dataTables-example');
	//datatables를 사용한다면
	if(dte.length) {
		dte.DataTable({
	    	 order: [[3, 'desc']], //3은 날짜컬럼 순서
	  	  	 language : {
	    	    emptyTable:   '등록된 게시글이 없습니다.',
	    	    info:         '_TOTAL_건',
	    	    infoEmpty:    '0건',
	    	    infoFiltered: '(전체 _MAX_건)',
	    	    lengthMenu:	  '<select>'+
								  '<option value="10">10</option>'+
								  '<option value="20">20</option>'+
								  '<option value="30">30</option>'+
								  '<option value="40">40</option>'+
								  '<option value="50">50</option>'+
								  '<option value="-1">전체</option>'+
							  '</select>',
	    	    search:		  '',
	   			searchPlaceholder: '검색어를 입력하세요.',
	    	    zeroRecords:	   '검색 결과가 없습니다.',
	    	    paginate: {
	                first:    '<i class="fa-solid fa-angles-left"></i>',
	                previous: '<i class="fa-solid fa-angle-left"></i>',
	                next:     '<i class="fa-solid fa-angle-right"></i>',
	                last:     '<i class="fa-solid fa-angles-right"></i>'
	            },
			} //end language
		});
	} //end if
});