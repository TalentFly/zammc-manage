<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>活动管理</title>
    <link rel="stylesheet" href='${rootURL}resources/css/ace.min.css'/>
    <link rel="stylesheet" href="${rootURL}resources/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${rootURL}resources/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${rootURL}resources/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${rootURL}resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${rootURL}resources/css/common.css"/>
    <!--[if IE 7]-->
    <link rel="stylesheet" href="${rootURL}resources/css/font-awesome-ie7.min.css"/>
    <!--[if lte IE 8]-->
    <link rel="stylesheet" href="${rootURL}resources/css/ace-ie.min.css"/>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>
    <!--头部开始-->
    <div class="navbar-container" id="navbar-container">
        <%@include file="../header.jsp" %>
    </div><!-- /.container -->
    <!--头部结束-->
</div>

<!--主屏-->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <!--菜单开始-->
        <div class="sidebar" id="sidebar">
            <%@include file="../menu.jsp" %>
        </div>
        <!--菜单结束-->

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                    <li class="active">控制台</li>
                </ul><!-- .breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="名称" class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- #nav-search -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <h3 class="header smaller lighter blue">活动列表</h3>
                        <a class="btn btn-info" href="${ctx}/manage/activity/toAdd">
                            新增
                            <i class="icon-print  align-top bigger-125 icon-on-right"></i>
                        </a>
                        <div class="table-header">
                            活动信息
                        </div>

                        <div class="table-responsive">
                            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center">
                                        <label>
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th>活动内容</th>
                                    <th class="hidden-480">创建时间</th>
                                    <th class="hidden-480">活动状态</th>
                                    <th class="hidden-480">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="activity" items="${ page.content}" varStatus="in">
                                    <tr>
                                        <td class="center">
                                            <label>
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td>${activity.activityName}</td>
                                        <td class="hidden-480">${activity.createTime}</td>
                                        <td class="hidden-480">
                                            <c:if test="${activity.status == '0'}">
                                                <span class="label label-sm label-success">启用</span>
                                            </c:if>
                                            <c:if test="${activity.status == '1'}">
                                                <span class="label label-sm label-inverse arrowed-in">禁用</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                <c:if test="${activity.status == 1}">
                                                    <a class="btn btn-xs btn-success startUsingActivity"
                                                            data="${activity.activityId}" url="/manage/activity/startUsing">
                                                        <i class="icon-ok bigger-120">启用</i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${activity.status == 0}">
                                                    <a class="btn btn-inverse btn-xs forbiddenActivity" data="${activity.activityId}" url="/manage/activity/forbidden">
                                                        <i class="icon-lock bigger-120">禁用</i>
                                                    </a>
                                                </c:if>
                                                <a class="btn btn-xs btn-danger deleteActivity"
                                                        data="${activity.activityId}" url="/manage/activity/deleteActivity">
                                                    <i class="icon-trash bigger-120">删除</i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <jsp:include page="../page.jsp" flush="true"/>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
</body>
<script type="text/javascript" src="${rootURL}resources/js/jQuery.min.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/jQuery.form.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/common.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/activity/activity-list.js"></script>
</html>