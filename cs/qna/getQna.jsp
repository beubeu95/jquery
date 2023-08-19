<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.vo.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    String path31 = request.getContextPath();
%>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    //3. DB연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. 조회수 처리
    int count=0;
    String sql = "UPDATE qna SET cnt=cnt+1 WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    count = pstmt.executeUpdate();
    pstmt.close();

    //5. sql 실행 및 실행결과 받기
    sql = "SELECT * FROM qna WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    //6. 실행결과(ResultSet) 인 해당 Qna 1건 qna(질문및답변) 객체에 넣기
    rs = pstmt.executeQuery();
    QnA qna = new QnA();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 및 답변 글 상세보기</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../../css/google.css">
    <link rel="stylesheet" href="../../css/fonts.css">
<<<<<<< HEAD
    <link rel="stylesheet" href="<%=path31 %>/css/content_header.css">
=======
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
>>>>>>> aed05a99c11ba34714156f42723e5d35599919f2

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/header.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            /*background-image: url("../../images/bg_visual_overview.jpg");*/
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:#8CB964; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:100px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CB964; color:#fff; font-size: 18px;
            float:left; margin-right: 20px; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../../css/footer.css">
    <style>

    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
<<<<<<< HEAD
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/cs/qna/qnaList.jsp">QnA</a> &gt; <span>질문 및 답변</span></p>
            <h2 class="page_tit">QnA</h2>
            </div>
=======
    <div class="content_header">
        <div class="breadcrumb">
            <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>">QnA</a> &gt; <span> 질문 및 답변 </span> </p>
            <h2 class="page_tit"> QnA </h2>
>>>>>>> aed05a99c11ba34714156f42723e5d35599919f2
        </div>
    </div>
        <section class="page" id="page1">
            <div class="page_wrap">
<<<<<<< HEAD

=======
                <hr>
>>>>>>> aed05a99c11ba34714156f42723e5d35599919f2
                <table class="tb1" id="myTable">
                    <tbody>
                    <!-- 6. 해당 글번호에 대한 글 상세내용 출력 -->
                    <tr>
                        <th>유형</th>
                        <td>
                            <% if(qna.getLev()==0) { %>
                            <span>질문</span>
                            <% } else { %>
                            <span>답변</span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=qna.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td><%=qna.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            <% if(sid!=null && sid.equals("admin")) { %>
                            <span title="<%=qna.getAuthor()%>"><%=qna.getName() %></span>
                            <% } else { %>
                            <span><%=qna.getName() %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=qna.getResdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=qna.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- 7. 용도별 링크 버튼 추가 -->
                            <!-- 현재 글이 질문 글이면,
                                로그인한 사람만 답변하기,
                                질문을 등록한 사람(관리자포함)만 질문글 수정,
                                질문글 삭제 버튼 추가
                             아니면(답변 글이면),
                                답변을 등록한 사람(관리자포함)만 답변글 삭제,
                                답변글 버튼 수정 -->
                            <!-- 모든 사용자 목록 버튼 추가 -->
                            <% if(qna.getLev()==0) { %>
                            <% if(sid!=null) { %>
                            <a href="/cs/qna/addQuestion.jsp?lev=1&par=<%=qna.getQno() %>" class="inbtn">답변하기</a>
                            <% } %>
                            <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                            <a href="/cs/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">질문 수정하기</a>
                            <a href="/cs/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=0" class="inbtn">질문 삭제하기</a>
                            <% } %>
                            <% } else { %>
                            <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                            <a href="/cs/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">답변 수정하기</a>
                            <a href="/cs/qna/delQna.jsp?qno=<%=qna.getQno() %>&lev=1" class="inbtn">답변 삭제하기</a>
                            <% } %>
                            <% } %>
                            <a href="/cs/qna/qnaList.jsp" class="inbtn">목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>