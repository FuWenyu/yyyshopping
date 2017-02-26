<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.deliveryCenter.edit")} - EASY SHOPPING</title>
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
			vendor_name: "required",
			sn: "required",
			product_name: "required",
			number: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 编辑售货机
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${inventory.id}" />
		<input type="hidden" name="vendor_id" value="${inventory.vendor_id}" />
		<input type="hidden" name="product_id" value="${inventory.product_id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>售货机ID:
				</th>
				<td>
					<input type="text" name="vendor_id" class="text" maxlength="200" value="${inventory.vendor_id}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>售货机编码:
				</th>
				<td>
					<input type="text" name="vendor_code" class="text" value="${inventory.vendor_code}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>售货机名称:
				</th>
				<td>
					<input type="text" name="vendor_name" class="text" value="${inventory.vendor_name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>商品ID:
				</th>
				<td>
					<input type="text" name="product_id" class="text" maxlength="200" value="${inventory.product_id}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>商品编码:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="sn" name="sn" value="${inventory.sn}" class="text" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>商品名称:
				</th>
				<td>
					<input type="text" name="product_name" class="text" value="${inventory.product_name}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>余量:
				</th>
				<td>
					<input type="text" name="number" class="text" value="${inventory.number}" maxlength="200" />
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