#!/usr/bin/haserl --shell=lua
<% if ENV.SCRIPT_NAME then %>
Content-type: text/html
<% end %>

<%
require("lfs")

dirlist = { }

for file in lfs.dir(".") do
	if file:match("^%d%d%d$") then
		table.insert(dirlist, file)
	end
end

table.sort(dirlist)

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
	<% for i,v in ipairs(dirlist) do %>
		<li><a href="#<%= v %>"><%= v %>. <% include(v, "nome") %></a></li>
	<% end %>
	</ul>
	<% for i,v in ipairs(dirlist) do %>
		<h1 id="<%= v %>"><%= v %>. <% include(v, "nome") %></h1>
		<% include(v, "letra.html") %>
	<% end %>
</body>
</html>
