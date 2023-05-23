/*
* HttpClientConfigSetting created by zj 
* on 2020/4/20 2:32 PM
* copyright on zhangjiang
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//只是作为一个测试，
class HttpClientConfigSetting extends StatefulWidget {
  HttpClientConfigSetting({Key? key}) : super(key: key);

  @override
  _HttpClientConfigSetting createState() => _HttpClientConfigSetting();
}

class _HttpClientConfigSetting extends State<HttpClientConfigSetting> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //设置对应的属性
    // idleTimeout  对应请求头中的keep_alive字段值，为了避免频繁的建立连接，httpClient在建立后会保持一段时间，超过这个阈值后才会关闭连接
    // connectTimeOut 和服务器建立连接的超时，超出这个值抛出socketException异常
    // maxConnectionsPerHost 用一个host，同时允许建立的最大数量
    // autoUncompress 对应connect-Encoding,设置为true，请求头中的Content-Encoding的值为当前HttpClient支持的压缩算法列表，目前只有gzip
    // userAgent 对应请求头中的User-Agent
    // 通过HttpClientRequest直接设置的header,只对当前请求生效，通过HttpClient设置的对整个httpClient都生效
  }

  void setHttpClientConfig(){
    //设置认证方式，flutter目前只支持basic和Digest两种认证方式
    HttpClient httpClient = new HttpClient();
    httpClient.addCredentials(Uri.parse("http://www.baidu.com"), "admin", HttpClientBasicCredentials('username','password'));
    httpClient.addCredentials(Uri.parse("http://www.baidu.com/"), "admin",HttpClientDigestCredentials('username','password'));

    //动态添加用户凭证
    httpClient.authenticate = (Uri uri,String scheme,String? realm) async{
      if(uri.host == "xxx.com"){
        httpClient.addCredentials(uri, 'admin', HttpClientBasicCredentials('username','pwd'));
        return true;
      }
      return false;
    };

    //设置代理
    httpClient.findProxy = (uri){
      return "PROXY 192.168.1.2:8888";
    };

    // 证书校验，证书最好为PEG格式，其格式可以为PEG和PKCS12，设置为PKCS12需要设置密码，不安全
    String PEMPath = "";
    httpClient.badCertificateCallback = (X509Certificate cert,String host,int port){
      //证书一致则允许发送数据
      if(cert.pem == PEMPath){
        return true;
      }
      return false;
    };

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HttpClientConfigSetting"),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}