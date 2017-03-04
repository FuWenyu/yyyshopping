<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.deliveryCenter.edit")} - EASY SHOPPING</title>
<meta name="author" content="EASY SHOPPING Team" />
<meta name="copyright" content="EASY SHOPPING" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${base}/resources/admin/jquery-easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${base}/resources/admin/jquery-easyui/themes/icon.css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/jquery-easyui/jquery.easyui.min.js"></script>
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
	
	$("#proList").datagrid({
		pagination:true,
		fit:true,
		border:false,
		rownumbers:true,
		singleSelect:true,
		url:'${base}/admin/product/productList.jhtml',
		method:'get',
		toolbar:'#tb',
		footer:'#ft',
		columns:[[
			{field:'ck',checkbox:true},
			{field:'sn',title:'编号',width:200},
			{field:'name',title:'名称',width:400},
			{field:'productCategory',title:'商品分类',width:100,formatter: function(value,row,index){ return value.name}},
			{field:'price',title:'销售价',width:100},
			{field:'cost',title:'成本价',width:100},
			{field:'isMarketable',title:'是否上架',width:100,formatter: function(value,row,index){ if(value==true){return '是'}else{return '否'}}},
			{field:'createDate',title:'创建日期',width:150,formatter: function(value,row,index){ return new Date(value).Format("yyyy-MM-dd HH:mm:ss")}}
	    ]],
	    onClickRow:function(index,row){
	    	console.info(row);
	    	$("#product_id").val(row.id);
	    	$("#sn").val(row.sn);
	    	$("#product_name").val(row.product_name);
	    }
	});
	// displayMsg:"展示 {from} 到 {to} 共 {total} 条记录"
	$("#proList").datagrid('getPager').pagination({
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
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; 编辑售货机
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${inventory.id}" />
		<input type="hidden" id="vendor_id" name="vendor_id" value="${inventory.vendor_id}" />
		<input type="hidden" id="product_id" name="product_id" value="${inventory.product_id}" />
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
			<!-- <tr>
				<th>
					<span class="requiredField">*</span>商品ID:
				</th>
				<td>
					<input type="text" name="product_id" class="text" maxlength="200" value="${inventory.product_id}" />
				</td>
			</tr> -->
			<tr>
				<th>
					<span class="requiredField">*</span>商品编码:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="sn" name="sn" value="${inventory.sn}" class="text" onclick="$('#proWindow').window('open')" readonly/>
					</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>商品名称:
				</th>
				<td>
					<input type="text" name="product_name" class="text" value="${inventory.product_name}" readonly />
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
	<div id="proWindow" class="easyui-window" title="商品清单" data-options="modal:true,closed:true" style="width:80%;height:500px;">
		<table id="proList"></table>
		<div id="tb" style="padding:2px 5px;">
			商品信息: <input class="easyui-textbox" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
		<div id="ft" style="padding:2px 5px;text-align: right;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="$('#proWindow').window('close')">选择</a>
		</div>
	</div>
</body>
</html>