ithox captcha
=======
captcha write in dlang


#生成验证码
-----

* 1、支持设置验证码的宽高、字体大小、字粗、验证码长度
* 2、支持保存成文件；例如：captcha.gif captcha.jpg captcha.png
* 3、支持直接输出 base64 图片数据

##ps:
 * 生成图片的时候 gif 最小 png次之 png最大，建议使用gif格式输出验证码

##Example Code
----

```c#

	auto captcha = new IthoxCaptcha(125,42);
	captcha.length = 6;
	captcha.fontSize = 30;
	captcha.drawCode();
	captcha.save("./cache/" ~ captcha.code ~ ".gif");
	import std.experimental.logger.core;
	//log(cast(string)captcha.render("gif"));
	log(captcha.renderBase64("gif"));
	logf("width is %s code is %s", captcha.width, captcha.code);
	
```
