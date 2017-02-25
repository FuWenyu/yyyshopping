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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 编辑售货机
	</div>
	<form id="inputForm" action="update.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${Vendor.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>自动售货机编码:
				</th>
				<td>
					<input type="text" name="vendor_code" class="text" value="${Vendor.vendor_code}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>坐标（经纬度）:
				</th>
				<td>
					<input type="text" name="position" class="text" value="${Vendor.position}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>地址:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="address" name="address" value="${Vendor.address}" class="text" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>营业时间:
				</th>
				<td >
					<input type="text" name="shophours" class="text" value="${Vendor.shophours}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td >
					<input type="text" name="name" class="text" value="${Vendor.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>折扣:
				</th>
				<td>
					<input type="text" name="discount" class="text" value="${Vendor.discount}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>优惠:
				</th>
				<td>
					<input type="text" name="privilege" class="text" value="${Vendor.privilege}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>图片:
				</th>
				<td>
					<input type="hidden" name="image" value="${Vendor.image}" />
					<input type="file" name="imageFile" /><a href="${base}/${Vendor.image}" target="_blank">${Vendor.image}</a>
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