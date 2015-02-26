#!/usr/bin/haserl --shell=lua
<% if ENV.SCRIPT_NAME then %>
Content-type: text/html
<% end %>

<%
require("lfs")

function include(name, what)
	file = io.open(string.format("%s/letra/%s", name, what))
	if file then
		print(file:read("*a"))
		file:close()
	end
end

%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<title>Hinário Adventista</title>
</head>
<body>
	<% basepath = lfs.currentdir() %>
	<h1 id="000">Sumário</h1>
	<ul>
	<% for file in lfs.dir(".") do if file:match("^%d%d%d$") then %>
		<li><a href="#<%= file %>"><%= file %>. <% include(file, "nome") %></a></li>
	<% end end %>
	</ul>

	<% for file in lfs.dir(".") do if file:match("^%d%d%d$") then %>
		<h1 id="<%= file %>"><%= file %>. <% include(file, "nome") %></h1>
		<% include(file, "letra.html") %>
	<% end end %>	
</body>
</html>
