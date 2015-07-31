import std.stdio;
import ithox.captcha;

void main()
{
	auto captcha = new IthoxCaptcha(125,42);
	captcha.length = 6;
	captcha.fontSize = 30;
	captcha.drawCode();
	captcha.save("./cache/" ~ captcha.code ~ ".gif");
	import std.experimental.logger.core;
	//log(cast(string)captcha.render("gif"));
	log(captcha.renderBase64("gif"));
	logf("width is %s code is %s", captcha.width, captcha.code);


}
