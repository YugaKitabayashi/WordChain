<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*" %>

<%
//リクエスト・レスポンスとも文字コードをUTF-8に
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String chain = "0";
String root = "";

List<String> examples = new ArrayList<>(Arrays.asList("NHK","和歌山県","YouTube","エジプト","Google","富士山","徳川家康","新幹線","天文学者","ゼウス","聖徳太子","アンペア"));
Collections.shuffle(examples);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chain Word</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
    	<h2><span><i class="fas fa-star"></i></span>Chain Word</h2>
    	<script src="coding.js"></script>
    	<script src="lib/anime.js"></script>
    	<div class="tree" style="position: relative;">
	    	<div class="node0 parent-1" id="word0">
	    		<div class="word">
				    Chainをはじめる
				    <form action="result.jsp" method="GET">
						<input class="text" type="text" name="root" size="40" value="<%= root%>">
						<input class="submit" type="submit" value="決定">
						<input type="hidden" name="chain" size="40" value="<%= chain %>">
					</form>
				</div>
			</div>
			<div class="node1 parent0" id="word1">
				<div class="word">
					<a href="result.jsp?root=<%= examples.get(0) %>&chain=0"><%= examples.get(0) %></a>
				</div>
			</div>
			<div class="node1 parent0" id="word2">
				<div class="word">
					<a href="result.jsp?root=<%= examples.get(1) %>&chain=0"><%= examples.get(1) %></a>
				</div>
			</div>
			<div class="node1 parent0" id="word3">
				<div class="word">
					<a href="result.jsp?root=<%= examples.get(2) %>&chain=0"><%= examples.get(2) %></a>
				</div>
			</div>
			<div class="node1 parent0" id="word4">
				<div class="word">
					<a href="result.jsp?root=<%= examples.get(3) %>&chain=0"><%= examples.get(3) %></a>
				</div>
			</div>
			<div class="node1 parent0" id="word5">
				<div class="word">
					<a href="result.jsp?root=<%= examples.get(4) %>&chain=0"><%= examples.get(4) %></a>
				</div>
			</div>
			<canvas id="canvas" width="800" height="800"></canvas>
		</div>
		<div>
			<p>使い方</p>
			<p>検索窓に言葉を入れて決定を押すと、関連ワードのChainが繋がります。</p>
			<p>周りの言葉をクリックするとその言葉のChainが繋がります。</p>
		</div>
    </body>
</html>
