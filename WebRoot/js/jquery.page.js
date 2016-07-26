//分页插件
/**
2014-08-05 ch
**/
	var 	ptotalRow=100,
			ppageSize=10,
			ppageCount =10,
			pcurrent=1;
	var ms = {
		init:function(obj,args){
			return (function(){
				ms.fillHtml(obj,args);
				ms.bindEvent(obj,args);
			})();
		},
		//填充html
		fillHtml:function(obj,args){
			return (function(){
				obj.empty();
				//上一顿
				if(args.current > 1){
					obj.append('<a href="javascript:;" class="prevPage">上一页</a>');
				}else{
					obj.remove('.prevPage');
					obj.append('<span class="disabled">上一页</span>');
					
				}
				//中间页码
				if(args.current != 1 && args.current >= 4 && args.pageCount != 4){
					obj.append('<a href="javascript:;" class="tcdNumber">'+1+'</a>');
				}
				if(args.current-2 > 2 && args.current <= args.pageCount && args.pageCount > 5){
					obj.append('<span>...</span>');
				}
				var start = args.current -2,end = args.current+2;
				if((start > 1 && args.current < 4)||args.current == 1){
					end++;
				}
				if(args.current > args.pageCount-4 && args.current >= args.pageCount){
					start--;
				}
				for (;start <= end; start++) {
					if(start <= args.pageCount && start >= 1){
						if(start != args.current){
							obj.append('<a href="javascript:;" class="tcdNumber">'+ start +'</a>');
						}else{
							obj.append('<span class="current">'+ start +'</span>');
						}
					}
				}
				if(args.current + 2 < args.pageCount - 1 && args.current >= 1 && args.pageCount > 5){
					obj.append('<span>...</span>');
				}
				if(args.current != args.pageCount && args.current < args.pageCount -2  && args.pageCount != 4){
					obj.append('<a href="javascript:;" class="tcdNumber">'+args.pageCount+'</a>');
				}
				//下一顿
				if(args.current < args.pageCount){
					obj.append('<a href="javascript:;" class="nextPage">下一页</a>');
				}else{
					obj.remove('.nextPage');
					obj.append('<span class="disabled">下一页</span>');
				}
				obj.append('跳转至<input type="text" calss="pagego" id="pagegoo"></input><a href="javascript:;" class="apagego">go</a>');
				switch(ppageSize){
					case 1:obj.append('<span>当前页面大小</span><select id="changeselect111" class="changeselect"> <option value="1">1</option><option value="4" >4</option> <option value="9" >9</option> </select>');
					break;
					case 4:obj.append('<span>当前页面大小</span><select id="changeselect111" class="changeselect"> <option value="1">1</option><option value="4" selected >4</option> <option value="9" >9</option> </select>');
					break;
					case 9:obj.append('<span>当前页面大小</span><select id="changeselect111" class="changeselect"> <option value="1">1</option><option value="4" >4</option> <option value="9" selected>9</option> </select>');
					break;
					default:obj.append('<span>当前页面大小</span><select id="changeselect111" class="changeselect"> <option value="1">1</option><option value="4" >4</option> <option value="9" >9</option> </select>');
					break;
				}
				})();
		},
		//绑定事件
		bindEvent:function(obj,args){
			return (function(){
				obj.on("click","a.tcdNumber",function(){
					var current = parseInt($(this).text());
					pcurrent=current;
					var pagesize = parseInt($(".changeselect").val());
					ppageSize=pagesize;
					if(typeof(args.backFn)=="function"){
						args.backFn(current,ppageSize);
					}
				});
				//上一顿
				obj.on("click","a.prevPage",function(){
					var current = parseInt(obj.children("span.current").text());
					pcurrent=current-1;	
					var pagesize = parseInt($(".changeselect").val());
					ppageSize=pagesize;
					if(typeof(args.backFn)=="function"){
						args.backFn(current-1,ppageSize);
					}				
				});
				//下一页
				obj.on("click","a.nextPage",function(){
					var current = parseInt(obj.children("span.current").text());
					var pagesize = parseInt($(".changeselect").val());
					ppageSize=pagesize;
					pcurrent=current+1;		
					if(typeof(args.backFn)=="function"){
						args.backFn(current+1,ppageSize);
					}
				});
				//跳转至1
				obj.on("click","a.apagego",function(){
					var current = parseInt($("#pagegoo").val());
					if(current<=args.pageCount&&current!=null){
					pcurrent=current;
					var pagesize = parseInt($(".changeselect").val());
					ppageSize=pagesize;
					if(typeof(args.backFn)=="function"){
					args.backFn(current,ppageSize);
					}
					}
					else{
						alert("请输入正确跳转的页数");
					}					
				});
				//跳转至2
				obj.on("keyup","#pagegoo",function(){
					 if(event.keyCode == 13){
						var current = parseInt($("#pagegoo").val());
					if(current<=args.pageCount&&current!=null){
					pcurrent=current;
					var pagesize = parseInt($(".changeselect").val());
					ppageSize=pagesize;
					if(typeof(args.backFn)=="function"){
					args.backFn(current,ppageSize);
					}
					}
					else{
						alert("请输入正确跳转的页数");
					}	
				}					
				});
				//页面大小
				obj.on("change","select.changeselect",function(){
					var current = 1;
					var pagesize = parseInt($(".changeselect").val());
					ppageSize=pagesize;
					pcurrent=current;
					if(typeof(args.backFn)=="function"){
						args.backFn(current,pagesize);
					}
				});
			})();
		}
	};
	$.fn.createPage = function(options1,options2){
		var args = $.extend({
			pageSize:10,
			pageCount : 10,
			current : 1,
			backFn : function(){}
		},options1,options2);
		ms.init(this,args);
	};
function funa(p,arg){
	var argg ={
			pageSize:ppageSize,
			pageCount : arg.pageCount,
			current : pcurrent};
	ms.fillHtml(p,argg);
};