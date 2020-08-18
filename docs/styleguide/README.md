这份“代码风格规范”（style guide）的思路来源于 [google/styleguide 文档](https://google.github.io/styleguide/) ，目前只响应了 Java 语言，即基于其中的 [Java Style Guide](https://google.github.io/styleguide/javaguide.html) 进行调整，结合相关的工具实施。

相关的参考文档和工具
=====================
适用：开发过程阶段，开发人员使用

1. [google/styleguide Github库](https://github.com/google/styleguide)

    > Every major open-source project has its own style guide: a set of conventions (sometimes arbitrary) about how to write code for that project. It is much easier to understand a large codebase when all the code in it is in a consistent style.

    它是这份“代码风格规范”的基础，可时常翻阅。每一条规范都给出了说明，包括前因后果和必要的例子等。它同时提供了常用 IDE 如 Eclispe 和 IntelliJ IDEA 的代码风格配置文件。具体是:

    - eclipse-java-google-style.xml 本目录保存了一个副本 [eclipse-java-google-style-d2227f2-20200512.xml](google-styleguide/eclipse-java-google-style-d2227f2-20200512.xml) 后面的 Eclipse Code Formatter 即导入这份进行初始化。
    - intellij-java-google-style.xml 也对应保存了一个副本 [intellij-java-google-style-d2227f2-20200512.xml](google-styleguide/intellij-java-google-style-d2227f2-20200512.xml)

2. [Check Style - Google Style](https://checkstyle.org/google_style.html)

    > Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard. By default it supports the Google Java Style Guide and Sun Code Conventions, but is highly configurable.

    Check Style 内置了 Google Java Style 的一个实现。关于各项规则具体内容以及是否得到支持，可从这个页面得到详细信息。后面调整时可经常打开来参考。

3. [CheckStyle-IDEA 插件](https://plugins.jetbrains.com/plugin/1065-checkstyle-idea)

    > A plug-in for JetBrains' IntelliJ IDEA 2018-19 which provides real-time feedback against a given CheckStyle profile by way of an inspection.

    这个 IntelliJ IDEA 插件按配置好的规范扫描代码库的源代码，按类别基本统计和罗列不规范的项，提供具体说明和快速跳转，协助修改。

    注意，实施代码风格规范的一个最佳实践是根据实际项目适当调整。例如根据项目/代码库是全新还是已有的，前者可以严格遵守默认实现或最小的调整，后者则更多的适当调整，以便在应用新规范和在已有风格上修改的工作量之间协调，尽力遵守又避免过多工作量，之后坚持执行，保持前后一致。 基于此，本目录提供了一个调整例子：

    - [google_checks-5.30.0-checkstyle8.20.xml](checkstyle/google_checks-5.30.0-checkstyle8.20.xml) 从 checkstyle-idea-5.30.0.zip 里解压出来的默认实现。
    - [google_checks-5.30.0-checkstyle8.20-mods.xml](checkstyle/google_checks-5.30.0-checkstyle8.20-mods.xml) 基于上面默认实现对应的调整。同时在 CheckStyle-IDEA 插件中配置使用。

    可对比查看调整详细，更多说明见后面的“使用说明”等部分。

4. [Eclipse Code Formatter](https://github.com/krasa/EclipseCodeFormatter)

    > Allows using Eclipse's code formatter directly from IntelliJ. Solves the problem of maintaining a common code style in team environments where both IDEA and Eclipse are used.

    这个 IntelliJ IDEA 插件让较大型团队/项目，同时使用 Eclipse 和 IDEA 两个 IDE 的情况下方便地保持一致的规则设定。它协助按配置好的规范按选中、或单个文件、或整个项目的源代码进行自动格式化。更多详细信息，也见后面的“使用说明”等部分。

    - [GoogleStyleEclipse-first-export.xml](eclipse-code-formatter/GoogleStyleEclipse-first-export.xml) 在 Eclipse 里导入上面 eclipse-java-google-style-d2227f2-20200512.xml 后又从 Eclipse 首次导出的规则列表。
    - [GoogleStyleEclipse-mods.xml](eclipse-code-formatter/GoogleStyleEclipse-mods.xml) 在 Eclipse 中进行调整后导出，将应用到 IDEA 中，从而使两个 IDE 的配置保持一致。
    - [static-group-for-google-style.importorder](eclipse-code-formatter/static-group-for-google-style.importorder) 同时导出配套的 Optimize Imports 的配置。

使用说明
=====================

下面以 IDEA 要进行的配置为例说明：

1. （可选）Eclipse: Preferences - Java - Formatter 中分别导入 eclipse-java-google-style-d2227f2-20200512.xml 和 调整过的 GoogleStyleEclipse-mods.xml 。前者仅作对比参考，后者可以按需要继续调整。如果有调整，可重新导出待下一步在 IDEA 里引用。
2. IDEA: 安装 Eclipse Code Formatter 插件。 在 Settings - Other Settings - Eclipse Code Formatter 中，配置 Config File 为调整过的 GoogleStyleEclipse-mods.xml ，从而保证两个 IDE 配置一致。一些选项可考虑使用： Do not format other file types by IntelliJ formatter 选中可保证只影响 Java 源文件（否则，可能如 pom.xml 也影响到），等等。
3. （可选）Eclipse: Preferences - Java - Organize Imports ，导入调整过的 static-group-for-google-style.importorder ，符合 Google Java Style 的调整。
4. IDEA: 在 Settings - Other Settings - Eclipse Code Formatter 中，勾选 Optimize Imports，并配置 From File 为 static-group-for-google-style.importorder 。
5. 应用 Eclipse Code Formatter ：
    - 检查开关： Settings - Other Settings - Eclipse Code Formatter 开头，选中 Disabled 则关闭 Eclipse Code Formatter ，这时，自动格式化会使用 Editor - Code Style - Java 的配置（见后面相关步骤说明）；否则，选中 Use the Eclipse Code Formatter 即启用。
    - 在 Java 源代码中选中要格式化的代码，右键 Reformat Code ，或者快捷键 Ctrl + Alt + L 自动格式化。
    - 或 Project 窗口中单个源文件右键 Reformat Code 。
    - 或 Project 窗口中某个包或某个项目或整个项目右键 Reformat Code 。这种可能涉及较大修改的情况，建议单独只做代码风格格式化的提交，不要杂合业务逻辑的修改。
6. 安装 CheckStyle-IDEA 插件。在 Settings - Other Settings - Checkstyle 中，Configuration File 添加调整过的 google_checks-5.30.0-checkstyle8.20-mods.xml ，并选中。

    > 注意：这份 Check Style - Google Style 的调整已与 Eclipse Code Formatter 中的 Confile File 基本一致，即，通过 Eclipse Code Formatter 自动式化过的源代码被这个插件扫描后，结果基本一致。如果后面发现有不一致的情形，可适当调整两者之一，重新确保一致。 **这一点为了保证基本一致，可能会花费时间和精力。**

7. 随时可进行规范扫描： CheckStyle-IDEA 插件在 IDEA 底部添加 CheckStyle 窗口。分别有扫描当前文件、当前模块、当前整个项目的扫描按钮，等待扫描后显示结果。
8. 根据结果，有需要修改的跳转过去手动直接修改，或者使用 Eclipse Code Formatter 协助自动格式化。然后这个过程不断重复，直到检测到无不规范项为止。

其他说明：

- 关于关闭 Eclipse Code Formatter 不使用它时，Reformat Code 自动格式化会使用 Editor - Code Style - Java 的配置。在这个配置里可以导入 intellij-java-google-style-d2227f2-20200512.xml 。并可通过继续编辑来进行调整。 **但最佳实践建议应该坚持使用 Eclipse Code Formatter ，原因有：（1）在多个 IDE 里方便保持一致的优势。（2）IDEA的 Editor - Code Style - Java 的编辑选项少，支持不足够，有时会有想调整的情况但却没有。而 Eclipse Code Formatter 的选项非常丰富。**
- [CheckStyle-IDEA 插件版本](https://plugins.jetbrains.com/plugin/1065-checkstyle-idea/versions) 的情况。笔者的 IDEA 版本 `IntelliJ IDEA 2018.1 Build #IU-181.4203.550, built on March 27, 2018` 尽管显示为 2018.1 但未达到插件最新版本的 2018.1.8+ IDE 版本要求，所以只能使用最后支持 2017.1.6+ 的插件版本 CheckStyle-IDEA 5.30.0 。即要注意版本对应，否则安装时会报错，无法安装。另外，如果使用最新如 5.37.0 ，也最好相应地要从中解压 google_checks-5.37.0-checkstyleX.XX.xml 来自定义调整，可对比 5.30.0 调整来参考。

规范调整说明
=====================
值得着重提及的有：

1. [Indentation] 默认缩进由 Google Java Style 规范的 2 都改为 4 。因为考虑到，未应用前原代码库的 Java 一般以 4 为缩进。如果改为 2 则变动、修改量过大。但主要考虑是因为缩进 4 也是普遍做法，例如要集成的第三方库可能普遍使用缩进 4 ，为了此考虑，确定使用缩进 4 ，有实际意义。当然，如果系全新项目，使用缩进 2 也属推荐，保证 Google Java Style 原样。
2. [JavadocStyle] 关闭 SummaryJavadoc 。 Google Java Style 要求 java doc 的首行 key sentence 必须要有，且必须要以 "." 英文句点结尾。这个与中文环境不够符合，一般倾向于 key sentence 要有，但能不以句号或同时支持中文句号 "。" 结尾。这一点，关闭 SummaryJavadoc 规则，使用 JavadocStyle 更好自定义。
    - 参考 https://checkstyle.org/config_javadoc.html#SummaryJavadoc
    - 参考 https://checkstyle.org/config_javadoc.html#JavadocStyle
3. 版权声明要求在开头，且一般版权有严格的格式，不宜被自动格式化。刚好 Eclipse Code Formatter 有个对应选项 Enable header comment formatting ，在 Eclipse 中编辑，去掉勾选就可以。
4. 个别名称的大小写要求。如 [AbbreviationAsWordInName] [InterfaceTypeParameterName] [MemberName] 等。像提示“名称 'ActionATGServiceImpl' 中不能出现超过 '2' 个连续大写字母”，“Member name 'yAxis' must match pattern '^[a-z][a-z0-9][a-zA-Z0-9]*$'.”等等。这种情况一般分为几种：一种只是本地变量，基本可以直接修改响应规范；一种是类型如类名或public的方法名等，甚至涉及远程客户端调用，这个则需要较重的代码重构，同时要考虑兼容，需要谨慎处理；还有一类与常量有关，和变量名规范一起处理，可以先确定是否为常量，相对来说也好处理。针对上面，一些匹配正则表达式做了调整，使得像 yAxis 这种有现实意义的名称也能正常使用，同时谨慎对待需要重构的部分，应该目前提供兼容，然后新的代码则需要遵守规范。
    - 参考 Name 部分 https://checkstyle.org/styleguides/google-java-style-20180523/javaguide.html#s5-naming
    - 简单总结： 5.3 Camel case: defined 规范，避免出现超过 2 个连续大写字母。个人觉得这个规范值得遵守，原因意义上比允许连接缩写大写字母更明确、对 Checkstyle 工具友好。对比《阿里巴巴Java开发手册》规范允许 DTO, VO, BO 等情形，觉得不好规范，例如假如有天面对 XO 是允许还是不允许呢。具体例子有：
        - 规范 XmlHttpRequest ，不规范 XMLHTTPRequest
        - 规范 newCustomerId ，不规范 newCustomerID
        - 规范 innerStopwatch ，不规范 innerStopWatch
        - 规范 supportsIpv6OnIos ，不规范 supportsIPv6OnIOS
        - 规范 UserDto ，不规范 UserDTO
5. 响应 CHECKSTYLE:OFF 。有些地方可以显式声明关闭 check style 扫描。要记得 google_checks-5.30.0-checkstyle8.20-mods.xml 要添加选项 `<module name="SuppressionCommentFilter"/>`
6. 若项目原来有不少 Javadoc 缺失，可考虑安装 Javadoc 插件帮助自动补全 javadoc 欠缺的提示，效果尚可。可生成选中元素（如某方法，某成员变量等）的 javadoc ，也可以生成全部 public 方法或成员变量相关的 javadoc 。
    - 参考 http://setial.github.io/intellij-javadocs/
    - 参考 http://plugins.jetbrains.com/plugin/?idea_ce&pluginId=7157

    其他请自行对比以上 xml 配置文件的差异，不少直观了然。

7. 更多关于 Javadoc 。如下为一个符合规范的例子：

    首句 first sentence 之后，空行后必须有 `<p>` 段落标签开头。 Google Java Stytle 要求 `<p>` 后要紧跟内容，现在不遵守这个要求，通过 JavadocParagraph `<property name="allowNewlineParagraph" value="false"/>` 选项禁用了。 **可能类似这个修改，是出于 Eclipse Code Style 配置成与 CheckStyle-IDEA 一致的需要，原因可能前者无法配置出这个规范项，所以就更改了后者。类似这种情况也可以再确认，最好系能尽量遵守 Google Java Style 规范。**

    ```java
    /**
     * 全局拦截器，作用所有的微服务.
     *
     * <p>
     * 1. 对请求头中参数进行处理 from 参数进行清洗 2. 重写StripPrefix = 1,支持全局
     *
     * <p>
     * 支持swagger添加X-Forwarded-Prefix header （F SR2 已经支持，不需要自己维护）
     *
     * @author xyzxyz
     * @date 2018/10/8
     */
    ```

Checkstyle Report 例子
=====================
基于以上调整，应用到本项目上，最后除了上面“调整说明”第 4 点提及的谨慎对待名称重构部分以外，都得到了处理：

* checkstyle-report-master-01-开始首次扫描.txt
    - Checkstyle found 30,476 item(s) in 643 file(s)
* checkstyle-report-master-02-首次自动格式化后.txt
    - Checkstyle found 1,157 item(s) in 509 file(s)
* checkstyle-report-master-10-javadoc缺失等基本消除后.txt
    - Checkstyle found 138 item(s) in 67 file(s)
* checkstyle-report-master-20-最后剩下连接两个大写字母等命名相关.txt
    - Checkstyle found 62 item(s) in 27 file(s)
* checkstyle-report-master-22-最后剩下连接两个大写字母等命名相关-只剩下谨慎处理部分.txt
    - Checkstyle found 13 item(s) in 12 file(s)
最后只剩下名称重构部分 13 个，待完善。

```
Checkstyle found 13 item(s) in 12 file(s)
ActionATGServiceImpl.java : 1 item(s)
名称 'ActionATGServiceImpl' 中不能出现超过 '2' 个连续大写字母。 (33:0) [AbbreviationAsWordInName]
ActionCGServiceImpl.java : 1 item(s)
名称 'ActionCGServiceImpl' 中不能出现超过 '2' 个连续大写字母。 (33:0) [AbbreviationAsWordInName]
...
TaskDTO.java : 1 item(s)
名称 'TaskDTO' 中不能出现超过 '2' 个连续大写字母。 (30:0) [AbbreviationAsWordInName]
UserDTO.java : 1 item(s)
名称 'UserDTO' 中不能出现超过 '2' 个连续大写字母。 (38:0) [AbbreviationAsWordInName]
```

相关的参考文档和工具（自动构建等）
=====================
适用：自动构建、代码质量检查等阶段，开发人员或构建工具等使用

1. [Apache Maven Checkstyle Plugin](http://maven.apache.org/plugins/maven-checkstyle-plugin/)

    Maven 构建时应用 Checkstyle 规范检查，目前要求必须消除 warning 以上级别的不规范项。

    ```xml
        <!-- checkstyle 代码规范 -->
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-checkstyle-plugin</artifactId>
            <version>3.1.1</version>
            <configuration>
                <!-- 注(1) -->
                <configLocation>docs/styleguide/checkstyle/google_checks-5.30.0-mods-maven-checkstyle-plugin-3.1.1.xml</configLocation>
                <consoleOutput>true</consoleOutput>
                <encoding>UTF-8</encoding>
                <consoleOutput>true</consoleOutput>
                <skip>false</skip>
                <linkXRef>false</linkXRef>
                <violationSeverity>warning</violationSeverity><!-- error --><!-- 注(2) -->
                <failsOnError>true</failsOnError><!-- 注(2) -->
                <!--<includes>**/DevPlatformApiApplication.java, **/TestController.java</includes>-->
                <excludes>**/generated/**.java</excludes>
            </configuration>
            <executions>
                <execution><!-- 注(3) -->
                    <id>checkstyle</id>
                    <phase>validate</phase>
                    <goals>
                        <goal>check</goal>
                    </goals>
                </execution>
                <!--<execution>-->
                    <!--<id>install</id>-->
                    <!--<phase>install</phase>-->
                    <!--<goals>-->
                        <!--<goal>checkstyle</goal>-->
                    <!--</goals>-->
                <!--</execution>-->
            </executions>
        </plugin>
    ```

    - **注(1)** Checkstyle 和规则的版本兼容性情况。我们期望一份 Checkstyle 的规则在各处相同，或至少保持一致。 但 Checkstyle 本身版本升级会有破坏前后兼容的情况；还有其他配套组件如 CheckStyle-IDEA 插件、 Maven Checkstyle Plugin 等也有版本兼容性限制。如 注(1) 这里引用的 google_checks-5.30.0-mods-maven-checkstyle-plugin-3.1.1.xml 就是基于 google_checks-5.30.0-checkstyle8.20-mods.xml 调整，适配最新版本的 Maven Checkstyle Plugin 。因为它的 3.0.0 版本过低、 3.1.0 版本默认支持到 checkstyle 8.19，都没达到当前配置要求版本的 checkstyle 8.20 ，所以直接使用最新的 3.1.1 版本，然后结果就是调整过的 google_checks-5.30.0-mods-maven-checkstyle-plugin-3.1.1.xml 。可对比查看了解详细，规则保持了一致。
    - **注(2)** 关于错误级别。当前期望开发过程中消除 warning 以上级别的项，所以由 error 改 warning 。当前 Maven 编译必须要求规则检查全部通过才能继续编译，所以 failsOnError 设为 true 。与错误级别有关的地方还有如下，且这几个配置间相互影响，按需要修改一致：
        - checkstyle config 里的 `<module name = "Checker"> <property name="severity" value="warning"/>` 默认级别。
    - **注(3)** 在编译的 validate 阶段我们就先执行 check goal 检查 checkstyle 规范 ，如果有没通过的项，就错误提示，并中断编译，直到开发人员处理好。另一个 checkstyle goal 一般只作 report 报告，显示不符合的项，但不中断编译。

2. [Apache Maven Site Plugin](https://maven.apache.org/plugins/maven-site-plugin/) 及相关配置

    提供 site 项目信息生成和部署信息，其中包含了 Checkstyle 等报告。 说明：

    - 统一在顶层 pom.xml 声明 maven-checkstyle-plugin 和 maven-site-plugin 。因为 maven-site-plugin 在每个项目已隐含，且 maven-checkstyle-plugin 又会被前者主动依赖，所以子模块对插件的引用不是必要的，未先引用也直接可用。
    - 已配置使用中文语言，包括 Checkstyle 配置里的 localeLanguage 和 pom.xml 中 maven-site-plugin 的 locales 。
    - 使用方法：
        - （根目录下） `mvn package` 或 `mvn clean install` 等。项目至少先编译后 package 。注意，目前在 validate 中使用 maven checkstyle:check 来检查 Java 源码代码风格规范，如果有 warning 以上的项，会中止构建，直到开发人员自检并修改好
        - （根目录下） `mvn site`
        - （根目录下） `mvn site:stage` 可选，这个命令要求前面 `mvn site` 已执行成功。在根目录下 targe/staging 目录生成支持多层项目结构、本地可预览访问的部署文件。直接打开顶层 index.html 可访问。注意，`mvn site` 生成的页面，上下层项目的链接还未正确指向，只有 stage 或 deploy 后那些链接才正确指向。
        - （根目录下） `mvn site:deploy` 使用默认 dev profile 的 url ，即使用 file:// 本地部署
        - （根目录下） `mvn site:deploy -P test` 或者指定 test profile 的 url 部署，例如可能是 scp , webdav 等
        - （子模块目录下） 也可以随时执行 `mvn site` 更新，然后再在根目录 stage 或 deploy

其他相关引申
=====================
1. FindBugs 待补充
2. Sonar 待补充
3. 关于 《阿里巴巴Java开发手册》及 alibaba/p3c 待补充

附录
=====================
涉及的安装包/离线安装包罗列如下。建议官网下载，或者在 IDEA 内置插件管理直接安装，只有在网络环境很不理想时，找可以下载的离线包，也建议优先 IDEA 的插件页面，再考虑其他可下载的来源：

* checkstyle-idea-5.30.0.zip 128MB
* EclipseFormatter.zip 6.8MB
* intellij-javadocs.zip 2.3MB
* FindBugs-IDEA-1.0.1.zip 7.7MB
