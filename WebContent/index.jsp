<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>LOGIN PAGE</title>
<link href="style.css" media="screen" rel="stylesheet" />
<script type="text/javascript" src="jScripts/regExControls.js"></script>
</head>

<body>
	<div id='wrapper'>

		<!-- Menu -->
		<div id='menu'>
			<div id='left-corner'></div>
			<div id='middle-box'>
				<ul>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</div>
			<div id='right-corner'></div>
			<div style="clear: both;"></div>
		</div>


		<!-- banner -->

		<div>
			<p></p>

			<p></p>
		</div>

		<!-- Content -->
		<div id='big-content'>
			<div id='top-content'></div>
			<div id='content'>
				<form action="login" method="post">
					<table class="cssTable">
					<tr><td></td><td></td></tr>
						<tr>
							<td>User Name :</td>
							<td><input type="text" name="username" placeholder="User Name" onblur="usualControl(this.value)"/><br/></td>
						</tr>
						<tr>
							<td>Password :</td>
							<td><input type="password" name="password" placeholder="User Password" onblur="passwordControl(this.value)"/><br /></td>
						</tr>
						<tr>
						<td></td><td><input type="submit" value="LOGIN" class="btnClass"/></td>
						</tr>
					</table>
				</form>
				<div style="clear: both;"></div>
				<div id="footer"></div>
			</div>
			<div id='bottom-content'></div>
		</div>
	</div>
</body>
</html>
