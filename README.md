# transhell
## transhell is a bash i18n solution, which can make your bash script have the ability of i18n



In order to use transshell, please add the `load_ Transshell` function in `example` at the top of your script and execute it.

You can also import this function through `source`, see `example-source`, or use `source /opt/dupps/transhell/transhell. sh` after installing the deb package of `transhell`



### Guide
**It is recommended to combine the examples in the example directory of this repo**

0. Import the function

```
source /opt/dupps/transhell/transhell. sh
load_transhell

```

1. Change the text in the script that needs to be i18ned into mnemonic variable(Like `$TRANSHELL_CONTENT_XXXXXX`)



Original：
```
echo "This is a test doc"
```

After

```
echo “${TRANSHELL_CONTENT_THIS_IS_A_TEST_DOC}”
```



2. Create a new `transshell` directory in the same directory as the script, and place translation files in it



Name it as：`{shellname}_{language code}.transhell`

e.g. `transhell/test_en_US.transhell` or `transhell/test_zh_CN.transhell`



```
TRANSHELL_CONTENT_THIS_IS_A_TEST_DOC="This is a test doc"
```
Then run the shell.



> Notes:
> 1. `load_transhell` will first try to load `en_US` transhell, and then try to overwrite it with the transhell file in the language of the running environment. This feature can ensure that English is used as fallback when all or part of the transhell content are missing. If you do not want to use English as fallback, please change the loading order in the script

> 2. Except in the directory where the script is located, `load_ transhell` will also try to read from `/usr/share/{script file name}/transhell/`. The priority is: the directory where the script is located > /usr/share.



