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
</head>
<body>
	<h1 id="<%= num %>"><%= num %>. <%in nome %></h1>
	<%in letra.html %>
</body>
</html>
