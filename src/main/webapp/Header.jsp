<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <style>
        .header {
            background-color: #000;
            padding: 10px 0;
            text-align: center;
        }

        .header h1 {
            color: #fff;
            margin: 0;
            font-size: 50px;
            cursor: pointer;
        }

        .navigation {
            background-color: #000;
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
        }

        .navigation ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
        }

        .navigation ul li {
            margin-right: 10px;
        }

        .navigation ul li:last-child {
            margin-right: 0;
        }

        .navigation ul li a {
            text-decoration: none;
            color: #fff;
        }

        .navigation ul {
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <h1 onclick="window.location.href='Main.jsp'">PRESTO</h1>
</div>
<div class="navigation">
    <ul>
        <li><a href="#">Models</a></li>
        <li><a href="#">Customer Support</a></li>
        <li><a href="#">Ownership</a></li>
    </ul>
    <ul>
        <li><a href="Login.jsp">login</a></li>
    </ul>
</div>
</body>
</html>
