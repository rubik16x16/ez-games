<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Email verification</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<style>

		.cmn-btn {

			position: relative;
			color: rgb(255, 255, 255);
			font-size: 18px;
			font-weight: 900;
			text-transform: uppercase;
			background: #7400D3;
			box-shadow: 0px 4px 0px #57049A;
			border-radius: 28px;
			transition: all ease 0.3s;
			padding: 12px 30px;
			text-decoration: none;
			display: inline-block;
		}

		.cmn-btn:hover{

			background: #4E01CE;
			box-shadow: 0px 4px 0px #4707B3;
			transition: all ease 0.3s;
		}

		.card {

			background: #4E01CE;
			max-width: 700px;
			margin: 0 auto;
			border-radius: 30px;
		}

		.card .card-content {

			color: white;
			border-radius: 30px;
			padding: 30px;
			background: #360589;
			text-align: center;
		}

		.card .card-header {

			text-align: center;
		}

		.card .card-header img {

			margin: 40px 0;
		}

		.card .card-header .title {

			width: 35%;
			margin: 40px auto;
		}

		.card .card-header .sub-title {

			text-align: center;
		}

	</style>
</head>
<body>
	<div class="card">
		<div class="card-header">
			<img src="{{ asset('images/ez-logo.png') }}" class="card-logo" alt="">
		</div>
		<div class="card-content">
			<h1 style="text-align: center;">Invitation</h5>
			<p style="text-align: center;">You have been invited to the tournament: {{ $tournament->name }}</p>
			<a href="{{ env('APP_URL') . '?register=true' }}" style="margin: 40px 0; width: 100%; text-align: center;" type="submit" class="cmn-btn">REGISTER</a>
			<p style="text-align: center;">FOLLOW US ON ALL SOCIALS</p>
			<div>
				<a href="https://twitter.com/ezbattles"><img src="{{ asset('images/social-bg1.png') }}" alt="image"></a>
				<a href="https://www.instagram.com/ezbattles/"><img src="{{ asset('images/social-bg2.png') }}" alt="image"></a>
				<a href="https://discord.gg/GmyGB6RKUZ"><img src="{{ asset('images/social-bg3.png') }}"></a>
				<a href="https://www.facebook.com/ezbattlesusa"><img src="{{ asset('images/social-bg4.png') }}" alt="image"></a>
			</div>
		</div>
	</div>
</body>
</html>
