#!/usr/bin/haserl --shell=lua
<% if ENV.SCRIPT_NAME then %>
Content-type: text/html
<% num = ENV.SCRIPT_NAME:match("/(%d%d%d)/") %>
<% else num = ENV.PWD:match("/(%d%d%d)/") end %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<title>Hinário Adventista</title>
	<link href="../../vextab.css" media="screen" rel="Stylesheet" type="text/css" />
	<script src="../../vextab-div.js"></script>
	<script>
		VexTabDiv.Flow.Renderer.USE_CANVAS_PROXY = true;
		VexTabDiv.Artist.DEBUG = false
	</script>
</head>
<body>
	<h1 id="<%= num %>"><%= num %>. <%in ../letra/nome %></h1>
	<div class="vex-tabdiv" width=700 scale=1.0>
		<%in tabulatura %>
	</div>
</body>
</html>
