"use strict";$(document).ready(function(){$(".premium").click(function(n){n.preventDefault(),$("\n      .landing, \n      .plane, \n      nav, \n      footer, \n      .right-side img, \n      .right-side svg, \n      .left-side,\n      .backarrow\n    ").addClass("active"),setTimeout(function(){$(".signin-form").addClass("active")},1600)}),$(".backarrow").click(function(){$(".signin-form, .signup-form").removeClass("active"),setTimeout(function(){$("\n        .landing, \n        .plane, \n        nav, \n        footer, \n        .right-side img, \n        .right-side svg, \n        .left-side,\n        .backarrow\n      ").removeClass("active")},600)}),$(".signin-form").submit(function(n){n.preventDefault();var i={user:{email:$(".signin-form input[type=email]").val(),password:$(".signin-form input[type=password]").val()}};$.ajax({type:"post",url:"/authentications",data:i,success:function(n){"OK"===n.status?window.location.pathname="/profile":window.location.pathname="/"}})}),$(".number-input").keydown(function(){var n=void 0;$(this).val().length>15&&(n=$(this).val().slice(0,15),$(this).val(n))}),$(".input-field").submit(function(n){if(n.preventDefault(),$(".number-input").val()>10){$(".number-input").val()}else{$(".number-input").val()}var i=new XMLHttpRequest;i.open("POST","https://api.linktexting.com/sendLink",!0),i.setRequestHeader("Content-type","application/x-www-form-urlencoded"),i.send("linkId="+data.linkId+"&number="+data.number)}),$("#login, #signup").click(function(){$(".signin-form, .signup-form").toggleClass("active")})});