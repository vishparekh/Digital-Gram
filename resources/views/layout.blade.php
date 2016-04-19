<!DOCTYPE html>
<html>
	<head>
		@include('includes.head')
	</head>
	<body class="skin-blue">
		@include('includes.header')
		@include('includes.main')
		@yield('content')
		@include('includes.script')
	</body>
</html>