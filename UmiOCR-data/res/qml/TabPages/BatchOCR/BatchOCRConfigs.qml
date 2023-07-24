// ==============================================
// =============== 批量OCR的配置项 ===============
// ==============================================

import QtQuick 2.15
import "../../Configs"

Configs {
    category_: "BatchOCR"

    configDict: {
        // OCR参数
        "ocr": qmlapp.globalConfigs.ocrManager.deploy(this, "ocr"), 

        // 任务参数
        "mission": {
            "title": qsTr("批量任务"),
            "type": "group",

            "dirType": {
                "title": qsTr("保存到"),
                "optionsList": [
                    ["source", qsTr("图片原目录")],
                    ["specify", qsTr("指定目录")],
                ],
            },
            "dir": {
                "title": qsTr("指定目录"),
                "toolTip": qsTr("必须先指定“保存到指定目录”才生效"),
                "type": "file",
                "selectExisting": true, // 选择现有
                "selectFolder": true, // 选择文件夹
                "dialogTitle": qsTr("OCR结果保存目录"),
            },
            "fileNameFormat": {
                "title": qsTr("文件名格式"),
                "toolTip": qsTr("无需填写后缀。支持插入以下占位符：\n%date 日期时间\n%name 原文件夹名/文件名\n举例：[OCR]_%name_%date\n生成：[OCR]_我的图片_2023-09-01_12-13.txt\n如果不想新的生成文件覆盖旧文件，请在文件名中添加 %date 。"),
                "default": "[OCR]_%name_%date",
                "advanced": true, // 高级选项
            },
            "datetimeFormat": {
                "title": qsTr("日期时间格式"),
                "toolTip": qsTr("文件名中 %date 的日期格式。支持插入以下占位符：\n%Y 年、 %m 月、 %d 日、 %H 小时、 \n%M 分钟、 %S 秒 、 %unix 时间戳 \n举例：%Y年%m月%d日_%H-%M\n生成：2023年09月01日_12-13.txt"),
                "default": "%Y-%m-%d_%H-%M",
                "advanced": true, // 高级选项
            },

            "filesType": {
                "title": qsTr("保存文件类型："),
                "type": "group",
                "enabledFold": true,
                "fold": false,

                "txt": {
                    "title": qsTr(".txt 标准格式"),
                    "toolTip": qsTr("含原图片文件名和识别文字"),
                    "default": true,
                },
                "txtPlain": {
                    "title": qsTr(".txt 纯文字"),
                    "toolTip": qsTr("只含识别文字"),
                    "default": false,
                },
                "txtSingle": {
                    "title": qsTr(".txt 单独文件"),
                    "toolTip": qsTr("对每张图片，生成同名txt文件"),
                    "default": false,
                },
            },

            "ingoreBlank": {
                "title": qsTr("输出忽略空白图片"),
                "toolTip": qsTr("若图片没有文字或识别失败，也不会输出错误提示信息"),
                "default": true,
            },
            "recurrence": {
                "title": qsTr("递归读取子文件夹"),
                "default": false,
            },

            "scheduledTasks": qmlapp.globalConfigs.utilsDicts.getScheduledTasks(), // 计划任务
        },
    }
}


/*
输出文件类型
    .txt 标准格式
    .txt 纯文本格式
    .txt 多个独立文件
    .jsonl 原始信息
*/