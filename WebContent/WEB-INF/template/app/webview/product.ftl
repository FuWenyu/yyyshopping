<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.template.edit")} - HIMILL</title>
<meta name="author" content="HIMILL Team" />
<meta name="copyright" content="HIMILL" />

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");

	[@flash_message /]

	// 表单验证
	$inputForm.validate({
		rules: {
			content: "required"
		}
	});

});
</script>
</head>
<body>
	<div>
		<p>${product.introduction}</p>
	</div>
</body>
</html>