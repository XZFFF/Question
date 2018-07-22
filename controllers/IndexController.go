package controllers

import (
	"Question/models"
)

type IndexController struct {
	BaseController
}


func (c *IndexController) Get() {
	c.TplName = "index.tpl"
	list, err := models.GetQuestionList()
	c.Data["List"] = list
	c.Data["Error"] = err
}

func (c *IndexController) Post() {
	c.TplName = "index.tpl"
	keyword := c.GetString("keyword")
	list, _ := models.SearchQuestionList(keyword)
	c.JsonResult(0, "ok", list)
	return
}
