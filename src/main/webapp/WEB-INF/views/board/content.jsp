<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        .content-container {
            width: 60%;
            margin: 150px auto;
            position: relative;
        }

        .content-container .main-title {
            font-size: 24px;
            font-weight: 700;
            text-align: center;
            border-bottom: 2px solid rgb(75, 73, 73);
            padding: 0 20px 15px;
            width: fit-content;
            margin: 20px auto 30px;
        }

        .content-container .main-content {
            border: 2px solid #ccc;
            border-radius: 20px;
            padding: 10px 25px;
            font-size: 1.1em;
            text-align: justify;
            min-height: 400px;
        }

        .content-container .custom-btn-group {
            /* position: absolute;
            bottom: -10%;
            left: 50%;
            transform: translateX(-50%); */
        }

        .content-container .bottom-group {
            display: flex;
            justify-content: space-between;
        }

        .content-container .bottom-group .update-time {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>

<body>

    <div class="wrap">
        <%@ include file="../include/header.jsp" %>

        <div class="content-container">

            <h1 class="main-title">${b.boardNo}번 게시물</h1>

            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">작성자</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
                    value="${b.writer}" disabled>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput2" class="form-label">글제목</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="제목" name="title"
                    value="${b.title}" disabled>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">내용</label>

                <p class="main-content">
                    ${b.content}
                </p>

            </div>

            <div class="bottom-group">
                <div class="update-time">
                    
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">


                    <c:if test="${b.account == loginUser.account || loginUser.auth == 'ADMIN'}">
                        <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                        <button id="del-btn" type="button" class="btn btn-danger">삭제</button>
                    </c:if>
                    

                    <button id="list-btn" type="button" class="btn btn-dark">목록</button>
                </div>
            </div>

            <!-- 댓글 영역 -->

            <div id="replies" class="row">
                <div class="offset-md-1 col-md-10">
                    <!-- 댓글 쓰기 영역 -->
                    <div class="card">
                        <div class="card-body">
                            <div class="row">

                                
								<div class="col-md-9">
									<div class="form-group">
										<label for="newReplyText" hidden>댓글 내용</label>
										<textarea rows="3" id="newReplyText" name="replyText" class="form-control"
											placeholder="댓글을 입력해주세요."></textarea>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="newReplyWriter" hidden>댓글 작성자</label>
										<input id="newReplyWriter" name="replyWriter" type="text"
											class="form-control" placeholder="작성자 이름" style="margin-bottom: 6px;">
										<button id="replyAddBtn" type="button"
											class="btn btn-dark form-control">등록</button>
									</div>
								</div>
                                
                                 

                            </div>
                        </div>
                    </div> <!-- end reply write -->

                    <!--댓글 내용 영역-->
                    <div class="card">
                        <!-- 댓글 내용 헤더 -->
                        <div class="card-header text-white m-0" style="background: #343A40;">
                            <div class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
                        </div>

                        <!-- 댓글 내용 바디 -->
                        <div id="replyCollapse" class="card">
                            <div id="replyData">
                                <!-- 
								< JS로 댓글 정보 DIV삽입 > 
							-->
                            </div>

                            <!-- 댓글 페이징 영역 -->
                            <ul class="pagination justify-content-center">
                                <!-- 
								< JS로 댓글 페이징 DIV삽입 > 
							-->
                            </ul>
                        </div>
                    </div> <!-- end reply content -->
                </div>
            </div> <!-- end replies row -->

            <!-- 댓글 수정 모달 -->
            <div class="modal fade bd-example-modal-lg" id="replyModifyModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header" style="background: #343A40; color: white;">
                            <h4 class="modal-title">댓글 수정하기</h4>
                            <button type="button" class="close text-white" data-bs-dismiss="modal">X</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="form-group">
                                <input id="modReplyId" type="hidden">
                                <label for="modReplyText" hidden>댓글내용</label>
                                <textarea id="modReplyText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요."
                                    rows="3"></textarea>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button id="replyModBtn" type="button" class="btn btn-dark">수정</button>
                            <button id="modal-close" type="button" class="btn btn-danger"
                                data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end replyModifyModal -->

        </div>


        <%@ include file="../include/footer.jsp" %>
    </div>


    <script>
        // const [$listBtn, $modBtn, $delBtn] = [...document.querySelector('div[role=group]').children];

        const $listBtn = document.getElementById('list-btn');
        const $modBtn = document.getElementById('mod-btn');
        const $delBtn = document.getElementById('del-btn');

        //수정버튼
        if ($modBtn !== null) {
            $modBtn.onclick = e => {
                location.href = '/board/modify?boardNo=${b.boardNo}';
            };
        }

        //삭제버튼
        if ($delBtn !== null) {
            $delBtn.onclick = e => {
                if (!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }
                location.href = '/board/delete?boardNo=${b.boardNo}';
            };
        }
        //목록버튼
        $listBtn.addEventListener('click', e => {
            console.log('목록 클릭!');
            location.href = '/board/list?pageNum=${p.pageNum}&amount=${p.amount}'
        });
    </script>

    <!-- 댓글 관련 스크립트 -->
    <script>
        //댓글 처리 js
        //start jquery
        $(function () {

            //원본 글 번호
            const boardNo = '${b.boardNo}';


            //날짜 포맷 변환 함수
            function formatDate(datetime) {
                //문자열 날짜 데이터를 날짜객체로 변환
                const dateObj = new Date(datetime);
                // console.log(dateObj);
                //날짜객체를 통해 각 날짜 정보 얻기
                let year = dateObj.getFullYear();
                //1월이 0으로 설정되어있음.
                let month = dateObj.getMonth() + 1;
                let day = dateObj.getDate();
                let hour = dateObj.getHours();
                let minute = dateObj.getMinutes();

                //오전, 오후 시간체크
                let ampm = '';
                if (hour < 12 && hour >= 6) {
                    ampm = '오전';
                } else if (hour >= 12 && hour < 21) {
                    ampm = '오후';
                    if (hour !== 12) {
                        hour -= 12;
                    }
                } else if (hour >= 21 && hour <= 24) {
                    ampm = '밤';
                    hour -= 12;
                } else {
                    ampm = '새벽';
                }

                //숫자가 1자리일 경우 2자리로 변환
                (month < 10) ? month = '0' + month: month;
                (day < 10) ? day = '0' + day: day;
                (hour < 10) ? hour = '0' + hour: hour;
                (minute < 10) ? minute = '0' + minute: minute;

                return year + "-" + month + "-" + day + " " + ampm + " " + hour + ":" + minute;

            }

            //댓글 페이지 태그 생성 배치함수
            function makePageDOM(pageInfo) {
                let tag = "";

                const begin = pageInfo.beginPage;
                const end = pageInfo.endPage;

                //이전 버튼 만들기
                if (pageInfo.prev) {
                    tag += "<li class='page-item'><a class='page-link page-active' href='" + (begin - 1) +
                        "'>이전</a></li>";
                }

                //페이지 번호 리스트 만들기
                for (let i = begin; i <= end; i++) {
                    const active = (pageInfo.page.pageNum === i) ? 'p-active' : '';
                    tag += "<li class='page-item " + active + "'><a class='page-link page-custom' href='" + i +
                        "'>" +
                        i + "</a></li>";
                }

                //다음 버튼 만들기
                if (pageInfo.next) {
                    tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
                        "'>다음</a></li>";
                }

                //태그 삽입하기
                $(".pagination").html(tag);
            }


            //댓글 태그 생성, 배치 함수
            function makeReplyListDOM(replyMap) {
                let tag = '';

                for (let reply of replyMap.replyList) {
                    tag += "<div id='replyContent' class='card-body' data-replyId='" + reply.replyNo + "'>" +
                        "    <div class='row user-block'>" +
                        "       <span class='col-md-3'>" +
                        "         <b>" + reply.replyWriter + "</b>" +
                        "       </span>" +
                        "       <span class='offset-md-6 col-md-3 text-right'><b>" + formatDate(reply
                            .replyDate) +
                        "</b></span>" +
                        "    </div><br>" +
                        "    <div class='row'>" +
                        "       <div class='col-md-6'>" + reply.replyText + "</div>" +
                        "       <div class='offset-md-2 col-md-4 text-right'>" +
                        "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                        "         <a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>삭제</a>" +
                        "       </div>" +
                        "    </div>" +
                        " </div>";
                }

                //만든 태그를 댓글목록 안에 배치
                //document.querySelector('#replyData').innerHTML = tag;
                $('#replyData').html(tag);

                //댓글 수 배치
                $('#replyCnt').text(replyMap.maker.totalCount);

                //페이지 태그 배치
                makePageDOM(replyMap.maker);
            }

            //댓글 목록 비동기 요청 처리 함수
            function getReplyList(pageNum) {
                fetch('/api/v1/reply?boardNo=' + boardNo + '&pageNum=' + pageNum)
                    .then(res => res.json())
                    .then(replyMap => {
                        console.log(replyMap);
                        makeReplyListDOM(replyMap);
                    });
            }

            //페이지 버튼 클릭 이벤트
            $('.pagination').on('click', 'li a', e => {
                e.preventDefault(); //태그 고유기능 중지
                getReplyList(e.target.getAttribute('href'));
            });

            //페이지 진입시 댓글목록 불러오기
            getReplyList(1);


            //=====================================================//
            //댓글 등록 처리
            $('#replyAddBtn').on('click', e => {

                //서버로 댓글 내용을 전송해서 DB에 저장
                const reqInfo = {
                    method: 'POST', //요청 방식
                    headers: { //요청 헤더 내용
                        'content-type': 'application/json'
                    },
                    //서버로 전송할 데이터 (JSON)
                    body: JSON.stringify({
                        boardNo: boardNo,
                        replyText: $('#newReplyText').val(),
                        replyWriter: $('#newReplyWriter').val()
                    })
                };
                fetch('/api/v1/reply', reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'insert-success') {
                            getReplyList(1);
                            $('#newReplyText').val('');
                            $('#newReplyWriter').val('');
                        } else {
                            alert('댓글 등록에 실패했습니다.');
                        }
                    });
            });


            //=================== 댓글 수정 이벤트 =======================//

            //댓글 수정 창 진입 이벤트
            const $modal = $('#replyModifyModal');
            $('#replyData').on('click', '#replyModBtn', e => {
                //console.log('수정 창 버튼 클릭!');

                //기존 댓글 내용을 가져오기
                const originText = e.target.parentNode.previousElementSibling.textContent;
                console.log(originText);
                //해당 댓글번호 가져오기
                const replyNo = e.target.parentNode.parentNode.parentNode.dataset.replyid;

                //댓글내용 모달에 넣어놓기
                $('#modReplyText').val(originText);
                //input hidden에 댓글번호 넣어놓기
                $('#modReplyId').val(replyNo);
            });

            //댓글 수정 완료 이벤트
            $('#replyModBtn').on('click', e => {

                const rno = $('#modReplyId').val();

                const reqInfo = {
                    method: 'PUT',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        replyNo: rno,
                        replyText: $('#modReplyText').val()
                    })
                };

                fetch('/api/v1/reply/' + rno, reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'modify-success') {
                            //모달 숨김 <-> show : 열림
                            // $modal.modal('hide');
                            $('#modal-close').click();
                            getReplyList(1);
                        } else {
                            alert('댓글 수정 실패!');
                        }
                    });
            });

            //댓글 삭제 비동기 요청 이벤트
            $("#replyData").on("click", "#replyDelBtn", e => {
                const replyId = e.target.parentNode.parentNode.parentNode.dataset.replyid;
                //console.log("삭제 버튼 클릭! : " + replyId);
                if (!confirm("진짜로 삭제할거니??")) {
                    return;
                }
                const reqInfo = {
                    method: 'DELETE'
                };
                fetch('/api/v1/reply/' + replyId, reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if (msg === 'delete-success') {
                            getReplyList(1);
                        } else {
                            alert("댓글 삭제에 실패했습니다.");
                        }
                    })
            });

        });
    </script>

</body>

</html>