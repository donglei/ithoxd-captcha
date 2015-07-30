module ithox.captcha.captcha;

import std.random;
import ithox.image.color;
import ithox.image.png;

///验证码使用到的字符串
package enum ITHOX_CAPTCHA_CHARACTER = "abcdefghkmnprstuvwyzABCDEFGHKLMNPRSTUVWYZ23456789";

class IthoxCaptcha{
	private {
		///宽
		int _width = 100;
		///高
		int _height = 36;
		///背景色
		string _background = "#EDF7FF";
		///验证码长度
		ubyte _length = 4;
		///字体
		ubyte _fontSize = 18;
		///验证码
		string _code ="donglei";
		///图片
		IndexedImage image;
	}

	this()
	{
		this._code = "";
	}

	this(int width, int height)
	{
		this();
		this._width = width;
		this._height = height;
	}

	@property void width(int _width)
	{
		this._width = _width;
	}
	///宽度
	@property int width()
	{
		return this._width;
	}

	@property void height(int _h)
	{
		this._height = _h;
	}
	@property int height()
	{
		return this._height;
	}

	@property void background(string _background)
	{
		this._background = _background;
	}
	@property string background()
	{
		return this._background;
	}

	@property string code()
	{
		return this._code;
	}



	@property void length(ubyte _length)
	{
		this._length = _length;
	}
	@property ubyte length()
	{
		return this._length;
	}

	@property void fontSize(ubyte _size)
	{
		this._fontSize = _size;
	}
	@property ubyte fontSize()
	{
		return this._fontSize;
	}

	///输出图片 base64 压缩的图片
	string render()
	{
		this._code = "";
		randCode();
		initCanvas();
		initBackground();
		import ithox.image.png;
		writePng("test-captcha.png", image);
		return "";
	}
	///生成随机吗
	private void randCode()
	{
		for(ubyte i = 0; i< this._length; i++)
		{
			this._code ~= ITHOX_CAPTCHA_CHARACTER[uniform(0, 49)];
		}
	}
	///初始化画布
	private void initCanvas()
	{
		image = new IndexedImage(_width, _height);
	}
	///初始化背景
	private void initBackground()
	{
		image.addColor(Color.fromString(_background));
	}


}

unittest{
	auto captcha = new IthoxCaptcha(100, 50);
	captcha.render();
	import std.experimental.logger.core;
	logf("width is %s code is %s", captcha.width, captcha.code);
}