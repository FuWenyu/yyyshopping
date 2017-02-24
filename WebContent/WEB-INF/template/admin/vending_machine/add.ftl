<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.deliveryCenter.add")} - EASY SHOPPING</title>
<meta name="author" content="EASY SHOPPING Team" />
<meta name="copyright" content="EASY SHOPPING" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	[@flash_message /]
	
	// 地区选择
	$areaId.lSelect({
		url: "${base}/admin/common/area.jhtml"
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			vendor_code: "required",
			position: "required",
			address: "required",
			shophours: "required",
			name: "required",
			discount: "required",
			privilege: "required",
			image: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 添加售货机
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>自动售货机编码:
				</th>
				<td>
					<input type="text" name="vendor_code" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>坐标（经纬度）:
				</th>
				<td>
					<input type="text" name="position" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>地址:
				</th>
				<td>
					<span class="address">
						<input type="text" id="address" name="address" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>营业时间:
				</th>
				<td>
					<input type="text" name="shophours" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>折扣:
				</th>
				<td>
					<input type="text" name="discount" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>优惠:
				</th>
				<td>
					<input type="text" name="privilege" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>图片:
				</th>
				<td>
					<input type="text" name="image" value="false" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>