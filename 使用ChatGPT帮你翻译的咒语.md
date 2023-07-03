我使用了一个名为transhell的工具来实现国际化支持。这个工具的使用方法是将原脚本中向用户显示的文案修改为${TRANSHELL_CONTENT_CONTENTINFO}这样格式的变量，并通过一个以transhell结尾的翻译文件进行导入
这是一段使用了transhell翻译程序的例子，请学习它的使用方法
原程序如下，名为 run-me-to-read-readme
```
#!/bin/bash
#############################################################

echo -e "transhell is a solution to make bash shell script i18nlize. \nTo activate transhell, please add the load_transhell function in this script to your script and run it. To get more document, please read the README.md\n\nPlease press Enter to exit."
read 
```
修改后的程序为

```
#!/bin/bash

source /opt/durapps/transhell/transhell. sh
load_transhell_debug

#############################################################

echo -e "${TRANSHELL_CONTENT_README}"
read 

```

对应的transhell文件一，名为 run-me-to-read-readme_en_US.transhell 内容为
```
#!/bin/bash
TRANSHELL_CONTENT_README="transhell is a solution to make bash shell script i18nlize. \nTo activate transhell, please add the load_transhell function in this script to your script and run it. To get more document, please read the README.md\n\nPlease press Enter to exit."


```

对应的transhell文件二，名为 run-me-to-read-readme_zh_CN.transhell，内容为 

```
#!/bin/bash
TRANSHELL_CONTENT_README="transhell是一个bash国际化方案，可以让你的bash脚本拥有国际化的能力\n为了使用transhell,请在你的脚本的最上方加入本脚本中的 load_transhell 函数并执行之。获取更多使用文档，请查看README.md. \n\n请按回车退出。"


```

请你学习这种使用方法，我会在接下来的对话中给你发送需要做这样操作的程序源代码，请你帮我执行这样的操作。你不必解释接下来操作的步骤，直接告知我改好的程序和翻译好的transhell即可。



--------

I used a tool called transhell to achieve internationalization support. The usage of this tool involves modifying the text displayed to the user in the original script into variables in the format ${TRANSHELL_CONTENT_CONTENTINFO}, and importing it through a translation file ending with "transhell".
Here is an example of using the transhell translation program. Please learn its usage method.
The original script, named run-me-to-read-readme, is as follows:

#!/bin/bash
#############################################################

echo -e "transhell is a solution to make bash shell script i18nlize. \nTo activate transhell, please add the load_transhell function in this script to your script and run it. To get more document, please read the README.md\n\nPlease press Enter to exit."
read 

The modified script is:

#!/bin/bash

source /opt/durapps/transhell/transhell.sh
load_transhell_debug

#############################################################

echo -e "${TRANSHELL_CONTENT_README}"
read 

The corresponding transhell file, named run-me-to-read-readme_en_US.transhell, contains the following content:

#!/bin/bash
TRANSHELL_CONTENT_README="transhell is a solution to make bash shell script i18nlize. \nTo activate transhell, please add the load_transhell function in this script to your script and run it. To get more document, please read the README.md\n\nPlease press Enter to exit."


The corresponding transhell file, named run-me-to-read-readme_zh_CN.transhell, contains the following content:

#!/bin/bash
TRANSHELL_CONTENT_README="transhell是一个bash国际化方案，可以让你的bash脚本拥有国际化的能力\n为了使用transhell,请在你的脚本的最上方加入本脚本中的 load_transhell 函数并执行之。获取更多使用文档，请查看README.md. \n\n请按回车退出。"


Please study this usage method. I will send you the program source code that requires such operations in the next conversation. Please help me execute these operations. You don't need to explain the steps of the following operations. Just provide me with the modified program and the translated transhell files.