# sys-version
Gradle 构建时为应用模块设定版本、添加版本查询接口。

## 特性
* 以 Spring Cloud starter 项目为例。
* Gradle 构建，多层模块结构。同时演示一份微服务模块的代码结构。
* 自动解释版本号，计算和设定版本信息，添加相关编译信息；提供版本查询 REST 接口。
* styleguide 一份代码风格规范及说明。

## 缘由
线上测试、生产等情形都可能需要清楚应用当前部署的版本，所以遵循 [《语义化版本 2.0.0》](https://semver.org/lang/zh-CN/) 版本号规范的最佳实践，按模块各自提供一个版本查询接口，整合到基于 Maven 或 Gradle 构建的项目。

## 用法

### 相关实现
* **gradle.properties** 指定当前版本
* **build.gradle 和 base-common/build.gradle 等** 相关 Gradle task 方法。如 getVersionCode, getVersionName 等
* **version.properties** 上面相关 Gradle task 自动生成的版本信息。生成位置在 build 目录下，最后被打包，例如 trace-service/build/resources/main/version.properties
* **SysController** 每个模块提供自己的版本查询接口。接口路径为 /sys/version 。这个接口已由 ResourceServerConfiguration 处理无需 token 即可访问

### 编译和使用
（1） 每到发布新版本时，先在 ```gradle.properties``` 按版本管理和约定，指定当前版本号。

<pre>
version=v2.9.0
</pre>

（2） build-all-projects.sh 直接运行 ```bash build-all-projects.sh``` 或参考其中的编译命令单独编译。

<pre>
#!/bin/sh

# build_type 有 release 或 test 等

cd base-common; ./gradlew clean build -P build_type=release; cd ..
cd trace-service; ./gradlew clean build -P build_type=release; cd ..
</pre>

（3） 访问版本查询接口获取版本信息 ```curl http://localhost:8085/trace/sys/version```

<pre>
{
    "version": "v2.9.0",
    "versionDetail": "v2.9.0 gcf79aeb b202008131107",
    "versionCode": 20900,
    "name": "trace-service"
}
</pre>

其中， versionDetail 包括编译时间 b202008131107 （前缀为 b）， 当前编译时 Git 最新提交ID gcf79aeb （前缀为 g）。
versionCode 为自动计算的整形版本号，方便版本上报，版本比较等。

### FAQ

（1） 什么情况下显示 unknown version ？

读取版本信息依赖于 version.properties 的自动生成内容。这个文档只有在 Gradle 或 Maven 构建过程中才生成，参见如 Gradle 的 processResources.doLast
任务。如果从 IDE 如 Intellij IDEA 的 Spring Boot Run/Debug Configurations 启动 trace-service 则因为缺少 version.properties ，所以显示
unknown version 。如果需要测试是显示有意义的值，可以在构建后从 trace-service/build/resources/main/version.properties 复制一份到
trace-service/src/main/resources/version.properties ，重新运行。但注意仅供测试参考，也不要提交到代码库。

（2） 运行日志不停刷新 Connection refused: connect 及 Cannot execute request on any known server 错误？

前者部分与 org.springframework.cloud:spring-cloud-starter-config 配置中心依赖有关。为了演示方便，已略去配置中心，也没有外部运行配置中心，所以默认
尝试连接配置中心 Fetching config from server at: http://localhost:8888 时报错。

前者另一部分和后者与注册中心有关。 注解 EnableEurekaClient 决定了模块作为客户端注册到注册中心，目前已略去也没有外部运行，所以不断尝试重连而报错。

如果的确需要去除，请按参考文档把配置中心、注册中心等先运行起来。

（3） 下一步还能做什么？

前端在需要的地方显示版本号是调用查询接口；运维可以整合部署模块的版本信息到统一界面，方便查询管理；自动化构建整合需要时使用，等等。

## 其他

### Maven 版本
见另一个代码库。

### Spring Cloud starter
* 注册中心，配置中心，认证中心等已略去。 trace-service 的配置改回本地 Spring Boot 配置项。

### 代码风格 styleguide
详情见 [docs/styleguide/README.md](/docs/styleguide/README.md)
