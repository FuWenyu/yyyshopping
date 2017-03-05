<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.deliveryCenter.add")} - EASY SHOPPING</title>
<meta name="author" content="EASY SHOPPING Team" />
<meta name="copyright" content="EASY SHOPPING" />
<link href="${base}/resources/admin/css/commonWithoutPage.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${base}/resources/admin/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${base}/resources/admin/jquery-easyui/themes/icon.css" />
<!-- <script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script> -->
<script type="text/javascript" src="${base}/resources/admin/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/jquery-easyui/jquery.easyui.min.js"></script>
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
	
	$("#proList").datagrid({
		fitColumns:true,
		pagination:true,
		fit:true,
		border:false,
		rownumbers:true,
		singleSelect:true,
		url:'${base}/admin/product/productList.jhtml',
		method:'get',
		toolbar:'#product_tb',
		footer:'#product_ft',
		columns:[[
			{field:'ck',checkbox:true},
			{field:'sn',title:'编号'},
			{field:'name',title:'名称'},
			{field:'productCategory',title:'商品分类',formatter: function(value,row,index){ return value.name}},
			{field:'price',title:'销售价'},
			{field:'cost',title:'成本价'},
			{field:'isMarketable',title:'是否上架',formatter: function(value,row,index){ if(value==true){return '是'}else{return '否'}}},
			{field:'createDate',title:'创建日期',formatter: function(value,row,index){ return new Date(value).Format("yyyy-MM-dd HH:mm:ss")}}
	    ]],
	    onClickRow:function(index,row){
	    	console.info(row);
	    	$("#product_id").val(row.id);
	    	$("#sn").val(row.sn);
	    	$("#product_name").val(row.name);
	    }
	});
	// displayMsg:"展示 {from} 到 {to} 共 {total} 条记录"
	$("#proList").datagrid('getPager').pagination({
		beforePageText:"第",
		afterPageText:"页/共{pages}页",
		displayMsg:"展示 {from} 到 {to} 共 {total} 条记录"
	});
	
	$("#vendorList").datagrid({
		fitColumns:true,
		pagination:true,
		fit:true,
		border:false,
		rownumbers:true,
		singleSelect:true,
		url:'${base}/admin/vending_machine/vendorList.jhtml',
		method:'get',
		toolbar:'#vendor_tb',
		footer:'#vendor_ft',
		columns:[[
			{field:'ck',checkbox:true},
			{field:'vendor_code',title:'自动售货机编码'},
			{field:'position',title:'坐标（经纬度）'},
			{field:'address',title:'地址'},
			{field:'shophours',title:'营业时间'},
			{field:'name',title:'名称'},
			{field:'discount',title:'折扣'},
			{field:'privilege',title:'优惠'},
			{field:'createDate',title:'创建时间',formatter: function(value,row,index){ return new Date(value).Format("yyyy-MM-dd HH:mm:ss")}}
	    ]],
	    onClickRow:function(index,row){
	    	console.info(row);
	    	$("#vendor_id").val(row.id);
	    	$("#vendor_code").val(row.vendor_code);
	    	$("#vendor_name").val(row.name);
	    }
	});
	// displayMsg:"展示 {from} 到 {to} 共 {total} 条记录"
	$("#vendorList").datagrid('getPager').pagination({
		beforePageText:"第",
		afterPageText:"页/共{pages}页",
		displayMsg:"展示 {from} 到 {to} 共 {total} 条记录"
	});

});

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
var o = {
   "M+": this.getMonth() + 1, //月份 
   "d+": this.getDate(), //日 
   "H+": this.getHours(), //小时 
   "m+": this.getMinutes(), //分 
   "s+": this.getSeconds(), //秒 
   "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
   "S": this.getMilliseconds() //毫秒 
};
if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
for (var k in o)
if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
return fmt;
}
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
					<input type="text" id="vendor_code" name="vendor_code" class="text" maxlength="200" onclick="$('#vendorWindow').window('open')" readonly />(点击选择)
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
					<input type="text" id="sn" name="sn" class="text" onclick="$('#proWindow').window('open')" readonly />(点击选择)
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
	<div id="proWindow" class="easyui-window" title="商品清单" data-options="modal:true,closed:true" style="width:950px;height:500px;">
		<table id="proList"></table>
		<div id="product_tb" style="padding:2px 5px;">
			商品信息: <input class="easyui-textbox" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
		<div id="product_ft" style="padding:2px 5px;text-align: right;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="$('#proWindow').window('close')">选择</a>
		</div>
	</div>
	<div id="vendorWindow" class="easyui-window" title="售货机清单" data-options="modal:true,closed:true" style="width:950px;height:500px;">
		<table id="vendorList"></table>
		<div id="vendor_tb" style="padding:2px 5px;">
			售货机信息: <input class="easyui-textbox" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
		<div id="vendor_ft" style="padding:2px 5px;text-align: right;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="$('#vendorWindow').window('close')">选择</a>
		</div>
	</div>
</body>
</html>