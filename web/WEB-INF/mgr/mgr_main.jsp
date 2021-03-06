<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${ctx }/css/style.css"
          type="text/css"/>
    <link rel="stylesheet" href="${ctx }/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx }/css/pageStyle.css">

</head>
<body style="background:#f3f3f3;">

<div class="main_top">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">文章管理
        </strong><small></small></div>
    </div>
    <hr>
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button id="add" class="am-btn am-btn-default">
                        <span class="am-icon-plus"></span> 新增
                    </button>
                </div>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">

        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <div class="am-input-group am-input-group-sm">
                <input type="text" class="am-form-field" id="input_search"
                       value="<s:property value="#parameters.keyWord"/>">
                <span class="am-input-group-btn">
                    <button class="am-btn am-btn-default" type="button" id="input_search_btn">搜索</button>
                </span>
            </div>
        </div>
    </div>
</div>

<div class="goods_list">
    <ul class="title_ul">
        <li>序号</li>
        <li>标题</li>
        <li>分类</li>
        <li>编辑</li>
        <li>删除</li>
    </ul>

    <s:iterator value="#pageBean.list" var="article">
        <ul class="list_goods_ul">
            <li><s:property value="#article.articleId"/></li>
            <li><s:property value="#article.articleTitle"/></li>
            <li><s:property value="#article.category.cname"/></li>
            <li>
                <a href="${pageContext.request.contextPath}/article_edit.action?articleId=<s:property value="#article.articleId"/>">
                    <img class="img_icon" src="${ctx }/images/edit_icon.png" alt=""></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/article_delete.action?articleId=<s:property value="#article.articleId"/>">
                    <img class="img_icon" src="${ctx }/images/delete_icon.png" alt="">
                </a>
            </li>
        </ul>
    </s:iterator>

    <!--分页-->
    <div id="page" class="page_div"></div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<script>

    //分页
    $("#page").paging({
        pageNo: <s:property value="#pageBean.currentPage"/>,
        totalPage: <s:property value="#pageBean.totalPage"/>,
        totalSize: <s:property value="#pageBean.totalCount"/>,
        callback: function (num) {
            // 获取搜索的关键字
            var keyWord = $('#input_search').val();
            $(window).attr('location', '/article_pageList.action?currPage=' + num + "&keyWord=" + keyWord);
            // alert(num);
        }
    });

    $("#add").click(function () {
        $(window).attr('location','${ctx }/location_add_article.action');
    });

    $('#input_search_btn').click(function () {
        // 获取搜索的关键字
        var keyWord = $('#input_search').val();
        $(window).attr('location', '/article_pageList.action?keyWord=' + keyWord);
    });
</script>

</body>
</html>