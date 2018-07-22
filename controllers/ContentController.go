package controllers

import (
	"Question/models"
)

type ContentController struct {
	BaseController
}

func (c *ContentController) Get() {
	c.TplName = "content.tpl"
	id, _ := c.GetInt("id", 1)
	question, err := models.GetById(id)
	c.Data["Question"] = question
	c.Data["Content"] = question.Content
	c.Data["Error"] = err
}
