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
	question_type, _ := c.GetInt("question_type", 1)
	list, err := models.GetQuestionTypeList(question_type)
	c.Data["List"] = list
	c.Data["Error"] = err
}
