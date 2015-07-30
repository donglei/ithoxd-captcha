module ithox.captcha.captcha;

import std.random;
import dmagick.Image;
import dmagick.DrawingContext;
import dmagick.Geometry;
import dmagick.Color;

import std.experimental.logger.core;

///验证码使用到的字符串
package enum ITHOX_CAPTCHA_CHARACTER = "abcdefghkmnprstuvwyzABCDEFGHKLMNPRSTUVWYZ23456789";

class IthoxCaptcha{
	private {
		///宽
		int _width = 100;
		///高
		int _height = 36;
		///背景色
		string _background = "#D1EEEE";
		///验证码长度
		ubyte _length = 4;
		///字体
		ubyte _fontSize = 18;
		///验证码
		string _code ="donglei";
		///图片
		Image image;
		///
		DrawingContext draw;
	}

	this()
	{
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
		this.draw = new DrawingContext();
		image = new Image(Geometry(_width, _height),new Color(_background));
		image.addNoise(NoiseType.ImpulseNoise);
		
			draw.text(10, 20, _code);
			draw.fontSize(20);
			draw.fontWeight(10);
			draw.draw(image);
		image.write(_code ~ ".png");

		logf("code name  is %s ", _code ~ ".png");
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
	

}

unittest{
	auto captcha = new IthoxCaptcha(100, 50);
	captcha.render();
	import std.experimental.logger.core;
	logf("width is %s code is %s", captcha.width, captcha.code);
}