<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${author.userName }个人主页</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/dynamic.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/author.css" />
</head>
<body>
<%@include file="header.jsp" %>
<!--好友动态-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <!--动态占8列-->
            <main class="col-md-10 col-md-push-1 main-content">
                <!--作者简单信息-->
                <div class="author">
                    <div class="author-icon">
                        <img src="<%=basePath %>/img/common/poem.PNG" alt="作者个人信息" />
                    </div>
                    <div class="author-name">${author.userName }</div>
                    <div class="author-meta">
                        <span class="author-poem">    <!--暂时不做图标-->
                            <span class="poem-number">25</span>首诗
                        </span>
                        &nbsp;&nbsp;
                        <span class="author-fans">
                            <span class="fans-number">${author.numOfConcerned }</span>人关注
                        </span>
                    </div>
                </div>

                <article id="5" class="dynamic">
                    <div class="dynamic-head">
                        <h1 class="dynamic-title">
                            <a href="zheyeshiyiqie.html">这也是一切</a>   <!--如何跳转到作者的相应页面，参考ghost网站-->
                        </h1>
                        <div class="dynamic-meta">
                            <span class="dynamic-author">
                                作者：
                                <a target="_blank" href="wangsai.html">王赛</a>
                            </span>
                            <time class="dynamic-time" title="2016年9月3日星期六上午9点30分" datetime="2016年9月3日星期六上午9点30分">2016-9-3</time>
                        </div>
                    </div>
                    <div class="dynamic-content">
                        <p>不是一切大树，都被风暴折断；</p>
                        <p>不是一切种子，都找不到生根的土壤；</p>
                        <p>不是一切真情，都流失在人心的沙漠里；</p>
                        <p>不是一切梦想，都甘愿被折断翅膀。</p>
                        <p>不是一切大树，都被风暴折断；</p>
                        <span class="expand">展开全文</span>
                        <p class="hide">不是一切种子，都找不到生根的土壤；</p>
                        <p class="hide">不是一切真情，都流失在人心的沙漠里；</p>
                        <p class="hide">不是一切梦想，都甘愿被折断翅膀。</p>
                        <p class="hide">不是一切大树，都被风暴折断；</p>
                        <p class="hide">不是一切种子，都找不到生根的土壤；</p>
                        <p class="hide">不是一切真情，都流失在人心的沙漠里；</p>
                        <p class="hide">不是一切梦想，都甘愿被折断翅膀。</p>
                        <p class="hide">不是一切大树，都被风暴折断；</p>
                        <p class="hide">不是一切种子，都找不到生根的土壤；</p>
                        <p class="hide">不是一切真情，都流失在人心的沙漠里；</p>
                        <p class="hide">不是一切梦想，都甘愿被折断翅膀。</p>
                        <span class="pack-up hide">收起全文</span>
                    </div>
                    <div class="row">   <!--用row包裹，给图片设置栅格系统-->
                        <div class="dynamic-img col-sm-7 col-xs-9">
                            <img src="img/attached/zheyeshiyiqie.jpg" alt="这也是一切" />
                        </div>
                    </div>
                    <div class="dynamic-action">
                        <div class="row">
                            <ul>
                                <li class="col-xs-3 keep">
                                    <span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>
                                </li>
                                <li class="col-xs-3 share">
                                    <!--触发弹出框的元素设置data-toggle和data-target才可以正常关闭-->
                                    <a href="#" data-toggle="modal" data-target="#myModal">
                                        <span class="glyphicon glyphicon-share"></span><span class="share-number">4</span>
                                    </a>
                                </li>
                                <li class="col-xs-3 comment">
                                    <span class="glyphicon glyphicon-comment"></span><span class="comment-number">4</span>
                                </li>
                                <li class="col-xs-3 thumb">
                                    <span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">8</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--点击转发后，出现遮罩层-->


                    <!--点击评论后，显示的评论记录及评论框-->
                    <div class="comment-wrap">
                        <div class="dynamic-comment">
                            <div class="send-comment">
                                <!--不能在评论框前面放用户名，不同长度的用户名会导致评论框的位置变动-->
                                <a class="head-icon" href="mine.html" target="_blank">
                                    <img src="img/attached/head-icon-mine.jpg" alt="进入我的个人中心" />
                                </a>
                                <textarea name="comment" class="input-comment" rows="2"></textarea>
                                <br />
                                <button class="btn-comment btn btn-default">
                                    评论
                                </button>
                            </div>

                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon1.jpg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">李四</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            在亲和力方面，他仅次于美国脱口秀节目主持人艾伦•德詹尼斯（Ellen DeGeneres)
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon4.jpg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">张三</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            而且，盖茨得到了共和党和民主党两党的共同拥护。
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon3.jpeg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">王五</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            一项新的研究表明，大多数美国人尊敬和仰慕比尔•盖茨（Bill Gates）。如果他竞选美国总统，很多人将会毫不犹豫地投票给他。
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                                <!--其他用户的回复-->
                                <div class="reply-n">
                                    <div class="head-icon">
                                        <img src="img/attached/head-icon1.jpg" alt="" />
                                    </div>
                                    <div class="content">          <!--评论内容-->
                                        <a target="_blank" href="#" class="reviewer">李四</a>
                                        回复
                                        <a target="_blank" href="#" class="reviewer">王五</a>
                                        <div class="reviewer-words">
                                            <div class="triangle"></div>
                                            <div class="words">
                                                有道理
                                            </div>
                                        </div>
                                    </div>
                                    <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                    <div class="reply hide">
                                        <a href="mine.html" target="_blank" class="head-icon">
                                            <img src="img/attached/head-icon-mine.jpg" alt="" />
                                        </a>
                                        <textarea name="reply" class="input-reply" rows="2"></textarea>
                                        <button class="btn btn-default btn-sm">提交回复</button>
                                    </div>
                                </div>
                                <div class="reply-n">
                                    <div class="head-icon">
                                        <img src="img/attached/head-icon4.jpg" alt="" />
                                    </div>
                                    <div class="content">          <!--评论内容-->
                                        <a target="_blank" href="#" class="reviewer">张三</a>
                                        回复
                                        <a target="_blank" href="#" class="reviewer">李四</a>
                                        <div class="reviewer-words">
                                            <div class="triangle"></div>
                                            <div class="words">
                                                嗯嗯嗯嗯
                                            </div>
                                        </div>
                                    </div>
                                    <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                    <div class="reply hide">
                                        <a href="mine.html" target="_blank" class="head-icon">
                                            <img src="img/attached/head-icon-mine.jpg" alt="" />
                                        </a>
                                        <textarea name="reply" class="input-reply" rows="2"></textarea>
                                        <button class="btn btn-default btn-sm">提交回复</button>
                                    </div>
                                </div>
                            </div>
                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon4.jpg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">王赛</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            目前这个产业中的最大问题就是「年龄歧视」，而这些资料网站就是最主要的原因所在，所以此举最主要的目的就是去解决这样的问题
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="more-comment">
                                <span>加载更多</span>
                            </div>
                        </div>
                    </div>
                </article>


                <article id="4" class="dynamic">
                    <div class="dynamic-head">
                        <h1 class="dynamic-title">
                            <a href="#">抉择</a>   <!--如何跳转到作者的相应页面，参考ghost网站-->
                        </h1>
                        <div class="dynamic-meta">
                           <span class="dynamic-author">
                               作者：
                               <a target="_blank" href="#">张三</a>
                           </span>
                            <time class="dynamic-time" title="2016年9月3日星期六上午9点30分" datetime="2016年9月3日星期六上午9点30分">2016-9-3</time>
                        </div>
                    </div>
                    <div class="dynamic-content">
                        <p>不是一切大树，都被风暴折断；</p>
                        <p>不是一切种子，都找不到生根的土壤；</p>
                        <p>不是一切真情，都流失在人心的沙漠里；</p>
                        <p>不是一切梦想，都甘愿被折断翅膀。</p>
                        <p>不是一切大树，都被风暴折断；</p>
                        <span class="expand">展开全文</span>
                        <p class="hide">不是一切种子，都找不到生根的土壤；</p>
                        <p class="hide">不是一切真情，都流失在人心的沙漠里；</p>
                        <p class="hide">不是一切梦想，都甘愿被折断翅膀。</p>
                        <p class="hide">不是一切大树，都被风暴折断；</p>
                        <p class="hide">不是一切种子，都找不到生根的土壤；</p>
                        <p class="hide">不是一切真情，都流失在人心的沙漠里；</p>
                        <p class="hide">不是一切梦想，都甘愿被折断翅膀。</p>
                        <p class="hide">不是一切大树，都被风暴折断；</p>
                        <p class="hide">不是一切种子，都找不到生根的土壤；</p>
                        <p class="hide">不是一切真情，都流失在人心的沙漠里；</p>
                        <p class="hide">不是一切梦想，都甘愿被折断翅膀。</p>
                        <span class="pack-up hide">收起全文</span>
                    </div>
                    <div class="row">
                        <div class="dynamic-img col-sm-7 col-xs-9">
                            <img src="img/attached/jueze.jpg" alt="抉择" />
                        </div>
                    </div>
                    <div class="dynamic-action">
                        <div class="row">
                            <ul>
                                <li class="col-xs-3 keep">
                                    <span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>  <!--span之间若出现换行，实现出来会有间距-->
                                </li>
                                <li class="col-xs-3 share">
                                    <a href="#" data-toggle="modal" data-target="#myModal">
                                        <span class="glyphicon glyphicon-share"></span><span class="share-number">4</span>
                                    </a>
                                </li>
                                <li class="col-xs-3 comment">
                                    <span class="glyphicon glyphicon-comment"></span><span class="comment-number">4</span>
                                </li>
                                <li class="col-xs-3 thumb">
                                    <span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">10</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--点击评论后，显示的评论记录及评论框-->
                    <div class="comment-wrap">
                        <div class="dynamic-comment">
                            <div class="send-comment">
                                <!--不能在评论框前面放用户名，不同长度的用户名会导致评论框的位置变动-->
                                <a class="head-icon" href="mine.html" target="_blank">
                                    <img src="img/attached/head-icon-mine.jpg" alt="进入我的个人中心" />
                                </a>
                                <textarea name="comment" class="input-comment" rows="2"></textarea>
                                <br />
                                <button class="btn-comment btn btn-default">
                                    评论
                                </button>
                            </div>

                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon1.jpg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">李四</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            zzaiaaaaaaaa在亲和力方面，他仅次于美国脱口秀节目主持人艾伦•德詹尼斯（Ellen DeGeneres)
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon4.jpg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">张三</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            而且，盖茨得到了共和党和民主党两党的共同拥护。
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon3.jpeg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">王五</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            一项新的研究表明，大多数美国人尊敬和仰慕比尔•盖茨（Bill Gates）。如果他竞选美国总统，很多人将会毫不犹豫地投票给他。
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复图标-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="comment">
                                <div class="head-icon">
                                    <img src="img/attached/head-icon4.jpg" alt="" />
                                </div>
                                <div class="content">          <!--评论内容-->
                                    <a target="_blank" href="#" class="reviewer">王赛</a>
                                    <div class="reviewer-words">
                                        <div class="triangle"></div>
                                        <div class="words">
                                            目前这个产业中的最大问题就是「年龄歧视」，而这些资料网站就是最主要的原因所在，所以此举最主要的目的就是去解决这样的问题
                                        </div>
                                    </div>
                                </div>
                                <span class="reply-or-delete">回复</span>   <!--回复-->
                                <!--点击回复后-->
                                <div class="reply hide">
                                    <a href="mine.html" target="_blank" class="head-icon">
                                        <img src="img/attached/head-icon-mine.jpg" alt="" />
                                    </a>
                                    <textarea name="reply" class="input-reply" rows="2"></textarea>
                                    <button class="btn btn-default btn-sm">提交回复</button>
                                </div>
                            </div>
                            <div class="more-comment">
                                <span>加载更多</span>
                            </div>
                        </div>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>

<!--点击转发后，弹出模态框-->
<div class="modal" id="myModal" data-backdrop="false" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">转发</h4>
            </div>
            <div class="modal-body">
                <div class="share-content">
                    <a class="share-author" target="_blank" href="#"></a>
                    : &nbsp;
                    <span class="share-title"></span>
                </div>
                <div class="share-word">
                    <textarea name="share-word" id="share-word" cols="100" rows="5" title="20">请输入转发理由</textarea>
                    <span class="remain-word">120</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary">转发</button>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/dynamic.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
});
</script>
</body>
</html>