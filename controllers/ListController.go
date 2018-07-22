package controllers

import (
	"github.com/astaxie/beego"
	"Question/models"
)

type ListController struct {
	beego.Controller
}

func (c *ListController) Get() {
	c.TplName = "list.tpl"
	questionType, _ := c.GetInt("question_type", 1)
	var typeName string
	switch questionType {
		case 1: typeName = "登录"
		case 2: typeName = "图书馆"
		case 3: typeName = "成绩"
		case 4: typeName = "校园卡"
		case 5: typeName = "更多功能"
		case 6: typeName = "其他"
		default: typeName = "登录"
	}

	list, err := models.GetQuestionTypeList(questionType)
	c.Data["List"] = list
	c.Data["Typename"] = typeName
	c.Data["Error"] = err
}
