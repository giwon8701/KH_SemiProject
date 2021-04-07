$(document).ready(function() {
	$('#summernote').summernote({ // summernote를 사용하기 위한 선언
		height: 700, // 에디터 높이
		minHeight: 500, // 최소 높이
		maxHeight: 700, // 최대 높이
		focus: true, // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR", // 한글 설정
		placeholder: '글 내용을 입력해 주세요.', //placeholder 설정
		callbacks: { // 콜백을 사용
			// 이미지를 업로드할 경우 이벤트를 발생
			onImageUpload: function(files) {
				console.log(files)
				sendFile(files[0]);
			}
		}
	});
});

/* summernote에서 이미지 업로드시 실행할 함수 */
function sendFile(file) {
	//file ->  summernote에 파일 첨부시 여기로 첨부되여
	// 파일 전송을 위한 폼생성
	var data = new FormData(); // formdata 라는 (서버로 보내기 전에 파일 전송시 이 객체를 생성해야 함. )
	data.append("uploadFile", file); // formdata에 올라온 파일을 첨부
	$.ajax({ // ajax를 통해 파일 업로드 처리
		data: data,
		type: "post",
		url: "fileupload.do", // 서블릿 주소
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(res) { // 처리가 성공할 경우
			var image = $('<img>').attr('src', res.imagePath);
			// 에디터에 이미지 출력
			$('#summernote').summernote('insertNode', image[0]);
			
			if ($('#mainImage').val() === null) {
				$('#mainImage').val(res.thumbnail);
			}
		}
	});
	/// 이 기능이 완료 되면 html 에 출력되용 그게 서버로 날라감~
}