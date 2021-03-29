<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 타이들은 각자의 페이지에서 넣기! -->
    <!-- <title>Document</title> -->

	<tiles:insertAttribute name="asset"></tiles:insertAttribute>

</head>
<body>

    <tiles:insertAttribute name="header"></tiles:insertAttribute>

	<tiles:insertAttribute name="nav1"></tiles:insertAttribute>
    
	<tiles:insertAttribute name="nav2"></tiles:insertAttribute>

    <tiles:insertAttribute name="content"></tiles:insertAttribute>
    
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>

</body>
</html>