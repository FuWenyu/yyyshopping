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
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" type="text/javascript">
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
	
	var $vendorCodeInput = $("#vendor_code");
	// 更多选项
	$vendorCodeInput.click(function() {
		$.dialog({
			title: "售货机列表",
			[@compress single_line = true]
				content: '
					<table id="vendorListTable" class="list">
						<tr>
							<th class="check">
								<input type="checkbox" id="selectAll" />
							</th>
							<th>
								<a href="javascript:;" class="sort" name="vendor_code">自动售货机编码</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="position">坐标（经纬度）</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="address">地址</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="shophours">营业时间</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="name">名称</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="discount">折扣</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="privilege">优惠</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="image">图片</a>
							</th>
						</tr>
						[#list vendorList as vendor]
							<tr>
								<td>
									<input type="checkbox" name="ids" value="${vendor.id}" />
								</td>
								<td>
									${vendor.vendor_code}
								</td>
								<td>
									${vendor.name}
								</td>
								<td>
									${vendor.position}
								</td>
								<td>
									${vendor.address}
								</td>
								<td>
									${vendor.shophours}
								</td>
								<td>
									${vendor.discount}
								</td>
								<td>
									${vendor.privilege}
								</td>
								<td>
									<a href="${base}/${vendor.image}" target="_blank">${vendor.image}</a>
								</td>
							</tr>
						[/#list]
					</table>
				',
			[/@compress]
			width: 1000,
			modal: true,
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				var checkNum = 0;
				$("#vendorListTable :input[checked]").each(function() {
					//var $this = $(this);
					//console.info(this);
					checkNum += 1;
					//$("#" + $this.attr("name")).val($this.val());
				});
				if(checkNum!=1){
					alert("请选择一项");
				}else{
					$("#vendorListTable :input[checked]").each(function() {
						//console.info($($($(this).parent()[0]).next()[0]).text());
						$("#vendor_id").val(this.value);
						$("#vendor_code").val($($($(this).parent()[0]).next()[0]).text());
						$("#vendor_name").val($($($($(this).parent()[0]).next()[0]).next()[0]).text());
					});
				}
			}
		});
	});
	
	var $sn = $("#sn");
	// 更多选项
	$sn.click(function() {
		$.dialog({
			title: "商品列表",
			[@compress single_line = true]
				content: '
					<table id="productListTable" class="list">
						<tr>
							<th class="check">
								<input type="checkbox" id="selectAll" />
							</th>
							<th>
								<a href="javascript:;" class="sort" name="vendor_code">编号</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="position">名称</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="address">商品分类</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="shophours">销售价</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="name">成本价</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="discount">是否上架</a>
							</th>
							<th>
								<a href="javascript:;" class="sort" name="privilege">创建日期</a>
							</th>
						</tr>
						[#list page.content as product]
							<tr>
								<td>
									<input type="checkbox" name="ids" value="${product.id}" />
								</td>
								<td>
									${product.sn}
								</td>
								<td>
									${product.name}
								</td>
								<td>
									${product.productCategory}
								</td>
								<td>
									${product.price}
								</td>
								<td>
									${product.cost}
								</td>
								<td>
									${product.isMarketable}
								</td>
								<td>
									${product.createDate}
								</td>
							</tr>
						[/#list]
					</table>
					[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
						[#include "/admin/include/pagination.ftl"]
					[/@pagination]
				',
			[/@compress]
			width: 1000,
			modal: true,
			ok: "${message("admin.dialog.ok")}",
			cancel: "${message("admin.dialog.cancel")}",
			onOk: function() {
				var checkNum = 0;
				$("#productListTable :input[checked]").each(function() {
					//var $this = $(this);
					//console.info(this);
					checkNum += 1;
					//$("#" + $this.attr("name")).val($this.val());
				});
				if(checkNum!=1){
					alert("请选择一项");
				}else{
					$("#productListTable :input[checked]").each(function() {
						//console.info($($($(this).parent()[0]).next()[0]).text());
						$("#product_id").val(this.value);
						$("#sn").val($($($(this).parent()[0]).next()[0]).text());
						console.info($($($(this).parent()[0]).next()[0]).next()[0]);
						$("#product_name").val($($($($(this).parent()[0]).next()[0]).next()[0]).text());
					});
				}
			}
		});
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 添加售货机
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<input type="hidden" id="vendor_id" name="vendor_id" />
		<input type="hidden" id="product_id" name="product_id" />
		<table class="input">
			<!-- <tr>
				<th>
					<span class="requiredField">*</span>售货机ID:
				</th>
				<td>
					<input type="text" name="vendor_id" class="text" maxlength="200" />
				</td>
			</tr> -->
			<tr>
				<th>
					<span class="requiredField">*</span>售货机编码:
				</th>
				<td>
					<input type="text" id="vendor_code" name="vendor_code" class="text" maxlength="200" readonly />(点击选择)
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>售货机名称:
				</th>
				<td>
					<input type="text" id="vendor_name" name="vendor_name" class="text" maxlength="200" readonly />
				</td>
			</tr>
			<!-- <tr>
				<th>
					<span class="requiredField">*</span>商品ID:
				</th>
				<td>
					<input type="text" name="product_id" class="text" maxlength="200" />
				</td>
			</tr> -->
			<tr>
				<th>
					<span class="requiredField">*</span>商品编码:
				</th>
				<td>
					<input type="text" id="sn" name="sn" class="text" readonly />(点击选择)
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>商品名称:
				</th>
				<td>
					<input type="text" id="product_name" name="product_name" class="text" maxlength="200" readonly />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>余量:
				</th>
				<td>
					<input type="text" name="number" class="text" maxlength="200" />
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