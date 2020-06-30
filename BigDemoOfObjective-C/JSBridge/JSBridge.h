
1.JS判断设备类型
     var u = navigator.userAgent;
     var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
     var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

     var browser={
         versions:function(){
                 var u = navigator.userAgent, app = navigator.appVersion;
                 return {         //移动终端浏览器版本信息
                     trident: u.indexOf('Trident') > -1, //IE内核
                     presto: u.indexOf('Presto') > -1, //opera内核
                     webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                     gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                     mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                     ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                     android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
                     iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
                     iPad: u.indexOf('iPad') > -1, //是否iPad
                     webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
                 };
              }(),
         language:(navigator.browserLanguage || navigator.language).toLowerCase()
     }
                                    
    var os = this.os = {},
        browser = this.browser = {},
        webkit = ua.match(/Web[kK]it[\/]{0,1}([\d.]+)/),
        android = ua.match(/(Android);?[\s\/]+([\d.]+)?/),
        osx = !!ua.match(/\(Macintosh\; Intel /),
        ipad = ua.match(/(iPad).*OS\s([\d_]+)/),
        ipod = ua.match(/(iPod)(.*OS\s([\d_]+))?/),
        iphone = !ipad && ua.match(/(iPhone\sOS)\s([\d_]+)/),
        webos = ua.match(/(webOS|hpwOS)[\s\/]([\d.]+)/),
        win = /Win\d{2}|Windows/.test(platform),
        wp = ua.match(/Windows Phone ([\d.]+)/),
        touchpad = webos && ua.match(/TouchPad/),
        kindle = ua.match(/Kindle\/([\d.]+)/),
        silk = ua.match(/Silk\/([\d._]+)/),
        blackberry = ua.match(/(BlackBerry).*Version\/([\d.]+)/),
        bb10 = ua.match(/(BB10).*Version\/([\d.]+)/),
        rimtabletos = ua.match(/(RIM\sTablet\sOS)\s([\d.]+)/),
        playbook = ua.match(/PlayBook/),
        chrome = ua.match(/Chrome\/([\d.]+)/) || ua.match(/CriOS\/([\d.]+)/),
        firefox = ua.match(/Firefox\/([\d.]+)/),
        firefoxos = ua.match(/\((?:Mobile|Tablet); rv:([\d.]+)\).*Firefox\/[\d.]+/),
        ie = ua.match(/MSIE\s([\d.]+)/) || ua.match(/Trident\/[\d](?=[^\?]+).*rv:([0-9.].)/),
        webview = !chrome && ua.match(/(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/),
        safari = webview || ua.match(/Version\/([\d.]+)([^S](Safari)|[^M]*(Mobile)[^S]*(Safari))/)

2.

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

