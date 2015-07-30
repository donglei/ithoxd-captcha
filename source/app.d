import std.stdio;
import ithox.captcha;

void main()
{
	auto captcha = new IthoxCaptcha(100, 50);
	captcha.length = 5;
	captcha.render();
	import std.experimental.logger.core;
	logf("width is %s code is %s", captcha.width, captcha.code);
}
