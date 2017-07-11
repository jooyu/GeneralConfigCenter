<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 表单验证 jQuery Validation</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${ctx!}/assets/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx!}/assets/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx!}/assets/css/animate.css" rel="stylesheet">
    <link href="${ctx!}/assets/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                       <h5>jQuery Validate 简介</h5> 
                    </div>
                    <div class="ibox-content">
                        <p>jquery.validate.js 是一款优秀的jQuery表单验证插件。</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>资源编辑</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="frm" method="post" action="${ctx!}/admin/ranklist/edit">
                        	<input type="hidden" id="id" name="id" value="${ranklist.id}">
                       
                            <div class="form-group">
                                <label class="col-sm-3 control-label">游戏id：</label>
                                <div class="col-sm-8">
                                    <input id="gameId" name="gameId" class="form-control" type="text" value="${ranklist.gameId}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">排行榜id：</label>
                                <div class="col-sm-8">
                                    <input id="leaderboardid" name="leaderboardid" class="form-control" type="text" value="${ranklist.leaderboardid}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">周期类型：</label>
                                <div class="col-sm-8">
                                	<select name="expireType" class="form-control">
                                		<option value="0" <#if ranklist.expireType == 0>selected="selected"</#if>>永久</option>
                                		<option value="1" <#if ranklist.expireType == 1>selected="selected"</#if>>按天</option>
                                		<option value="2" <#if ranklist.expireType == 2>selected="selected"</#if>>按周</option>
                                		<option value="3" <#if ranklist.expireType == 3>selected="selected"</#if>>按月</option>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">上榜人数：</label>
                                <div class="col-sm-8">
                                    <input id="limitRows" name="limitRows" class="form-control" value="${ranklist.limitRows}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">分区分值：</label>
                                <div class="col-sm-8">
                                    <input id="scorePartion" name="scorePartion" class="form-control" value="${ranklist.scorePartion}" placeholder="若无分区，分值填   -1">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">排序：</label>
                                <div class="col-sm-8">
                                    <input id="sortRule" name="sortRule" class="form-control" value="desc">  <!-- ${ranklist.sortRule}--!>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">mysql配置：</label>
                                <div class="col-sm-8">
                                    <input id="mysqlConfig" name="mysqlConfig" class="form-control" value="${ranklist.mysqlConfig}">
                                </div>
                            </div>
                        <div class="form-group">
                                <label class="col-sm-3 control-label">redis配置：</label>
                                <div class="col-sm-8">
                                    <input id="redisConfig" name="redisConfig" class="form-control" value="${ranklist.redisConfig}">
                                </div>
                            </div>
                       <!--     <div class="form-group">
                                <label class="col-sm-3 control-label">创建时间：</label>
                                <div class="col-sm-8">
                                    <input id="createTime" name="createTime" class="form-control" value="${ranklist.createTime}">
                                </div>
                            </div>-->
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <!-- 全局js -->
    <script src="${ctx!}/assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx!}/assets/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${ctx!}/assets/js/content.js?v=1.0.0"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="${ctx!}/assets/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx!}/assets/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx!}/assets/js/plugins/layer/layer.min.js"></script>
    <script src="${ctx!}/assets/js/plugins/layer/laydate/laydate.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
	  	
	    $("#frm").validate({
    	    rules: {
    	    	gameId: {
    	    	number:true,
    	        required: true,
    	      },
    	      	leaderboardid: {
    	      	number:true,
    	        required: true,
    	      
    	      },
    	      	expireType: {
    	        required: true
    	      },
    	      	limitRows: {
    	        required: true
    	      },
    	      	scorePartion: {
    	        required: true,
    	        number:true
    	      },
    	      	sortRule: {
    	      
    	        required: true
    	      },
    	      	mysqlConfig: {
    	        maxlength: 40
    	      },
    	      	redisConfig: {
    	      	 maxlength: 40
    	    
    	      }
    	    },
    	    messages: {},
    	    submitHandler:function(form){
    	    	$.ajax({
   	    		   type: "POST",
   	    		   dataType: "json",
   	    		   url: "${ctx!}/admin/ranklist/edit",
   	    		   data: $(form).serialize(),
   	    		   success: function(msg){
	   	    			layer.msg(msg.message, {time: 2000},function(){
	   						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	   						parent.layer.close(index); 
	   					});
   	    		   }
   	    		});
            } 
    	});
    });
    </script>

</body>

</html>
